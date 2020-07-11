utils = {}

-- Converts rgb color hex in the format #abcdef to a color table
-- of format {0.99, 0.99, 0.99}
function utils.hexToRGB(hex)
  local hex = hex:gsub("#", "")

  local color = {
    tonumber("0x" .. hex:sub(1, 2)) / 255,
    tonumber("0x" .. hex:sub(3, 4)) / 255,
    tonumber("0x" .. hex:sub(5, 6)) / 255
  }

  return color
end

-- Point should be a table having properties point.x and point.y
-- Rect should be a table having properties rect.x, rect.y, rect.width and rect.height
-- rect.x and rect.y denote the coordinates of the top left point of the rect
function utils.pointInsideRect(point, rect)
    assert(point.x and point.y, "Not a valid point table")
    assert(rect.x and rect.y and rect.width and rect.height, "Not a valid rect table")

    if (point.x >= rect.x and point.x <= rect.x + rect.width and
        point.y >= rect.y and point.y <= rect.y + rect.height) then
        print("yes", point.x, point.y, rect.x, rect.y, rect.width, rect.height)
        return true
    else
        return false
    end
end

return utils
