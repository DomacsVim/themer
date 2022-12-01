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

return C
