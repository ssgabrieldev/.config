local vim = vim
local utils = require("utils")

vim.pack.add({ utils.gh("nvim-tree/nvim-web-devicons"),
  -- NVIM DEV ICONS: install
  -- TOKYONIGHT: install
  utils.gh("folke/tokyonight.nvim"),

  -- ONEDARK: install
  utils.gh("navarasu/onedark.nvim"),

  -- KANAGAWA: install
  utils.gh("rebelot/kanagawa.nvim"),

  -- KNOT: install
  utils.gh("rktjmp/lush.nvim"),
  utils.gh("ssgabrieldev/knot.nvim"),

  -- NVIM_TREE: install
  utils.gh("nvim-tree/nvim-tree.lua"),

  -- BUFFERLINE: install
  utils.gh("akinsho/bufferline.nvim"),

  -- TELESCOPE: install
  utils.gh("nvim-telescope/telescope.nvim"),
  utils.gh("nvim-lua/plenary.nvim"),
  utils.gh("mfussenegger/nvim-dap"),
  utils.gh("nvim-telescope/telescope-dap.nvim"),
  utils.gh("nvim-telescope/telescope-ui-select.nvim"),
  utils.gh("nvim-telescope/telescope-live-grep-args.nvim"),

  -- IDENT_BLANK_LINES: install
  utils.gh("lukas-reineke/indent-blankline.nvim"),

  -- EDGY: install
  utils.gh("folke/edgy.nvim"),

  -- MASON: install
  utils.gh("williamboman/mason.nvim"),
  utils.gh("neovim/nvim-lspconfig"),
  utils.gh("williamboman/mason-lspconfig.nvim"),

  -- TREE_SITTER: install
  utils.gh("nvim-treesitter/nvim-treesitter"),

  -- LUA_LINE: install
  utils.gh("nvim-lualine/lualine.nvim"),

  -- NOTIFY: install
  utils.gh("rcarriga/nvim-notify"),

  -- DAP: install
  utils.gh("mfussenegger/nvim-dap"),
  utils.gh("igorlfs/nvim-dap-view"),
  utils.gh("nvim-neotest/nvim-nio"),
  utils.gh("nvim-telescope/telescope.nvim"),
  utils.gh("nvim-telescope/telescope-dap.nvim"),
  utils.gh("rcarriga/nvim-notify"),
  utils.gh("nvim-tree/nvim-tree.lua"),

  -- DAP_VIEW: install
  utils.gh("igorlfs/nvim-dap-view"),

  -- COPILOT: install
  utils.gh("zbirenbaum/copilot.lua"),

  -- CODE_COMPANION: install
  utils.gh("nvim-lua/plenary.nvim"),
  utils.gh("olimorris/codecompanion.nvim"),

  -- TOGGLETERM: install
  utils.gh("akinsho/toggleterm.nvim"),

  -- MARKVIEW: install
  utils.gh("OXY2DEV/markview.nvim"),

  -- GIT_SIGNS: install
  utils.gh("lewis6991/gitsigns.nvim"),

  -- BLINK: install
  utils.gh("rafamadriz/friendly-snippets"),
  utils.gh("saghen/blink.cmp")
}, { confirm = false })

-- NVIM DEV ICONS: setup
require("nvim-web-devicons").setup()

-- TOKYONIGHT: setup
require("tokyonight").setup({})

-- ONEDARK: setup
require("onedark").setup({ style = "darker" })

-- KANAGAWA: setup
require("kanagawa").setup({})

