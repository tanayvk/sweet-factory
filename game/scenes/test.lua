scene = {}

local socket = require "socket"
 
local address, port = "192.168.0.105", 12345
local updaterate = 0.1 -- how long to wait, in seconds, before requesting an update
 
local gamera = require("vendor.gamera")
local vector = require("vendor.vector")

require("tiled")
require("playerController")
require("player")
require("physics")

function scene:load(options)
    -- Should we start the server?
    network = require "network"
    network:init()
    if (options and options.server) then
        isServer = true
        network:startServer()
    else
        network:startClient()
    end

    -- Create physics world
    love.physics.setMeter(64)
    world = love.physics.newWorld(0, 0, true)

    -- Add player to the world
    player = createPlayer(100, 100, 25, 250)
    -- Create player controller
    playerControllerCreate(player)
    
    map = loadTiledMap("maps.test")
    cam = gamera.new(0, 0, map.tilewidth * map.width, map.tileheight*map.height)
    cam:setWindow(0, 0, love.graphics.getWidth(), love.graphics.getHeight())

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

    playerControllerDraw( player )
end

function scene:update(dt)
    -- Tick server
    network:tick(dt)

    -- Update controller
    playerControllerUpdate( player )

    -- Update game physics
    world:update(dt)
end

function scene:touchpressed(id, x, y, dx, dy, pressure)
    playerControllerTouchPressed(id, x, y)
end

function scene:touchreleased(id, x, y, dx, dy, pressure)
    playerControllerTouchReleased(id, x, y)
end

function scene:touchmoved(id, x, y, dx, dy, pressure)
    playerControllerTouchMoved(id, x, y, dx, dy)
end

function scene:mousepressed(x, y)
    playerControllerMousePressed( x, y )
end

function scene:mousereleased(x, y)
    playerControllerMouseReleased( x, y )
end

function scene:mousemoved(x, y, dx, dy, istouch)
    playerControllerMouseMoved(x, y, dx, dy)
end

return scene
