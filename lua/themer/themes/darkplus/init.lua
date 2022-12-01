local util = require 'themer.themes.darkplus.util'
local theme = require 'themer.themes.darkplus.theme'

vim.o.background = 'dark'
vim.g.colors_name = 'darkplus'

util.load(theme)
