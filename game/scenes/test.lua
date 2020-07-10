scene = {}

local socket = require "socket"
 
local address, port = "192.168.0.105", 12345
local updaterate = 0.1 -- how long to wait, in seconds, before requesting an update
 
local t
local gamera = require("vendor.gamera")
local vector = require("vendor.vector")

require("tiled")
require("controller")
require("player")
require("physics")

function scene:load()
    -- Create physics world
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 0, true)

    -- Add player to the world
    player = createPlayer(100, 100, 25, 200)
    player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
    player.shape = love.physics.newCircleShape(player.radius)
    player.fixture = love.physics.newFixture(player.body, player.shape)

    -- Create player controller
    controller_size = height / 6
    move_controller = createAimController(
        50 + controller_size*6/5,
        height - 50 - controller_size*6/5,
        {0.2, 0.2, 0.2},
        {0.2, 0.2, 0.2},
        controller_size*3/5,
        controller_size
    )
    
    map = loadTiledMap("maps/test") cam = gamera.new(0, 0, map.tilewidth * map.width, map.tileheight*map.height)
    cam:setWindow(0, 0, width, height)

    worldAddMapEdges(map.width*map.tilewidth, map.height*map.tileheight)

    udp = socket.udp()
    udp:settimeout(0)
 
    udp:setpeername(address, port)
 
    math.randomseed(os.time()) 
    id = tostring(math.random(99999))
    local dg = string.format("connect %s", id)
    udp:send(dg) -- the magic line in question.
 
    t = 0 -- (re)set t to 0
end

function scene:draw()
    love.graphics.clear(0.8, 0.8, 0.8)

    -- camera should follow player
    cam:setPosition(player.body:getX(), player.body:getY())
    cam:draw(function (l, t, w, h)

    -- Draw the map
    love.graphics.setColor(1, 1, 1, 1)
    map:draw()

    -- Draw the player
    drawPlayer(player)

    end )

    controllerDraw(move_controller)
end

function scene:update(dt)
    -- Update game physics
    world:update(dt)

    -- Update controller
    controllerUpdate(move_controller)

    move = controllerGetValue(move_controller)
    player.body:setLinearVelocity(player.speed * move.x, player.speed * move.y)

    t = t + dt -- increase t by the deltatime

    --[[
    if t > updaterate then
        local dg = string.format("%s %s %f %f", id, 'move', move.x, move.y)
        udp:send(dg)	
 
        t=t-updaterate -- set t for the next round
    end
    --]]
    dg = string.format("%s update 0 0", id)
    udp:send(dg)
    repeat
        data, msg = udp:receive()
        print("received", data, msg)
 
        if data then
            print("received")
            ent, cmd, parms = data:match("^(%S*) (%S*) (.*)")

            if ent ~= id then
                local x, y = parms:match("^(%-?[%d.e]*) (%-?[%d.e]*)$")
                player.body:setLinearVelocity(player.speed * x, player.speed * y)
            end
 
        elseif msg ~= 'timeout' then 
            error("Network error: "..tostring(msg))
        end
    until not data 
end

function scene:mousereleased(x, y, button, istouch, presses)
    controllerMouseReleased(x, y, button, istouch, presses , move_controller)
end

return scene;
