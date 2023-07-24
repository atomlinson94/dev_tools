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
opt.hidden = false

-- Remap leader and local leader to <Space>
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight on search
opt.number = true -- Make line numbers default
opt.relativenumber = true -- Make relative number default
opt.mouse = "" -- Disable mouse mode
opt.breakindent = true -- Enable break indent
opt.undofile = true -- Save undo history
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 200 -- Decrease update time
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
opt.timeoutlen = 300

-- Define file search behavior
opt.path:remove "/usr/include"
opt.path:append "**"

opt.wildignorecase = true
opt.wildignore:append "**/.git/*"
opt.wildignore:append "**/build/*"
