utils = require("utils")

local playerShaderCode = [[

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
    vec4 texturecolor = Texel(tex, texture_coords);
    return texturecolor * color;
}

]]

local function drawAtAngle(x, y, angle, Draw)
    love.graphics.translate(x, y)
    love.graphics.rotate(angle)
    love.graphics.translate(-x, -y)    
    Draw()
    love.graphics.translate(x, y)
    love.graphics.rotate(-angle)
    love.graphics.translate(-x, -y)    

end

function drawPlayer(player)
    love.graphics.setShader(playerShader)
    cam:draw(function (l, t, w, h)

    if player.aiming then
        drawAtAngle(player.body:getX(), player.body:getY(), player.aimAngle, function()
            love.graphics.setColor(1, 0.9, 0.9, 0.4)
            love.graphics.rectangle("fill", player.body:getX(), player.body:getY() - 20, 40 + 40*player.aimSize, 40)
        end)
    end

    drawAtAngle(player.body:getX(), player.body:getY(), player.body:getAngle(), function()
        -- Two circles for the player
        love.graphics.setColor(utils.hexToRGB("#000000"))
        love.graphics.circle("fill", player.body:getX(), player.body:getY(), 25)
        love.graphics.setColor(utils.hexToRGB("#2149db"))
        love.graphics.circle("fill", player.body:getX(), player.body:getY(), 23)
        love.graphics.setColor(utils.hexToRGB("#000000"))
        love.graphics.circle("fill", player.body:getX() + 18, player.body:getY() - 7, 2)
        love.graphics.setColor(utils.hexToRGB("#000000"))
        love.graphics.circle("fill", player.body:getX() + 18, player.body:getY() + 7, 2)
    end)

    end)

    love.graphics.setShader()
end

function createPlayer(x, y, radius, speed)
    playerShader = love.graphics.newShader(playerShaderCode)

    local player = {
        x = x,
        y = y,
        radius = radius,
        speed = speed,
    }

    player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
    player.shape = love.physics.newCircleShape(player.radius)
    player.fixture = love.physics.newFixture(player.body, player.shape)

    return player
end
