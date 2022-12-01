if vim.g.nightfox_debug then
  require("themer.themes.nightfox.util.reload")()
end

require("themer.themes.nightfox.config").set_fox("nordfox")
require("themer.themes.nightfox").load()
