local vim = vim
local border_style = vim.g.border_style

-- LAYOUT
local wo = { winfixbuf = true, winbar = false, winhighlight = "", signcolumn = "no", sidescrolloff = 0 }

vim.pack.add({
  "https://github.com/folke/edgy.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("edgy").setup({
  animate = {
    enabled = false,
  },
  left = {
    { ft = "NvimTree", wo = wo }
  },
  bottom = {
    {
      ft = "toggleterm",
      wo = wo,
      filter = function(_, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    { ft = "dap-view://main", wo = wo, },
    { ft = "dap-view-term", wo = wo, },
    { ft = "dap-view", wo = wo, },
    { ft = "dap-repl", wo = wo, },
    { ft = "qf", wo = wo, },
    { ft = "help", wo = wo, },
  },
  right = {
    { ft = "codecompanion", wo = wo, },
  },
  options = {
    left = {
      size = function()
        local f = (20 * vim.o.columns) / 100
        local i, _ = math.modf(f)
        local min = 30

        if i < min then
          return min
        end

        return i
      end
    },
    bottom = {
      size = function()
        local f = (40 * vim.o.lines) / 100
        local i, _ = math.modf(f)
        local min = 15

        if i < min then
          return min
        end

        return i
      end
    },
    right = {
      size = function()
        local f = (21 * vim.o.columns) / 100
        local i, _ = math.modf(f)
        local min = 30

        if i < min then
          return min
        end

        return i
      end
    },
    top = { size = 0 },
  },
  keys = {
    ["<a-l>"] = function(win)
      win:resize("width", 2)
    end,
    ["<a-h>"] = function(win)
      win:resize("width", -2)
    end,
    ["<a-k>"] = function(win)
      win:resize("height", 2)
    end,
    ["<a-j>"] = function(win)
      print(vim.inspect(win))
      win:resize("height", -2)
    end,
  }
})

-- FILE TREE
vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua"
}, { confirm = vim.g.vim_pack_add_confirm })

require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = { corner = "▏", edge = "▏", item = "▏", bottom = " ", none = " " },
    },
  },
  filters = { enable = false },
  actions = {
    open_file = {
      resize_window = false,
      window_picker = { enable = false }
    }
  },
  update_focused_file = { enable = true }
})

vim.keymap.set("n", "<leader>ee", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree", silent = true })

-- NOTIFICATION
vim.pack.add({
  "https://github.com/rcarriga/nvim-notify",
}, { confirm = vim.g.vim_pack_add_confirm })

require("notify").setup({
  -- max_width = 45,
  stages = "static",
  timeout = 5000,
  top_down = false,
  render = "wrapped-default",
  on_open = function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_set_option(buf, "filetype", "notify")
    vim.api.nvim_win_set_config(win, {
      focusable = false,
      border = vim.g.border_style,
    })
  end
})

vim.notify = require("notify")

vim.keymap.set("n", "<leader>nc", function()
  require("notify").dismiss()
end, { desc = "Close notifications", silent = true })

-- TERMINAL
local lazygit = nil
local vimongo = nil

vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
}, { confirm = vim.g.vim_pack_add_force })

