local api = vim.api
local g = vim.g
local opt = vim.opt

local keymap = api.nvim_set_keymap
local default_opts = { noremap = true }

-- Remap leader and local leader to <Space>
keymap("", "<Space>", "<Nop>", default_opts)
g.mapleader = " "
g.maplocalleader = " "

-- Define tab behavior
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true

-- Define buffer behavior
-- TODO: Revisit whether this should be true/false
--opt.hidden = true

-- Define general behavior
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.relativenumber = true --Make relative number default
opt.mouse = "" --Disable mouse for all modes
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Time in milliseconds to wait for a mapped sequence to complete.
opt.timeoutlen = 200

-- Define file search behavior
opt.path:remove "/usr/include"
opt.path:append "**"

opt.wildignorecase = true
opt.wildignore:append "**/.git/*"
opt.wildignore:append "**/build/*"
