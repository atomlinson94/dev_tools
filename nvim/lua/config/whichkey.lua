local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<Cmd>w<CR>", "Save" },
    ["q"] = { "<Cmd>q<CR>", "Quit" },
    ["x"] = { "<Cmd>x<CR>", "Save and quit" },

    ["t"] = {
      name = "Tabs",
      ["f"] = { ":tabfind<space>", "Find and open file" },
      ["n"] = { ":tabnew<space>", "Open new file" },
      ["h"] = { "<cmd>tabprev<cr>", "Switch to previous tab" },
      ["l"] = { "<cmd>tabnext<cr>", "Switch to next tab" },
    },

    ["f"] = {
      name = "Find",
      ["f"] = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
      ["b"] = { "<cmd>Telescope buffers<cr>", "Buffers" },
      ["o"] = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
      ["g"] = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
      ["c"] = { "<cmd>Telescope commands<cr>", "Commands" },
      ["r"] = { "<cmd>Telescope file_browser<cr>", "Browser" },
      ["w"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },
      ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    },

    ["p"] = {
      name = "Project",
      ["p"] = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "List" },
      ["s"] = { "<cmd>Telescope repo list<cr>", "Search" },
    },

    ["b"] = {
      name = "Buffers",
      ["c"] = { "<cmd>bd!<cr>", "Close current buffer" },
      ["D"] = { "<cmd>%bd|e#|bd#<cr>", "Delete all buffers" },
      ["f"] = { "<cmd>ls<cr>:b<space>", "Find and open buffer" },
      ["n"] = { ":edit<Space>", "Open new buffer" },
      ["h"] = { "<cmd>bprev<cr>", "Switch to previous buffer" },
      ["l"] = { "<cmd>bnext<cr>", "Switch to next buffer" },
    },

    ["z"] = {
      name = "Packer",
      ["c"] = { "<cmd>PackerCompile<cr>", "Compile" },
      ["i"] = { "<cmd>PackerInstall<cr>", "Install" },
      ["s"] = { "<cmd>PackerSync<cr>", "Sync" },
      ["S"] = { "<cmd>PackerStatus<cr>", "Status" },
      ["u"] = { "<cmd>PackerUpdate<cr>", "Update" },
      ["p"] = { "<cmd>PackerProfile<cr>", "Profile" },
    },

    ["g"] = {
      name = "Git",
      ["s"] = { "<cmd>Neogit<cr>", "Status" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
