utils = {}

function utils.hexToRGB(hex)
  local hex = hex:gsub("#", "")

  local color = {
    tonumber("0x" .. hex:sub(1, 2)) / 255,
    tonumber("0x" .. hex:sub(3, 4)) / 255,
    tonumber("0x" .. hex:sub(5, 6)) / 255
  }

  return color
end

return utils