-- NVIM_TREE: setup
require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = { corner = "|", edge = "|", item = "|", bottom = " ", none = " " },
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
-- NVIM_TREE: keys
vim.keymap.set("n", "<leader>ee", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree", silent = true })

-- BUFFERLINE: setup
require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = { "", "" },
    indicator = { icon = "", style = "none" },
    themable = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = false,
    offsets = {
      { filetype = "NvimTree",      text = "", text_align = "center", separator = true, highlight = "NvimTreeNormal" },
      { filetype = "codecompanion", text = "", text_align = "center", separator = true, highlight = "NvimTreeNormal" },
    },
  },
})
-- BUFFERLINE: keys
vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>",
  { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", "<Cmd>BufferLineMovePrev<CR>",
  { desc = "Move Buffer Left", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineMoveNext<CR>",
  { desc = "Move Buffer Right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Buffer picker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>",
  { desc = "Close buffer via picker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bH", "<Cmd>BufferLineCloseLeft<CR>",
  { desc = "Close all buffers to the left", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bL", "<Cmd>BufferLineCloseRight<CR>",
  { desc = "Close all buffers to the right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bO", "<Cmd>BufferLineCloseOthers<CR>",
  { desc = "Close all other buffers", noremap = true, silent = true })

-- TELESCOPE: setup
require("telescope").load_extension("ui-select")
require("telescope").load_extension("live_grep_args")
require("telescope").setup({
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown({}) }
  },
  defaults = {
    preview = true,
    layout_strategy = "horizontal",
    sorting_strategy = "ascending",
    borderchars = { "▔", "▕", "▁", "▏", "🭽", "🭾", "🭿", "🭼" },
    layout_config = { horizontal = { prompt_position = "top" } },
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
-- TELESCOPE: keys
vim.keymap.set({ "n", "t" }, "<leader>ff", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true, })
end, { desc = "Find file" })
vim.keymap.set({ "n", "t" }, "<leader>fg", function()
  require("telescope.builtin").git_status()
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

-- IDENT_BLANK_LINES: setup
require("ibl").setup({
  indent = {
    char = "|"
  }
})

-- EDGY: setup
require("edgy").setup({
  animate = { enabled = false },
  left = {
    {
      ft = "NvimTree",
      wo = { winfixbuf = true, winbar = false }
    }
  },
  bottom = {
    {
      ft = "toggleterm",
      wo = { winfixbuf = true, winbar = "", winhighlight = "" },
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    {
      ft = "dap-view://main",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
    {
      ft = "dap-view-term",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
    {
      ft = "dap-view",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
    {
      ft = "dap-repl",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
    {
      ft = "qf",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
    {
      ft = "help",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
  },
  right = {
    {
      ft = "codecompanion",
      wo = { winfixbuf = true, winbar = false, winhighlight = "" }
    },
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
        local min = 16

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
  -- EDGY: keys
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
      win:resize("height", -2)
    end,
  }
})

-- MASON: setup
require("mason").setup({ ui = { border = vim.g.border_style } })
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "ts_ls",
    "emmet_ls",
    "cssls"
  },
  automatic_enable = true
})

local border = vim.g.border_style or "rounded"
local signs = {
  Error = "",
  Warn  = "",
  Hint  = "󰌶",
  Info  = "󰋽",
}

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  float = { border = border },
  signs = true,
  virtual_text = {
    prefix = " ",
    spacing = 1,
  }
})

require("lspconfig.ui.windows").default_options = {
  border = border
}

local opts = { noremap = true, silent = true }
local lsp_config = { capabilities = vim.lsp.protocol.make_client_capabilities(), }

vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, opts)
vim.keymap.set("n", "<leader>lh", function()
  vim.lsp.buf.hover({
    border = border,
    max_width = 100,
    max_height = 35
  })
end, opts)
vim.keymap.set("n", "<leader>le", function()
  vim.diagnostic.open_float({
    border = border,
    max_width = 100,
    max_height = 35
  })
end, opts)

vim.lsp.config("*", lsp_config)

-- TREE_SITTER: setup
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  ident = {
    enable = true,
  },
  fold = {
    enable = true
  }
})

-- LUA_LINE: setup
require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  }
})

-- NOTIFY: setup
require("notify").setup({
  -- background_colour = "#000000",
  stages = "static",
  timeout = 2500,
  max_width = 45,
  top_down = false,
  render = "wrapped-compact",
  on_open = function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_set_option(buf, "filetype", "notify")
    vim.api.nvim_win_set_config(win, {
      focusable = false,
      border = vim.g.border_style
    })
  end
})
vim.notify = require("notify")
-- NOTIFY: keys
vim.keymap.set("n", "<leader>nc", function()
  require("notify").dismiss()
end, { desc = "Close notifications", silent = true })

-- DAP: setup
local js_debugger = { "pwa-chrome", "pwa-node" }

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

for _, debugger in ipairs(js_debugger) do
  require("dap").adapters[debugger] = function(cb)
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

-- DAP_VIEW: setup
require("dap-view").setup({
  winbar = {
    sections = {
      "watches",
      "scopes",
      "exceptions",
      "breakpoints",
      "threads",
      "repl",
      "console"
    },
    default_section = "repl",
    controls = {
      enabled = true
    },
    base_sections = {
      breakpoints = { label = utils.build_dap_title("Breakpoints", ""), keymap = "B" },
      scopes = { label = utils.build_dap_title("Scopes", "󰭳"), keymap = "S" },
      exceptions = { label = utils.build_dap_title("Exceptions", "󱈸"), keymap = "E" },
      watches = { label = utils.build_dap_title("Watches", "󰈈"), keymap = "W" },
      threads = { label = utils.build_dap_title("Threads", ""), keymap = "T" },
      repl = { label = utils.build_dap_title("REPL", ""), keymap = "R" },
      sessions = { label = utils.build_dap_title("Sessions", "󰭳"), keymap = "K" },
      console = { label = utils.build_dap_title("Console", ""), keymap = "C" },
    },
  }
})
-- DAP_VIEW: keys
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  require("dap").terminate({}, {}, {
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

-- COPILOT: setup
require("copilot").setup({
  suggestion = {
    auto_trigger = false,
    enabled = true,
    -- COPILOT: keys
    keymap = {
      accept = "<leader>ca",
      next = "<leader>cn",
      prev = "<leader>cp",
      dismiss = "<leader>cd"
    }
  },
  panel = { enabled = false },
})

-- CODE_COMPANION: setup
require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    }
  }
})
-- CODE_COMPANION: keys
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionActions<cr>", {
  desc = "Code Companion Actions",
  silent = true
})

