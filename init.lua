-- Basic config
require("core.configs");
require("core.mappings");
require("core.lazy")



vim.opt.termguicolors = true

vim.g.zenbones_better_performance = true
vim.g.zenbones_italics = true
vim.g.zenbones_transparent_background = true

-- Подключение темы
vim.cmd('colorscheme zenbones')
vim.opt.background = 'dark'

-- Автоматическая установка Packer при старте Neovim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Конфигурация плагинов
vim.opt.packpath:append("~/.local/share/nvim/site")

vim.cmd([[packadd packer.nvim]])
require("packer").startup(function(use)
  use "wbthomason/packer.nvim" -- Сам Packer
  use "nvim-lua/plenary.nvim"
  use 'nvim-tree/nvim-web-devicons' -- Иконки
  use 'neovim/nvim-lspconfig' -- Для настройки LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- Настройка Mason
require('mason').setup()

-- Настройка интеграции с LSP
require('mason-lspconfig').setup({
  ensure_installed = { "ts_ls", "pyright", "rust_analyzer" },  -- Устанавливаем LSP-серверы
})

-- Настройка LSP-серверов
local lspconfig = require('lspconfig')
lspconfig.ts_ls.setup {}
