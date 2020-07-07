function worldAddEdge(x1, y1, x2, y2)
    local edge = {}
    edge.body = love.physics.newBody(world, 0, 0, "static")
    edge.shape = love.physics.newEdgeShape(x1, y1, x2, y2)
    love.physics.newFixture(edge.body, edge.shape)
end

function worldAddMapEdges(map_width, map_height)
    worldAddEdge(0, 0, map_width, 0)
    worldAddEdge(0, 0, 0, map_height)
    worldAddEdge(map_width, 0, map_width, map_height)
    worldAddEdge(0, map_height, map_width, map_height)
end
