local M = {}

function M.set_highlights(highlights)
  for group_name, group_settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group_name, group_settings)
    -- vim.api.nvim_command(string.format("highlight %s guifg=#%s guibg=#%s guisp=#%s gui=%s",
    --   group_name,
    --   group_settings.fg or "none",
    --   group_settings.bg or "none",
    --   group_settings.sp or "none",
    --   group_settings.fmt or "none"))
  end
end

function M.term(theme)
  vim.g.terminal_color_0 = theme.base00
  vim.g.terminal_color_1 = theme.base08
  vim.g.terminal_color_2 = theme.base0B
  vim.g.terminal_color_3 = theme.base0A
  vim.g.terminal_color_4 = theme.base0D
  vim.g.terminal_color_5 = theme.base0E
  vim.g.terminal_color_6 = theme.base0C
  vim.g.terminal_color_7 = theme.base05
  vim.g.terminal_color_8 = theme.base03
  vim.g.terminal_color_9 = theme.base08
  vim.g.terminal_color_10 = theme.base0B
  vim.g.terminal_color_11 = theme.base0A
  vim.g.terminal_color_12 = theme.base0D
  vim.g.terminal_color_13 = theme.base0E
  vim.g.terminal_color_14 = theme.base0C
  vim.g.terminal_color_15 = theme.base07
  if vim.o.background == "light" then
      vim.g.terminal_color_background = theme.base05
      vim.g.terminal_color_foreground = theme.base0B
  else
      vim.g.terminal_color_background = theme.base00
      vim.g.terminal_color_foreground = theme.base0E
  end
end

function M.themes(theme)
  return require("themer.colorschemes")[theme]
end

function M.apply_theme(theme)
  vim.cmd("hi! clear")
	vim.cmd("syntax reset")
  vim.o.termguicolors = true

  local hl = require("themer.highlights")

  M.set_highlights(hl.defaults)

  for plugin in pairs(hl.plugins) do
    M.set_highlights(hl.plugins[plugin])
  end

end

return M
