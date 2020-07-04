function love.load()
    width, height = love.graphics.getWidth(), love.graphics.getHeight()
end

function love.draw()
    love.graphics.clear(0.8, 0.8, 0.8, 1)
    love.graphics.setColor(0.5, 0.3, 0.9, 1)
    love.graphics.rectangle("fill", width / 2 - 100, height / 2 - 100, 200, 200)
end