require("toggleterm").setup({
  persist_size = false,
  persist_mode = true,
  shade_terminals = false,
  winbar = {
    enabled = false,
    name_formatter = function(term)
      local name = term.name
      local tab_name = (term.display_name or name:match("^(.-);")) .. " [" .. term.id .. "]"
      local win = vim.api.nvim_get_current_win()
      local highlight = win == term.window and "%#NvimDapViewTabSelected#" or ""

      return " " .. highlight .. "  " .. tab_name .. " "
    end
  },
  float_opts = {
    border = vim.g.border_style,
    title_pos = "center",
    winblend = 0,
    width = function()
      return vim.o.columns
    end,
    height = function()
      return vim.o.lines
    end,
  },
})

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  vim.cmd(vim.v.count .. "ToggleTerm direction=horizontal")
end, {
  desc = "Toggle horizontal terminals",
  silent = true
})
vim.keymap.set({ "n", "t" }, "<leader>tf", function()
  vim.cmd(vim.v.count .. "ToggleTerm direction=float")
end, { desc = "Toggle float terminals", silent = true })
vim.keymap.set({ "n", "t" }, "<leader>tg", function()
  local Terminal = require('toggleterm.terminal').Terminal

  if lazygit == nil then
    lazygit = Terminal:new({
      cmd = "lg",
      hidden = true,
      display_name = "Lazy Git",
      direction = "float",
      close_on_exit = true
    })
  end

  lazygit:toggle()
end, { desc = "Toggle Lazy Git", silent = true })
vim.keymap.set({ "n", "t" }, "<leader>tv", function()
  local Terminal = require('toggleterm.terminal').Terminal

  if vimongo == nil then
    vimongo = Terminal:new({
      cmd = "vmd",
      hidden = true,
      display_name = "Vi Mongo",
      direction = "float",
      close_on_exit = true
    })
  end

  vimongo:toggle()
end, { desc = "Toggle Vi Mongo", silent = true })

-- STATUS LINE
vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
}, { confirm = vim.g.pack_add_confirm })

require("lualine").setup({
  options = {
    theme = require("plugins.theme").lualine(),
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  }
})

vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = { "", "" },
    indicator = { icon = "▎", style = "none" },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = true,
    color_icons = true,
    offsets = {
      { filetype = "NvimTree",      text = "NvimTree", text_align = "center", separator = true, highlight = "NvimTreeNormal" },
      { filetype = "codecompanion", text = "", text_align = "center", separator = true, highlight = "NvimTreeNormal" },
    },
  },
})

vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move Buffer Left", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move Buffer Right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Buffer picker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>", { desc = "Close buffer via picker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bH", "<Cmd>BufferLineCloseLeft<CR>", { desc = "Close all buffers to the left", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bL", "<Cmd>BufferLineCloseRight<CR>", { desc = "Close all buffers to the right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bO", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close all other buffers", noremap = true, silent = true })

-- IA
vim.pack.add({
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/olimorris/codecompanion.nvim",
  "https://github.com/rcarriga/nvim-notify",
}, { confirm = vim.g.vim_pack_add_confirm })

require("copilot").setup({
  suggestion = {
    auto_trigger = false,
    enabled = true,
    keymap = {
      accept = "<leader>ca",
      next = "<leader>cn",
      prev = "<leader>cp",
      dismiss = "<leader>cd",
    }
  },
  panel = { enabled = false },
})

require("codecompanion").setup({
  adapters = {
    http = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-3.7-flash",
            },
          },
        })
      end,
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              -- default = "gpt-4o-mini",
              default = "gpt-4.1",
            },
          },
        })
      end
    }
  },
  interactions = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    }
  },
  opts = {
    log_level = "DEBUG"
  }
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestStarted",
  callback = function()
    vim.notify("Prompt started", "info", {
      title = "Code Companion",
    })
  end,
})

vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionActions<cr>", {
  desc = "Code Companion Actions",
  silent = true
})

-- DEBUGGER
vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/igorlfs/nvim-dap-view",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-dap.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/nvim-tree/nvim-tree.lua",
}, { confirm = vim.g.vim_pack_add_confirm })

local js_debugger = { "pwa-chrome", "pwa-node" }
local build_title = function(title, icon)
  return function(width)
    if width <= 118 then
      return icon
    end

    return title
  end
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

for _, debugger in ipairs(js_debugger) do
  require("dap").adapters[debugger] = function(cb, config)
    -- if config.preLaunchTask then
    --   vim.fn.system(config.preLaunchTask)
    --   -- Opcional: Adicionar um pequeno sleep se o container demorar alguns segundos para subir a porta 9229
    --   -- vim.uv.sleep(2000)
    -- end

    local adap = {
      type = "server",
      host = "localhost",
      port = "${port}",
      protocol = "inspector",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      }
    }

    cb(adap)
  end
