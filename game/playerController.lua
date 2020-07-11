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
    moveController = createController(moveControllerX , moveControllerY , moveControllerInnerColor , moveControllerOuterColor , innerRadius , outerRadius , false, { x =  0 , y = 0 , width = love.graphics.getWidth() / 2 ,height = love.graphics.getHeight()})
    aimController = createController(aimControllerX , aimControllerY , aimControllerInnerColor , aimControllerOuterColor , innerRadius , outerRadius , true, { x = love.graphics.getWidth() /2  , y = 0 , width = love.graphics.getWidth()/2  , height = love.graphics.getHeight() } )
end

function playerControllerUpdate( player )
    controllerUpdate( aimController )
    controllerUpdate( moveController )

    local currentMove = controllerGetValue( moveController )
    player.body:setLinearVelocity(currentMove.x*player.speed , currentMove.y*player.speed )

    local currentAim = controllerGetValue( aimController )
    player.body:setAngle(math.atan2(currentAim.y, currentAim.x))
end

function playerControllerMousePressed ( x , y )
    controllerMousePressed (aimController, x, y)
    controllerMousePressed (moveController, x, y)
end

function playerControllerMouseReleased ( x , y )
    controllerMouseReleased (aimController, x, y)
    controllerMouseReleased (moveController, x, y)
end

function playerControllerMouseMoved ( x , y, dx, dy )
    controllerMouseMoved (aimController, x, y , dx, dy)
    controllerMouseMoved (moveController, x, y, dx, dy)
end

function playerControllerDraw()
    controllerDraw(moveController)
    controllerDraw(aimController)
end    
