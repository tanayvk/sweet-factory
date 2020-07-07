scene = {}

function scene:load()
    require("button")
    button = buttonCreate(width/2 - 100, height/2 - 25, 200, 50, "PLAY", function() playScene("test") end)
end

function scene:draw()
    buttonDraw(button)
end

function scene:mousepressed(x, y)
    buttonMousePressed(button, x, y)
end

function scene:mousereleased(x, y)
    buttonMouseReleased(button, x, y)
end

return scene
