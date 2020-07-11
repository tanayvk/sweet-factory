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

local function get_own_address()
  local s = assert(socket.udp())
  assert(s:setpeername("192.168.0.1", 80))
  local host = s:getsockname()
  s:close()
  return host
end

function scene:load(options)
    print(get_own_address())
    -- Should we start the server?
    if (options and options.server) then
        serverThread = love.thread.newThread("server.lua")
        serverThread:start()
    else
        udp = socket.udp()
        udp:setoption('broadcast', true)
        udp:setoption('dontroute', true)
        udp:settimeout(0)
     
        math.randomseed(os.time()) 
        id = tostring(math.random(99999))
        local dg = string.format("check")
        udp:sendto(dg, "192.168.0.255", 12345)
     
        t = 0 -- (re)set t to 0
    end

    -- Create physics world
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 0, true)

    -- Add player to the world
    player = createPlayer(100, 100, 25, 200)
    player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
    player.shape = love.physics.newRectangleShape(2*player.radius, 2*player.radius)
    player.fixture = love.physics.newFixture(player.body, player.shape)

    -- Create player controller
    controller_size = height / 6
    move_controller = createController(
        50 + controller_size*6/5,
        height - 50 - controller_size*6/5,
        {0.2, 0.2, 0.2},
        {0.2, 0.2, 0.2},
        controller_size*3/5,
        controller_size
    )
    
    map = loadTiledMap("maps.test") cam = gamera.new(0, 0, map.tilewidth * map.width, map.tileheight*map.height)
    cam:setWindow(0, 0, width, height)

    worldAddMapEdges(map.width*map.tilewidth, map.height*map.tileheight)

end

function scene:draw()
    love.graphics.clear(0, 0, 0, 1)

    -- camera should follow player
    cam:setPosition(player.body:getX(), player.body:getY())
    cam:draw(function (l, t, w, h)
        -- Draw the map
        love.graphics.setColor(1, 1, 1, 1)
        map:draw()
    end )

    --Draw the player
    drawPlayer(player)

    controllerDraw(move_controller)
end

function scene:update(dt)
    -- Update game physics
    world:update(dt)

    -- Update controller
    controllerUpdate(move_controller)

    move = controllerGetValue(move_controller)
    player.body:setLinearVelocity(player.speed * move.x, player.speed * move.y)

    if (not serverThread) then
    t = t + dt -- increase t by the deltatime

    --[[
    dg = string.format("%s update 0 0", id)
    udp:send(dg)
    repeat
        data, msg = udp:receive()
 
        if data then
            print(data)
            --[[
            ent, cmd, parms = data:match("^(%S*) (%S*) (.*)")

            if ent ~= id then
                local x, y = parms:match("^(%-?[%d.e]*) (%-?[%d.e]*)$")
                player.body:setLinearVelocity(player.speed * x, player.speed * y)
            end
            --]]
            --[[
 
        elseif msg ~= 'timeout' then 
            error("Network error: "..tostring(msg))
        end
    until not data 
    --]]
    end
end

function scene:mousereleased(x, y, button, istouch, presses)
    controllerMouseReleased(x, y, button, istouch, presses , move_controller)
end

return scene