-- TOGGLETERM: setup
require("toggleterm").setup({
  persist_size = false,
  persist_mode = true,
  shade_terminals = false,
  winbar = { enabled = false },
  float_opts = {
    border = vim.g.border_style,
    title_pos = "center",
    winblend = 0,
    width = function()
      return vim.o.columns - 2
    end,
    height = function()
      return vim.o.lines - 4
    end,
  },
  highlights = {
    Normal = {
      link = "NvimTreeNormal"
    }
  }
})
-- TOGGLETERM: keys
vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  vim.cmd(vim.v.count .. "ToggleTerm direction=horizontal")
end, {
  desc = "Toggle horizontal terminals",
  silent = true
})
vim.keymap.set({ "n", "t" }, "<leader>tf", function()
  vim.cmd(vim.v.count .. "ToggleTerm direction=float")
end, { desc = "Toggle float terminals", silent = true })

-- MARKVIEW: setup
require("markview").setup({
  preview = {
    filetypes = { "markdown", "codecompanion" },
  },
  markdown = {
    headings = {
      shift_width = 0,
      sign = false,
      heading_1 = {
        sign = "",
      },
      heading_2 = {
        sign = "",
      },
      heading_3 = {
        sign = "",
      },
      heading_4 = {
        sign = "",
      },
      heading_5 = {
        sign = "",
      }
    },
    code_blocks = {
      pad_amount = 0,
      wrap = true,
      sign = false,
      style = "block",
      label_direction = "right"
    }
  }
})
-- MARKVIEW: keys
vim.keymap.set("n", "<leader>mt", "<cmd>Markview toggle<cr>", {
  desc = "Toggle Markview Preview"
})

-- GIT_SIGNS: setup
require("gitsigns").setup({
  current_line_blame = true,
})
-- GIT_SIGNS: keys
vim.keymap.set("n", "<leader>gt", function()
  vim.cmd("Gitsigns toggle_linehl")
  vim.cmd("Gitsigns toggle_deleted")
end, { desc = "Toggle Line Git Diff", silent = true })
vim.keymap.set("n", "<leader>gd", function()
  vim.cmd("Gitsigns diffthis")
end, { desc = "Toggle Git Diff", silent = true })

-- BLINK: setup
require("blink.cmp").setup({
  fuzzy = { implementation = "lua" },
  cmdline = {
    enabled = true,
    keymap = { preset = 'cmdline' },
    sources = { 'buffer', 'cmdline' },
    completion = { menu = { auto_show = true } }
  },
  completion = {
    menu = {
      border = vim.g.border_style
    },
    documentation = {
      auto_show = true,
      window = {
        border = vim.g.border_style
      }
    },
    ghost_text = { enabled = true }
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  -- BLINK: keys
  keymap = {
    ["<s-tab>"] = { "select_prev", "fallback" },
    ["<tab>"] = { "select_next", "fallback" },
    ["<cr>"] = { "accept", "fallback" },
    ["<c-u>"] = { "scroll_documentation_up", "fallback" },
    ["<c-d>"] = { "scroll_documentation_down", "fallback" }
  }
})
