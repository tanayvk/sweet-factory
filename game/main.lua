scene = {}

function love.load()
    -- Set fullscreen on Android
    if (love.system.getOS() == "Android") then
        love.window.setFullscreen(true)
    else
        love.window.setMode(780, 360)
    end

    -- Query basic info
    width, height = love.graphics.getWidth(), love.graphics.getHeight()
    print(width, height)

    playScene("menu")
end

function love.draw()
    if scene.draw then scene:draw() end
end

function love.update(dt)
    if scene.update then scene:update(dt) end
end

function love.mousepressed(x, y, button, istouch, presses)
    if scene.mousepressed then scene:mousepressed(x, y, button, istouch, presses) end
end

function love.mousereleased(x, y, button, istouch, presses)
    if scene.mousereleased then scene:mousereleased(x, y, button, istouch, presses) end
end

function love.mousemoved(x, y, dx, dy, istouch)
    if scene.mousemoved then scene:mousemoved(x, y, dx, dy) end
end

function love.touchpressed(id, x, y, dx, dy, pressure)
    if scene.touchpressed then scene:touchpressed(id, x, y, dx, dy, pressure) end
end

function love.touchreleased(id, x, y, dx, dy, pressure)
    if scene.touchreleased then scene:touchreleased(id, x, y, dx, dy, pressure) end
end

function love.touchmoved(id, x, y, dx, dy, pressure)
    if scene.touchmoved then scene:touchmoved(id, x, y, dx, dy, pressure) end
end

function playScene(scene_name, options)
    scene = require("scenes." .. scene_name)
    if scene.load then scene:load(options) end
end
