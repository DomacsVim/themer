local config = require('themer.themes.github-theme.config')
local theme = require('themer.themes.github-theme.theme')
local util = require('themer.themes.github-theme.util')

---@class gt.Init
local init = {}

---@param user_config gt.ConfigSchema?
init.setup = function(user_config)
  if user_config then
    config.apply_configuration(user_config)
  end
end

return init
