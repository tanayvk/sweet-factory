function drawPlayer(player)
    love.graphics.setColor(0.8, 0.3, 0.4)
    love.graphics.circle("fill", player.body:getX(), player.body:getY(), 25)
    love.graphics.setColor(0.8, 0.5, 0.5)
    love.graphics.circle("fill", player.body:getX(), player.body:getY(), 15)
end

function updatePlayer(player)

end

function createPlayer(x, y, radius, speed)
    return {
        x = x,
        y = y,
        radius = radius,
        speed = speed,
    }
end
