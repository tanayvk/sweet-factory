local vector = require "vendor.vector"
local utils = require "utils"

function createController(x , y , innerColor, outerColor , innerRadius, outerRadius , fixed, region)
    -- Set the initial alphas
    innerColor[4] = 0.5
    outerColor[4] = 0.07

    -- Default to a fixed (immovable) controller
    if (fixed == nil) then fixed = true end

    -- Default region should be the whole screen
    local default_region = { x = 0, y = 0, width = width, height = height }
    return {
        outerX = x,
        outerY = y,
        innerX = x, 
        innerY = y,
        locationX = x,
        locationY = y,
        outerRadius = outerRadius,
        innerRadius = innerRadius,
        outerColor = outerColor,
        innerColor = innerColor,
        region = region or default_region,
        fixed = fixed
    }
end

function controllerDraw(controller)
    -- Just draw the two cirles denoting the position and value of the controller
    love.graphics.setColor(controller.outerColor)
    love.graphics.circle ("fill", controller.outerX, controller.outerY, controller.outerRadius)
    love.graphics.setColor( controller.innerColor)
    love.graphics.circle ("fill", controller.innerX, controller.innerY, controller.innerRadius)
end

function controllerMousePressed(controller, x, y)
    -- Movable controller repositions itself upon mouse press or touch

    print("this is the bad guy")
    if (not controller.fixed and utils.pointInsideRect({x=x, y=y}, controller.region)) then
        controller.outerX = x
        controller.outerY = y
    end
end

function controllerMouseReleased(controller, x, y)
    -- Reset controller upon mouse or touch release
    if (controllerGetCoordinates(controller)) then
        controllerReset(controller)
    end
end

function controllerGetValue(controller)
    -- The value of a controller is the normalized value of the vector point from the position
    -- of the outer circle to the position of the inner circle
    local innerVector = vector(controller.innerX, controller.innerY)
    local outerVector = vector(controller.outerX, controller.outerY)

    return (innerVector - outerVector) / controller.outerRadius
end

function controllerReset(controller)
    controller.innerColor[4] = 0.5
    controller.outerColor[4] = 0.07
    controller.outerX = controller.locationX
    controller.outerY = controller.locationY
    controller.innerX = controller.outerX
    controller.innerY = controller.outerY
end

function controllerGetCoordinates ( controller )
    -- Return the position of the first mouse down or touch coordinate which lies inside
    -- the controller region

    if ( love.mouse.isDown(1) == true ) then
        local mouseX, mouseY = love.mouse.getPosition()
        if (utils.pointInsideRect({x = mouseX, y = mouseY}, controller.region)) then
            return mouseX, mouseY
        end
    end

    local touches = love.touch.getTouches()
    for i , id in ipairs(touches) do 
        local touchX, touchY = love.touch.getPosition(id)
        print("here: ", touchX, touchY)
        if (utils.pointInsideRect({x = touchX, y = touchY}, controller.region)) then
            return touchX, touchY
        end
    end

    -- No coordinate
    return false
end         

function controllerMouseMoved(controller, x, y, dx, dy)
    if (not controller.fixed) then
        local controllerX, controllerY = controllerGetCoordinates(controller)
        
        if (not controllerX) then
            return end

        local v = vector ( controllerX - controller.outerX , controllerY - controller.outerY )
        local magnitude = v:getmag()

        if ( magnitude >= controller.outerRadius + 15 ) then
            controller.outerX = controller.outerX + dx
            controller.outerY = controller.outerY + dy
        end
     end
end

function controllerUpdate (controller)
    x, y = controllerGetCoordinates(controller)

    if (not x) then
        controllerReset(controller)
    else
        controller.innerColor[4] = 0.9
        controller.outerColor[4] = 0.2
        local v = vector ( x - controller.outerX , y - controller.outerY )
        local magnitude = v:getmag()

        controller.innerX = x
        controller.innerY = y

        if ( magnitude > controller.outerRadius ) then
            controller.innerX = controller.outerX + (v.x / magnitude ) * controller.outerRadius 
            controller.innerY = controller.outerY + (v.y / magnitude ) * controller.outerRadius
        end
    end
end    
