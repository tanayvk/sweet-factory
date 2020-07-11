local vector = require "vendor.vector"

function createController(x , y , innerColor, outerColor , innerRadius, outerRadius , region )
    innerColor[4] = 0.5
    outerColor[4] = 0.07
     return 
     {
        outerX = x,
        innerX = x, 
        outerY = y,
        innerY = y,
        outerRadius = outerRadius,
        innerRadius = innerRadius,
        outerColor = outerColor,
        innerColor = innerColor ,
        region = region 
     }
end

function controllerDraw(controller)
    love.graphics.setColor(controller.outerColor)
    love.graphics.circle ( "fill" , controller.outerX , controller.outerY ,  controller.outerRadius )
    love.graphics.setColor( controller.innerColor)
    love.graphics.circle ( "fill" , controller.innerX , controller.innerY ,controller.innerRadius )
end

function controllerMouseReleased(x, y , controller )
    controller.innerColor[4] = 0.5
    controller.outerColor[4] = 0.07
    controller.innerX = controller.outerX
    controller.innerY = controller.outerY
end

function controllerGetValue(controller)
    local v = vector ( (controller.innerX - controller.outerX )/controller.outerRadius , ( controller.innerY - controller.outerY )/controller.outerRadius )
    return v
end

function controllerGetCoordinates ( controller )
    if ( love.mouse.isDown(1) == true ) then
        X, Y = love.mouse.getPosition()
        if ( X >= controller.region.x  and X <= controller.region.x + controller.region.width and Y >= controller.region.y and Y <= controller.region.y + controller.region.height) then
        return vector (love.mouse.getX() , love.mouse.getY())
            end
    end
    touches = love.touch.getTouches()
    for i , id in ipairs(touches) do 
        local X , Y = love.touch.getPosition(id)
        if ( X >= controller.region.x  and X <= controller.region.x + controller.region.width and Y >= controller.region.y and Y <= controller.region.y + controller.region.height) then
            print("in the region")
            return vector( X , Y )
        end    
    end
end         

function controllerUpdate (controller)
  
    if ( controllerGetCoordinates(controller) == nil ) then
        controller.innerColor[4] = 0.5
        controller.outerColor[4] = 0.07
        controller.innerX = controller.outerX
        controller.innerY = controller.outerY
    end    
    if ( not ( controllerGetCoordinates(controller) == nil ) ) then
        local X , Y = controllerGetCoordinates(controller).x , controllerGetCoordinates(controller).y
        controller.innerColor[4] = 0.9
        controller.outerColor[4] = 0.2
        v = vector ( X - controller.outerX , Y - controller.outerY )
        local magnitude = math.sqrt(v:magSq())
        if ( magnitude <= controller.outerRadius ) then
            controller.innerX = X
            controller.innerY = Y
        end
        if ( magnitude > controller.outerRadius ) then
            controller.innerX = controller.outerX + (v.x / magnitude ) * controller.outerRadius 
            controller.innerY = controller.outerY + (v.y / magnitude ) * controller.outerRadius
        end
    end
end    
        
        
    
