local C = {}

function C.get_theme(theme)
  local theme_name

  if vim.g.colors_name ~= '' or vim.g.colors_name ~= nil then
    if theme ~= '' or theme ~= nil then
      theme_name = theme or vim.g.colors_name
    end
  end

  local theme_path = 'themer.themes.' .. theme_name

  local status_ok, _ = pcall(require, theme_path)
  if not status_ok then
    error('[ERROR] No such theme :(')
  end

  return theme_path
end

function C.get_palette(theme)
  local select_theme = C.get_theme(theme) .. '.palette'

  local status_ok, _ = pcall(require, select_theme)
  if not status_ok then
    error('[ERROR] No such palette for theme :(')
  end
end

function C.load_theme(theme)
  local select_theme = C.get_theme(theme)

  xpcall(function()
    require(select_theme).load()
    end, function()
      error('[ERROR] No such palette for theme :(')
    end)
end

return C
