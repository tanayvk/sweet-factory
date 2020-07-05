local gamera = require("vendor.gamera")
local vector = require("vendor.vector")

require("tiled")
require("controller")
require("player")

function love.load()
    -- Query basic info
    width, height = love.graphics.getPixelDimensions()
    width = love.window.fromPixels(width)
    height = love.window.fromPixels(height)

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
    move_controller = createController(
        50 + controller_size*6/5,
        height - 50 - controller_size*6/5,
        {0.2, 0.2, 0.2},
        {0.2, 0.2, 0.2},
        controller_size*3/5,
        controller_size
    )

    map = loadTiledMap("maps/test")
    cam = gamera.new(0, 0, map.tilewidth * map.width, map.tileheight*map.height)
end

function love.draw()
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

function love.update(dt)
    -- Update game physics
    world:update(dt)

    -- Update controller
    controllerUpdate(move_controller)

    move = controllerGetValue(move_controller)
    player.body:setLinearVelocity(player.speed * move.x, player.speed * move.y)
end

function love.mousereleased(x, y, button, istouch, presses )
    controllerMouseReleased(x, y, button, istouch, presses , move_controller )
end
