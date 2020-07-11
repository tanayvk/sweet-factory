require("player")
require("controller")



function playerControllerCreate( player )
    local outerRadius = 75
local innerRadius = 45
local width , height = love.graphics.getWidth() , love.graphics.getHeight()
local aimControllerX = width - ( outerRadius + 30 )
local aimControllerY = height - ( outerRadius + 30 )
local moveControllerX = outerRadius + 30
local moveControllerY = height - ( outerRadius + 30 )
local aimControllerInnerColor = { 1 , 0 , 0 , 0.5 }
local aimControllerOuterColor = { 1 , 0 , 0 , 0.1 }
local moveControllerInnerColor = { 0 , 0 , 1 , 0.5 }
local moveControllerOuterColor = { 0 , 0 , 1 , 0.1 }
    moveController = createController(moveControllerX , moveControllerY , moveControllerInnerColor , moveControllerOuterColor , innerRadius , outerRadius , { x =  0 , y = 0 , width = love.graphics.getWidth() / 2 ,height = love.graphics.getHeight()})
    aimController = createController(aimControllerX , aimControllerY , aimControllerInnerColor , aimControllerOuterColor , innerRadius , outerRadius , { x = love.graphics.getWidth() /2  , y = 0 , width = love.graphics.getWidth()/2  , height = love.graphics.getHeight() } )
end

function playerControllerUpdate( player )
    controllerUpdate( aimController )
    local currentAim = controllerGetValue( aimController )
    local tanTheta = currentAim.y / currentAim.x 
    local inclination = math.atan( tanTheta )
    player.body:setAngle( inclination )
    
    controllerUpdate( moveController )
    local currentMove = controllerGetValue( moveController )
    player.body:setLinearVelocity(currentMove.x*player.speed , currentMove.y*player.speed )
end

function playerControllerMouseReleased ( x , y )
    controllerMouseReleased ( x , y , aimController )
    controllerMouseReleased ( x , y , moveController )
end

function playerControllerDraw()
    controllerDraw(moveController)
    controllerDraw(aimController)
    drawPlayer(player)
end    
