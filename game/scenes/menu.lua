scene = {}

function scene:load()
    require("button")
    button = buttonCreate(width/2 - 100, height/2 - 30 - 25, 200, 50, "PLAY", function() playScene("test") end)
    server = buttonCreate(width/2 - 100, height/2 + 30 - 25, 200, 50, "SERVER", function() playScene("test", {server=true}) end)
end

function scene:draw()
    buttonDraw(button)
    buttonDraw(server)
end

function scene:mousepressed(x, y)
    buttonMousePressed(button, x, y)
    buttonMousePressed(server, x, y)
end

function scene:mousereleased(x, y)
    buttonMouseReleased(button, x, y)
    buttonMouseReleased(server, x, y)
end

return scene
