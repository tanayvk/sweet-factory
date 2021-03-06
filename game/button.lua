font = love.graphics.newFont("fonts/font.ttf", 50)
white = { 255 , 255 , 255 , 0.5 }
local buttonIsPressed = false 
function buttonCreate( x , y , width , height , label , onClick )
    return 
    {
        topLeftX = x ,
        topLeftY = y ,
        width = width ,
        height = height , 
        label = label ,
        color = white ,
        onClick = onClick
    }
end

function buttonDraw( button )
    love.graphics.setColor(button.color)
    love.graphics.rectangle ( "fill" , button.topLeftX , button.topLeftY , button.width , button.height )
    local width = font:getWidth( button.label )
    local height = font:getHeight ( button.label )
    local startX = button.topLeftX + button.width / 2 - width / 2
    local startY = button.topLeftY + button.height / 2 - height / 2
    love.graphics.setFont(font)
    love.graphics.print( button.label , startX , startY )
end

   
function buttonMousePressed ( button ,x , y )
    if (  x >= button.topLeftX and x <= button.topLeftX + button.width and y >= button.topLeftY and y <= button.topLeftY + button.height and buttonIsPressed == false ) then
        button.color = { 255 , 0 , 255 , 1 }
        buttonIsPressed = true
    end
end

function buttonMouseReleased( button , x , y )
    if ( x >= button.topLeftX and x <= button.topLeftX + button.width and y >= button.topLeftY and y <= button.topLeftY + button.height and buttonIsPressed == true) then
        button.onClick()
        button.color = { 255 , 255 , 255 , 0.5 }
        buttonIsPressed = false
    end     
end

 function buttonUpdate ( button , x , y )
    if ( (x < button.topLeftX or x > button.topLeftX + button.width or y < button.topLeftY or y > button.topLeftY + button.height ) and buttonIsPressed == true ) then
        button.color = { 255 , 255 , 255 , 0.5 }
        buttonIsPressed = false
    end
end        