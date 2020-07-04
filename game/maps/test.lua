return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "1.4.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 50,
  height = 50,
  tilewidth = 32,
  tileheight = 32,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "kenney",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      columns = 108,
      image = "tilesets/kenney.png",
      imagewidth = 3456,
      imageheight = 2560,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 32,
        height = 32
      },
      properties = {},
      terrains = {},
      tilecount = 8640,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 50,
      height = 50,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        217, 218, 217, 1, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 2, 3, 111, 3, 3, 3, 217, 217, 217, 109, 109, 109, 109, 1, 1, 1, 1, 1, 2, 3, 1, 1, 2, 3, 1, 1, 1, 1, 1, 2, 3,
        217, 218, 219, 109, 1, 2, 3, 111, 111, 111, 111, 111, 111, 111, 3, 3, 109, 109, 1, 1, 1, 1, 1, 2, 3, 111, 3, 3, 217, 217, 217, 217, 109, 109, 109, 109, 1, 2, 3, 109, 1, 1, 1, 109, 109, 1, 109, 1, 2, 3,
        217, 218, 219, 217, 109, 1, 2, 3, 219, 219, 219, 219, 219, 219, 111, 111, 217, 217, 109, 109, 109, 109, 109, 1, 1, 1, 1, 1, 1, 109, 109, 109, 217, 217, 217, 217, 1, 2, 3, 217, 109, 1, 109, 217, 217, 109, 217, 109, 1, 2,
        217, 218, 219, 1, 217, 1, 1809, 1810, 1811, 1812, 1, 1, 1, 1, 1, 1, 109, 109, 217, 217, 217, 217, 217, 109, 109, 109, 109, 109, 109, 217, 217, 217, 217, 109, 217, 218, 109, 1, 2, 3, 3, 1, 2, 3, 218, 217, 1, 217, 1, 2,
        217, 218, 219, 109, 109, 1, 1917, 1918, 1919, 1920, 109, 109, 109, 109, 109, 109, 217, 1, 2, 3, 1, 2, 3, 1, 2, 3, 217, 217, 217, 217, 1, 2, 3, 217, 218, 219, 1809, 1810, 1811, 1812, 111, 109, 1, 1, 1, 2, 1, 217, 1, 2,
        217, 218, 219, 217, 217, 109, 2025, 2026, 2027, 2028, 217, 217, 217, 217, 217, 217, 217, 109, 110, 111, 1, 2, 3, 1, 1, 2, 1, 1, 2, 1, 1, 2, 1, 217, 218, 219, 1917, 1918, 1919, 1920, 219, 217, 109, 109, 1, 1, 1, 217, 1, 2,
        217, 218, 219, 109, 110, 217, 2133, 2134, 2135, 2136, 217, 218, 219, 219, 1, 1, 2, 3, 218, 1813, 1814, 1815, 1816, 109, 1, 2, 3, 109, 1, 109, 1, 2, 109, 217, 218, 219, 2025, 2026, 2027, 2028, 219, 110, 217, 217, 109, 109, 109, 217, 1, 2,
        218, 219, 111, 217, 218, 219, 1, 2, 3, 218, 219, 3, 2, 3, 109, 1, 2, 3, 1, 1921, 1922, 1923, 1924, 3, 1, 2, 3, 3, 109, 217, 1, 1, 217, 217, 218, 219, 2133, 2134, 2135, 2136, 1, 2, 3, 110, 1, 2, 217, 217, 1, 2,
        219, 111, 1, 2, 3, 3, 1, 2, 3, 218, 219, 111, 1, 1, 217, 1, 2, 3, 109, 2029, 2030, 2031, 2032, 111, 1, 2, 3, 1, 217, 217, 1, 109, 217, 218, 219, 2, 1, 2, 3, 3, 2, 3, 3, 218, 1, 1, 217, 218, 1, 2,
        219, 219, 1, 1, 2, 3, 1, 2, 3, 218, 219, 219, 1, 1, 1, 2, 3, 3, 217, 2137, 2138, 2139, 2140, 1, 1, 2, 3, 109, 217, 1, 109, 217, 217, 218, 219, 1, 1, 2, 3, 111, 110, 111, 111, 1, 2, 3, 217, 218, 1, 2,
        218, 219, 1, 1, 2, 3, 1, 2, 3, 217, 1, 1, 109, 109, 1, 1, 1, 2, 3, 1, 2, 3, 219, 109, 1, 2, 3, 217, 217, 1, 217, 217, 218, 219, 1, 109, 1, 2, 3, 219, 218, 219, 219, 109, 110, 111, 3, 3, 1, 2,
        218, 219, 3, 1, 2, 3, 1, 2, 3, 1, 1729, 1730, 1731, 1732, 1733, 1734, 1735, 1736, 2, 1, 1, 1, 1, 217, 1, 2, 1, 217, 1, 109, 1, 2, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 219, 111, 1, 1, 2,
        218, 219, 111, 1, 2, 3, 1, 2, 3, 109, 1837, 1838, 1839, 1840, 1841, 1842, 1843, 1844, 1, 109, 1, 1, 2, 3, 1, 2, 109, 1, 109, 217, 1, 1, 1, 2, 3, 111, 111, 111, 111, 111, 111, 111, 111, 111, 111, 3, 1, 109, 1, 2,
        217, 218, 219, 1, 1, 2, 3, 2, 1, 217, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1, 217, 109, 1, 2, 3, 3, 1, 1, 109, 217, 217, 109, 109, 1729, 1730, 1731, 1732, 1733, 1734, 1735, 1736, 1, 1, 1, 1, 1, 1, 109, 217, 1, 2,
        217, 218, 219, 109, 1, 2, 3, 1, 109, 217, 2053, 2054, 2055, 2056, 2057, 2058, 2059, 2060, 1, 2, 1, 2, 3, 111, 111, 1, 109, 217, 217, 218, 217, 217, 1837, 1838, 1839, 1840, 1841, 1842, 1843, 1844, 109, 109, 109, 109, 109, 109, 217, 1, 2, 3,
        217, 218, 219, 217, 1, 2, 1, 109, 217, 218, 2161, 2162, 2163, 2164, 2165, 2166, 2167, 2168, 1, 2, 1, 2, 3, 219, 1, 109, 217, 217, 218, 219, 219, 218, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 217, 217, 217, 217, 217, 217, 217, 1, 2, 3,
        2, 217, 1, 217, 1, 2, 109, 217, 218, 219, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2276, 1, 2, 1, 2, 3, 1, 109, 217, 217, 218, 219, 111, 218, 219, 2053, 2054, 2055, 2056, 2057, 2058, 2059, 2060, 1, 1, 109, 217, 217, 218, 219, 1, 2, 3,
        2, 217, 1, 217, 1, 1, 217, 217, 218, 219, 2377, 2378, 2379, 2380, 2381, 2382, 2383, 2384, 1, 2, 1, 2, 1, 109, 217, 217, 218, 219, 1, 2, 3, 3, 2161, 2162, 2163, 2164, 2165, 2166, 2167, 2168, 109, 109, 217, 217, 218, 219, 1, 1, 2, 3,
        2, 217, 109, 217, 109, 109, 217, 218, 219, 219, 2485, 2486, 2487, 2488, 2489, 2490, 2491, 2492, 1, 1, 1, 2673, 2674, 2675, 2676, 218, 1, 2, 1, 1, 1, 1, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2276, 217, 217, 217, 218, 219, 219, 1, 1, 2, 3,
        2, 1, 217, 2673, 2674, 2675, 2676, 218, 219, 217, 217, 1, 2, 3, 217, 1, 2, 3, 109, 1, 109, 2781, 2782, 2783, 2784, 1, 2, 1, 109, 109, 109, 1, 2377, 2378, 2379, 2380, 2381, 2382, 2383, 2384, 217, 218, 219, 3, 218, 219, 1, 2, 3, 111,
        2, 1, 217, 2781, 2782, 2783, 2784, 219, 109, 1, 1, 109, 110, 111, 217, 1, 2, 3, 217, 1, 217, 2889, 2890, 2891, 2892, 1, 1, 109, 217, 217, 217, 109, 2485, 2486, 2487, 2488, 2489, 2490, 2491, 2492, 1, 2, 3, 3, 109, 1, 1, 2, 3, 219,
        2, 1, 217, 2889, 2890, 2891, 2892, 109, 217, 1, 109, 217, 218, 219, 1, 2, 3, 3, 111, 1, 1, 2997, 2998, 2999, 3000, 109, 109, 217, 217, 218, 219, 217, 109, 1, 1, 109, 109, 1, 1, 2, 3, 2, 3, 111, 217, 1, 1, 2, 3, 219,
        2, 1, 2, 2997, 2998, 2999, 3000, 217, 217, 109, 217, 217, 218, 219, 109, 110, 111, 3, 1, 109, 1, 2, 1, 217, 218, 217, 1, 2, 3, 3, 3, 1, 1, 109, 109, 217, 1, 109, 1, 2, 3, 1, 2, 3, 217, 1, 1, 2, 3, 219,
        1, 1, 2, 217, 218, 217, 217, 217, 218, 217, 217, 218, 219, 1, 217, 218, 219, 111, 3, 217, 1, 1, 109, 217, 218, 219, 1, 2, 3, 111, 111, 1, 109, 217, 217, 1, 109, 1, 2, 3, 3, 1, 2, 3, 219, 1, 1, 2, 3, 219,
        1, 1, 2, 217, 218, 219, 1, 1, 1, 1, 1, 1, 1, 2, 217, 218, 219, 219, 111, 3, 109, 109, 217, 218, 219, 3, 1, 2, 3, 1, 1, 109, 217, 217, 218, 1, 2, 3, 3, 3, 111, 1813, 1814, 1815, 1816, 2, 3, 3, 111, 219,
        1, 1, 1, 217, 218, 219, 109, 109, 109, 109, 109, 1, 2, 3, 217, 217, 218, 219, 219, 111, 217, 217, 217, 218, 219, 3, 1, 1, 1, 109, 109, 217, 217, 1, 2, 3, 3, 3, 111, 111, 219, 1921, 1922, 1923, 1924, 2, 3, 3, 219, 219,
        1, 109, 1, 217, 218, 1, 217, 217, 217, 217, 1809, 1810, 1811, 1812, 217, 218, 217, 218, 219, 219, 3, 3, 3, 3, 1, 1, 109, 109, 109, 217, 217, 217, 2673, 2674, 2675, 2676, 111, 111, 219, 219, 219, 2029, 2030, 2031, 2032, 2, 3, 3, 218, 219,
        1, 217, 1, 217, 218, 1, 217, 218, 219, 1, 1917, 1918, 1919, 1920, 217, 218, 1, 217, 218, 219, 111, 3, 1, 1, 109, 109, 217, 217, 217, 217, 1, 2, 2781, 2782, 2783, 2784, 219, 219, 217, 218, 219, 2137, 2138, 2139, 2140, 2, 3, 111, 218, 219,
        1, 217, 1, 217, 218, 109, 217, 218, 219, 109, 2025, 2026, 2027, 2028, 217, 1, 2, 1, 217, 218, 1729, 1730, 1731, 1732, 1733, 1734, 1735, 1736, 218, 1, 2, 3, 2889, 2890, 2891, 2892, 219, 109, 217, 218, 219, 3, 111, 109, 1, 1, 2, 3, 218, 219,
        1, 217, 109, 217, 218, 217, 217, 218, 219, 217, 2133, 2134, 2135, 2136, 218, 1, 1, 109, 217, 218, 1837, 1838, 1839, 1840, 1841, 1842, 1843, 1844, 1, 2, 3, 3, 2997, 2998, 2999, 3000, 109, 217, 217, 218, 219, 111, 219, 217, 109, 1, 2, 3, 1, 2,
        1, 217, 217, 217, 218, 219, 217, 218, 219, 1, 1, 109, 217, 217, 1, 109, 109, 217, 217, 217, 1945, 1946, 1947, 1948, 1949, 1950, 1951, 1952, 1, 2, 3, 111, 219, 217, 218, 219, 217, 217, 218, 219, 219, 219, 217, 217, 217, 1, 2, 3, 1, 2,
        1, 217, 218, 217, 218, 219, 217, 218, 219, 109, 109, 217, 217, 218, 109, 217, 217, 217, 218, 217, 2053, 2054, 2055, 2056, 2057, 2058, 2059, 2060, 1, 2, 3, 219, 217, 218, 219, 217, 217, 218, 219, 219, 217, 217, 218, 219, 219, 1, 2, 3, 1, 2,
        1, 217, 218, 219, 219, 1, 217, 218, 219, 217, 217, 217, 218, 219, 217, 217, 217, 218, 219, 217, 2161, 2162, 2163, 2164, 2165, 2166, 2167, 2168, 2, 3, 3, 217, 218, 219, 217, 217, 218, 219, 1809, 1810, 1811, 1812, 219, 219, 3, 1, 2, 1, 2, 3,
        1, 217, 218, 219, 217, 109, 217, 218, 219, 217, 218, 219, 217, 217, 217, 218, 219, 1, 2, 3, 2269, 2270, 2271, 2272, 2273, 2274, 2275, 2276, 2, 3, 111, 217, 218, 219, 217, 218, 219, 217, 1917, 1918, 1919, 1920, 219, 2, 3, 1, 2, 1, 2, 3,
        1, 217, 218, 219, 217, 217, 217, 218, 219, 218, 219, 219, 3, 2, 217, 218, 219, 1, 2, 3, 2377, 2378, 2379, 2380, 2381, 2382, 2383, 2384, 3, 3, 219, 218, 219, 217, 218, 219, 217, 217, 2025, 2026, 2027, 2028, 2, 3, 3, 1, 1, 2, 3, 3,
        1, 217, 218, 219, 217, 217, 218, 219, 111, 3, 3, 219, 111, 110, 217, 218, 219, 2, 3, 3, 2485, 2486, 2487, 2488, 2489, 2490, 2491, 2492, 111, 111, 109, 217, 217, 218, 219, 217, 218, 219, 2133, 2134, 2135, 2136, 3, 3, 111, 109, 1, 2, 3, 111,
        1, 217, 218, 219, 217, 217, 218, 219, 219, 111, 111, 3, 3, 3, 217, 218, 219, 3, 111, 111, 219, 219, 217, 217, 217, 218, 219, 219, 219, 219, 217, 217, 218, 219, 217, 218, 219, 217, 218, 219, 3, 3, 3, 111, 219, 217, 1, 2, 3, 219,
        109, 217, 218, 1809, 1810, 1811, 1812, 217, 218, 219, 219, 111, 111, 111, 217, 218, 219, 111, 219, 219, 1, 109, 109, 109, 217, 217, 217, 1, 109, 109, 217, 218, 219, 1, 1, 1, 1, 1, 1, 2, 3, 3, 111, 219, 219, 1, 1, 2, 3, 219,
        217, 217, 218, 1917, 1918, 1919, 1920, 109, 1, 217, 218, 219, 219, 219, 217, 218, 219, 219, 109, 109, 109, 217, 217, 217, 217, 218, 219, 109, 217, 217, 218, 219, 3, 3, 3, 3, 3, 3, 1, 1, 1, 1, 1, 2, 3, 1, 1, 2, 3, 3,
        217, 217, 218, 2025, 2026, 2027, 2028, 217, 109, 109, 109, 217, 218, 219, 217, 218, 219, 109, 217, 217, 217, 217, 218, 219, 3, 111, 111, 217, 217, 218, 219, 219, 111, 111, 111, 111, 111, 111, 3, 3, 3, 3, 3, 3, 3, 1, 1, 1, 2, 3,
        217, 218, 219, 2133, 2134, 2135, 2136, 219, 217, 217, 217, 217, 217, 217, 218, 109, 217, 217, 217, 218, 219, 3, 3, 111, 111, 219, 219, 217, 217, 217, 218, 219, 219, 219, 219, 219, 219, 219, 111, 111, 111, 111, 3, 3, 3, 2, 109, 1, 2, 3,
        217, 218, 219, 1, 2, 3, 218, 219, 219, 111, 3, 3, 217, 217, 218, 217, 217, 218, 219, 3, 3, 3, 111, 219, 219, 1, 1, 1, 217, 218, 219, 217, 217, 217, 109, 217, 218, 219, 219, 219, 219, 219, 111, 111, 111, 2, 217, 1, 2, 3,
        217, 218, 219, 1, 2, 3, 217, 218, 219, 219, 111, 111, 3, 217, 218, 217, 218, 219, 219, 111, 3, 111, 219, 109, 109, 109, 109, 109, 109, 109, 109, 217, 218, 219, 217, 217, 217, 217, 217, 217, 218, 219, 219, 219, 219, 1, 1, 2, 3, 3,
        217, 218, 219, 1, 2, 3, 3, 217, 218, 219, 219, 219, 1, 2, 217, 109, 217, 218, 219, 219, 111, 219, 217, 217, 217, 217, 217, 217, 217, 217, 217, 217, 217, 217, 218, 219, 219, 219, 219, 111, 111, 111, 111, 1, 109, 1, 1, 2, 3, 111,
        217, 218, 219, 1, 2, 3, 111, 3, 3, 3, 3, 3, 3, 3, 217, 217, 217, 217, 218, 219, 219, 218, 219, 219, 219, 219, 219, 219, 0, 0, 0, 217, 218, 217, 217, 217, 217, 218, 219, 219, 219, 219, 219, 3, 3, 3, 3, 3, 3, 219,
        217, 218, 219, 1, 2, 3, 219, 111, 111, 111, 111, 111, 111, 111, 217, 218, 219, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 217, 218, 219, 219, 219, 219, 219, 111, 111, 111, 111, 111, 111, 111, 0,
        217, 218, 219, 1, 2, 3, 219, 219, 219, 219, 219, 219, 219, 219, 217, 218, 219, 3, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 217, 218, 219, 219, 219, 219, 219, 219, 219, 219, 0,
        3, 218, 219, 1, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 217, 218, 219, 111, 111, 111, 111, 111, 3, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 3, 111, 219, 0, 0, 0, 0,
        1, 1, 1, 1, 2, 3, 109, 109, 109, 109, 1, 1, 109, 109, 217, 218, 219, 219, 219, 219, 219, 219, 111, 111, 111, 111, 3, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 111, 219, 0, 0, 0, 0, 0,
        109, 109, 109, 1, 2, 3, 217, 217, 1, 1, 109, 109, 217, 217, 217, 218, 219, 0, 0, 217, 218, 219, 219, 219, 219, 219, 111, 111, 111, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 111, 219, 0, 0, 0, 0, 0, 0
      }
    }
  }
}
