local config = require("themer.themes.nightfox.config")
local util = require("themer.themes.nightfox.util")
local parse_styles = require("themer.themes.nightfox.lib.highlight").parse_style
local fmt = string.format

local M = {}

local function inspect(t)
  local list = {}
  for k, v in pairs(t) do
    local q = type(v) == "string" and [["]] or ""
    table.insert(list, fmt([[%s = %s%s%s]], k, q, v, q))
  end

  table.sort(list)
  return fmt([[{ %s }]], table.concat(list, ", "))
end

local function should_link(link)
  return link and link ~= ""
end

function M.compile(opts)
  opts = opts or {}
  local style = opts.style or config.fox
  local spec = require("themer.themes.nightfox.spec").load(style)
  local groups = require("themer.themes.nightfox.group").from(spec)
  local background = spec.palette.meta.light and "light" or "dark"

  local lines = {
    fmt(
      [[
require("themer.themes.nightfox").compiled = string.dump(function()
if vim.g.colors_name then vim.cmd("hi clear") end
vim.o.termguicolors = true
vim.g.colors_name = "%s"
vim.o.background = "%s"
    ]],
      style,
      background
    ),
  }

  if config.options.terminal_colors then
    local terminal = require("themer.themes.nightfox.group.terminal").get(spec)
    for k, v in pairs(terminal) do
      table.insert(lines, fmt([[vim.g.%s = "%s"]], k, v))
    end
  end

  for name, values in pairs(groups) do
    if should_link(values.link) then
      table.insert(lines, fmt([[vim.api.nvim_set_hl(0, "%s", { link = "%s" })]], name, values.link))
    else
      local op = parse_styles(values.style)
      op.bg = values.bg
      op.fg = values.fg
      op.sp = values.sp
      table.insert(lines, fmt([[vim.api.nvim_set_hl(0, "%s", %s)]], name, inspect(op)))
    end
  end

  table.insert(lines, "end)")

  opts.name = style
  local output_path, output_file = config.get_compiled_info(opts)

  util.ensure_dir(output_path)

  local file = io.open(output_file, "wb")
  local ld = load or loadstring -- loadstring == 5.1, load >= 5.2
  ld(table.concat(lines, "\n"), "=")()
  file:write(require("themer.themes.nightfox").compiled)
  file:close()
end

return M
