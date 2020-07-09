require("player")
require("controller")
local height , width = love.window.getHeight() , love.window.getWidth()
local outerRadius = 120
local innerRadius = 75
local aimControllerX = width - ( outerRadius + 30 )
local aimControllerY = height - ( outerRadius + 30 )
local moveControllerX = outerRadius + 30
local moveControllerY = height - ( outerRadius + 30 )
local aimControllerInnerColor = { 1 , 0 , 0 , 0.5 }
local aimControllerOuterColor = { 1 , 0 , 0 , 0.1 }
local moveControllerInnerColor = { 0 , 0 , 1 , 0.5 }
local moveControllerOuterColor = { 0 , 0 , 1 , 0.1 }


function playerControllerCreate( player )
    moveController = createController(moveControllerX , moveControllerY , moveControllerInnerColor , moveControllerOuterColor , innerRadius , outerRadius )
    aimController = createController(aimControllerX , aimControllerY , aimControllerInnerColor , aimControllerOuterColor , innerRadius , outerRadius )
end

function playerControllerUpdate( player )
    local currentAim = controllerGetValue( aimController )
    local tanTheta = currentAim.y / currentAim.x 
    local inclination = math.atan( tanTheta )
    player.body:setAngle( inclination )

    local currentMove = controllerGetValue( moveController )
    player.body:setLinearVelocity( player.speed * currentMove.x , player.speed * currentMove.y )
end

function playerControllerDraw()
    controllerDraw(moveController)
    controllerDraw(aimController)
end    