end

require("dap").adapters.firefox = function(cb, config)
  if config.preLaunchTask then
    vim.fn.system(config.preLaunchTask)
  end

  cb({
    type = "executable",
    command = "firefox-debug-adapter",
  })
end

require("dap").listeners.before.attach.dapui_config = function()
  vim.notify("Debugger attatched", "info")
end
require("dap").listeners.before.launch.dapui_config = function()
  vim.notify("Debugger launched", "info")
end
require("dap").listeners.before.event_exited.dapui_config = function()
  vim.notify("Debugger exited", "info")
end

require("dap-view").setup({
  winbar = {
    default_section = "watches",
    sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
    controls = { enabled = true },
    base_sections = {
      breakpoints = { label = build_title("Breakpoints", ""), keymap = "B" },
      scopes = { label = build_title("Scopes", "󰭳"), keymap = "S" },
      exceptions = { label = build_title("Exceptions", "󱈸"), keymap = "E" },
      watches = { label = build_title("Watches", "󰈈"), keymap = "W" },
      threads = { label = build_title("Threads", ""), keymap = "T" },
      repl = { label = build_title("REPL", ""), keymap = "R" },
      sessions = { label = build_title("Sessions", "󰭳"), keymap = "K" },
      console = { label = build_title("Console", ""), keymap = "C" },
    },
  }
})

vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debugger toggle breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  require("dap").terminate({
    on_done = function()
      vim.notify("Debugger terminated", "info")
    end
  })
end, { desc = "Debugger terminate" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "Debugger continue" })
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover(nil, { border = vim.g.border_style })
end, { desc = "Debugger add expression" })
vim.keymap.set("n", "<leader>du", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  require("dap").terminate({
    on_done = function()
      vim.notify("Debugger terminated", "info")
    end,
  })
end, { desc = "DAP: Terminate" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "DAP: Continue/Start" })
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover(nil, { border = vim.g.border_style or "rounded" })
end, { desc = "DAP: Hover Expression" })
vim.keymap.set({ "n" }, "<leader>du", function()
  require("dap-view").toggle()
end, { desc = "Debugger toggle ui" })
vim.keymap.set({ "n", "v" }, "<leader>dw", function()
  require("dap-view").add_expr()
end, { desc = "Debugger add expression" })

-- Finder
vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-dap.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("telescope").load_extension("ui-select")
require("telescope").load_extension("live_grep_args")
require("telescope").setup({
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown({}) }
  },
  defaults = {
    preview = true,
    dynamic_preview_title = true,
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        preview_cutoff = 0
      }
    },
    sorting_strategy = "descending",
    borderchars = { border_style[2], border_style[4], border_style[6], border_style[8], border_style[1], border_style[3], border_style[5], border_style[7] },
    file_ignore_patterns = { "node_modules", ".git/" },
    mappings = {
      n = {
        ["<leader><leader>"] = require("telescope.actions").close
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<leader>x"] = require("telescope.actions").delete_buffer
        }
      }
    }
  }
})

vim.keymap.set({ "n", "t" }, "<leader>ff", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "Find file" })
vim.keymap.set({ "n", "t" }, "<leader>fgs", function()
  require("telescope.builtin").git_status()
end, { desc = "Git status" })
vim.keymap.set({ "n", "t" }, "<leader>fgb", function()
  require("telescope.builtin").git_branches()
end, { desc = "Git status" })
vim.keymap.set({ "n", "t" }, "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Find pattern with args" })
vim.keymap.set({ "n", "t" }, "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffer" })
vim.keymap.set({ "n", "t" }, "<leader>fr", function()
  require("telescope.builtin").resume()
end, { desc = "Resume last picker" })
vim.keymap.set({ "n", "t" }, "<leader>fc", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true, cwd = "~/.config/nvim" })
end, { desc = "Find config files", silent = true })
vim.keymap.set({ "n", "t" }, "<leader>fn", function()
  vim.cmd("Telescope notify")
end, { desc = "Find notification", silent = true })
