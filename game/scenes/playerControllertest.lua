require "player"
require "playerController"
scene = {}

function scene:load()
    player = createPlayer( 10 , 10 , 25 , 5  )
    world = love.physics.newWorld(0, 0, true)
    player.body = love.physics.newBody(world, player.x, player.y, "dynamic")
    player.shape = love.physics.newCircleShape(player.radius)
    player.fixture = love.physics.newFixture(player.body, player.shape)
    playerControllerCreate( player )
end

function scene:draw()
    playerControllerDraw( player )
end

function scene:mousereleased(x, y)
    playerControllerMouseReleased( x, y )
end

function scene:update(dt)
    playerControllerUpdate( player )
end    


return scene
