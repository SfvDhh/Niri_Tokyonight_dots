-- ######################
-- # Options for NeoVim #
-- ######################

-- Requires
-- Requires for NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- For Treesitter fold
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "auto"

-- Connect with global buffer
vim.opt.clipboard = "unnamedplus"

-- Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- UI
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"

-- Scrolling
vim.opt.scrolloff = 12

-- Tabs and paddings
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Turn on true colors
vim.opt.termguicolors = true

-- Disabling unnecessary providers
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Smart find
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false

-- Leader key
vim.g.mapleader = " "

-- #########
-- # Basic #
-- #########

require("core.plugins")

-- ##################
-- # Other settings #
-- ##################

-- Bindings
local map = vim.keymap.set
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
