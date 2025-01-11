-- Line numbers

vim.wo.number = true
vim.wo.relativenumber = true

-- Mouse

vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard

vim.opt.clipboard = "unnamedplus"

-- Indent Settings (like tabs)

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4

-- Other

vim.opt.scrolloff = 8
vim.opt.wrap = false



-- Fillchars
vim.opt.fillchars = {
vert = "│",
fold = "⠀",
eob = " ", -- suppress ~ at EndOfBuffer
-- diff = "⣿", -- alternatives = ⣿ ░ ─ ╱
msgsep = "‾",
foldopen = "▾",
foldsep = "│",
foldclose = "▸",
}


vim.opt.cmdheight = 0-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.9
vim.g.transparency = 0.8
vim.g.neovide_background_color = "#aaaaaa" .. alpha()
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
vim.g.neovide_window_blurred = true

