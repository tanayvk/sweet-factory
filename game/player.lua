function drawPlayer(player)
    love.graphics.setColor(0.8, 0.3, 0.4)
    love.graphics.circle("fill", player.x, player.y, player.radius)
    love.graphics.setColor(0.8, 0.5, 0.5)
    love.graphics.circle("fill", player.x, player.y, player.radius * 2 / 3 )
    love.graphics.setColor( 0 , 15 , 0 , 1 )
    love.graphics.circle ( "fill" , player.aimx , player.aimy , 4 )
end

function createPlayer(x, y, radius, speed  )
    return {
        x = x,
        y = y,
        radius = radius,
        speed = speed,
        aimx = x + radius,
        aimy = y 
    }
end
