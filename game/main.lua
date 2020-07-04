local gamera = require("vendor/gamera")
require("tiled")

function love.load()
    width, height = love.graphics.getWidth(), love.graphics.getHeight()
    player_x, player_y = width / 2, height / 2
    print(player_x, player_y)
    player_width, player_height = 50, 50
    player_speed = 100

    cam = gamera.new(0, 0, 2000, 2000)

    map = loadTiledMap("maps/test")
end

function love.draw()
    love.graphics.clear(0.8, 0.8, 0.8)

    cam:draw(function (l, t, w, h)

    -- Draw the map
    love.graphics.setColor(1, 1, 1, 1)
    map:draw()

    -- Draw the player
    love.graphics.setColor(0.4, 0.6, 0.9)
    love.graphics.rectangle("fill",
        player_x - player_width / 2,
        player_y - player_height / 2,
        player_width,
        player_height)

    end )
end

function love.update(dt)
    -- camera should follow player
    cam:setPosition(player_x, player_y)

    -- configure player movement (for testing)
    if love.keyboard.isDown("up", "w") then
        player_y = player_y - player_speed * dt
    end
    if love.keyboard.isDown("down", "s") then
        player_y = player_y + player_speed * dt
    end
    if love.keyboard.isDown("right", "d") then
        player_x = player_x + player_speed * dt
    end
    if love.keyboard.isDown("left", "a") then
        player_x = player_x - player_speed * dt
    end
end
