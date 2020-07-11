utils = require("utils")

function drawPlayer(player)
    cam:draw(function (l, t, w, h)
    love.graphics.translate(player.body:getX() , player.body:getY())
    love.graphics.rotate(player.body:getAngle())
    love.graphics.translate( -player.body:getX() , -player.body:getY())    
    love.graphics.setColor(utils.hexToRGB("#2149db"))
    love.graphics.rectangle("fill", player.body:getX() - 25, player.body:getY() - 25, 50, 50)
    end)
    cam:draw(function (l, t, w, h)
    love.graphics.setColor(utils.hexToRGB("#000000"))
    love.graphics.rectangle("fill", player.body:getX() - 23, player.body:getY() - 23, 46, 46)
    love.graphics.setColor(utils.hexToRGB("#2149db"))
    love.graphics.rectangle("fill", player.body:getX() - 5, player.body:getY() - 25, 10, 10)
    end)
    love.graphics.rotate ( -player.body:getAngle() )
end

function createPlayer(x, y, radius, speed)
    return {
        x = x,
        y = y,
        radius = radius,
        speed = speed,
        aimx = x + radius,
        aimy = y 
    }
end
