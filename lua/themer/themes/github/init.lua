local config = require('themer.themes.github.config')
local theme = require('themer.themes.github.theme')
local util = require('themer.themes.github.util')

---@class gt.Init
local init = {}

---@param user_config gt.ConfigSchema?
init.setup = function(user_config)
  if user_config then
    config.apply_configuration(user_config)
  end

  util.load(theme.setup(config.schema))
end

return init
