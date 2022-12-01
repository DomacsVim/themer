local M = {}

function M.get_palette(flavour)
	local flvr = flavour or require("themer.themes.catppuccin").flavour or vim.g.catppuccin_flavour or "mocha"
	local _, palette = pcall(require, "themer.themes.catppuccin.palettes." .. flvr)
	local O = require("themer.themes.catppuccin").options
	return vim.tbl_deep_extend("keep", O.color_overrides.all or {}, O.color_overrides[flvr] or {}, palette or {})
end

return M
