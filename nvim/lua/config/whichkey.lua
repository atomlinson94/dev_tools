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
    silent = false, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    -- TODO: Find better solution for vim commands
    ["w"] = { "<Cmd>w<CR>", "Save" },
    ["q"] = { "<Cmd>q!<CR>", "Quit" },
    ["x"] = { "<Cmd>x<CR>", "Save and quit" },
    ["<Cr>"] = {"<Cmd>noh<Cr>", "Clear last search" },

    ["f"] = {
      name = "Find",
      ["f"] = { "<Cmd>lua require('utils.finder').find_files()<Cr>", "Files" },
      -- TODO: Dot file support?
      ["b"] = { "<Cmd>Telescope buffers<Cr>", "Buffers" },
      ["o"] = { "<Cmd>Telescope oldfiles<Cr>", "Old Files" },
      ["g"] = { "<Cmd>Telescope live_grep<Cr>", "Live Grep" },
      ["c"] = { "<Cmd>Telescope commands<Cr>", "Commands" },
      ["r"] = { "<Cmd>Telescope file_browser<Cr>", "Browser" },
      ["w"] = { "<Cmd>Telescope current_buffer_fuzzy_find<Cr>", "Current Buffer" },
      ["e"] = { "<Cmd>NvimTreeToggle<Cr>", "Explorer" },
    },

    ["p"] = {
      name = "Project",
      ["p"] = { "<Cmd>lua require'telescope'.extensions.project.project{}<Cr>", "List" },
      ["s"] = { "<Cmd>Telescope repo list<Cr>", "Search" },
    },

    ["b"] = {
      name = "Buffers",
      ["f"] = { "<Cmd>ls<Cr>:b<Space>", "Find and open buffer" },
      ["n"] = { ":edit<Space>", "Open new buffer" },
      ["k"] = { "<Cmd>bprev<Cr>", "Switch to previous buffer" },
      ["j"] = { "<Cmd>bnext<Cr>", "Switch to next buffer" },
      ["D"] = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    ["t"] = {
      name = "Tabs",
      ["f"] = { ":tabfind<Space>", "Find and open file" },
      ["n"] = { ":tabnew<Space>", "Open new file" },
      ["h"] = { "<Cmd>tabprev<Cr>", "Switch to previous tab" },
      ["l"] = { "<Cmd>tabnext<Cr>", "Switch to next tab" },
    }, 

    ["z"] = {
      name = "Packer",
      ["c"] = { "<Cmd>PackerCompile<Cr>", "Compile" },
      ["i"] = { "<Cmd>PackerInstall<Cr>", "Install" },
      ["s"] = { "<Cmd>PackerSync<Cr>", "Sync" },
      ["S"] = { "<Cmd>PackerStatus<Cr>", "Status" },
      ["u"] = { "<Cmd>PackerUpdate<Cr>", "Update" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
