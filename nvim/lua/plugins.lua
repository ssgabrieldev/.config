local vim = vim
local utils = require("utils")

-- TOKYONIGHT: install
vim.pack.add({ utils.gh("folke/tokyonight.nvim") }, { confirm = false })
-- TOKYONIGHT: setup
require("tokyonight").setup({})

-- ONEDARK: install
vim.pack.add({ utils.gh("navarasu/onedark.nvim") }, { confirm = false })
-- ONEDARK: setup
require('onedark').setup({ style = 'darker' })

-- KANAGAWA: install
vim.pack.add({ utils.gh("rebelot/kanagawa.nvim") }, { confirm = false })
-- KANAGAWA: setup
require('kanagawa').setup({})

-- KNOT: install
vim.pack.add({
  utils.gh("rktjmp/lush.nvim"),
  utils.gh("ssgabrieldev/knot.nvim")
}, { confirm = false })

-- NVIM TREE: install
vim.pack.add({ utils.gh("nvim-tree/nvim-tree.lua") }, { confirm = false })
-- NVIM TREE: setup
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
-- NVIM TREE: keys
vim.keymap.set("n", "<leader>ee", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree", silent = true })

-- BUFFERLINE: install
vim.pack.add({ utils.gh("akinsho/bufferline.nvim") }, { confirm = false })
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

-- TELESCOPE: install
vim.pack.add({
  utils.gh("nvim-telescope/telescope.nvim"),
  utils.gh("nvim-lua/plenary.nvim"),
  utils.gh("mfussenegger/nvim-dap"),
  utils.gh("nvim-telescope/telescope-dap.nvim"),
  utils.gh("nvim-telescope/telescope-ui-select.nvim"),
  utils.gh("nvim-telescope/telescope-live-grep-args.nvim"),
}, { confirm = false })
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
local builtin = require("telescope.builtin")
vim.keymap.set({ "n", "t" }, "<leader>ff", function()
  builtin.find_files({ hidden = true, no_ignore = true, })
end, { desc = "Find file" })
vim.keymap.set({ "n", "t" }, "<leader>fg", function()
  builtin.git_status()
end, { desc = "Git status" })
vim.keymap.set({ "n", "t" }, "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Find pattern with args" })
vim.keymap.set({ "n", "t" }, "<leader>fb", function()
  builtin.buffers()
end, { desc = "Find buffer" })
vim.keymap.set({ "n", "t" }, "<leader>fr", function()
  builtin.resume()
end, { desc = "Resume last picker" })
vim.keymap.set({ "n", "t" }, "<leader>fc", function()
  builtin.find_files({ hidden = true, no_ignore = true, cwd = "~/.config/nvim" })
end, { desc = "Find config files", silent = true })

-- IDENT BLANK LINES: install
vim.pack.add({ utils.gh("lukas-reineke/indent-blankline.nvim") }, { confirm = false })
-- IDENT BLANK LINES: setup
require("ibl").setup({
  indent = {
    char = "|"
  }
})

-- EDGY: install
vim.pack.add({ utils.gh("folke/edgy.nvim") }, { confirm = false })
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

-- MASON: install
vim.pack.add({
  utils.gh("williamboman/mason.nvim"),
  utils.gh("neovim/nvim-lspconfig"),
  utils.gh("williamboman/mason-lspconfig.nvim")
}, { confirm = false })
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

-- CMP: install
vim.pack.add({
  utils.gh("hrsh7th/nvim-cmp"),
  utils.gh("neovim/nvim-lspconfig"),
  utils.gh("hrsh7th/cmp-nvim-lsp"),
  utils.gh("hrsh7th/cmp-path"),
  utils.gh("L3MON4D3/LuaSnip"),
  utils.gh("saadparwaiz1/cmp_luasnip"),
  utils.gh("onsails/lspkind.nvim"),
  utils.gh("hrsh7th/cmp-buffer"),
  utils.gh("hrsh7th/cmp-cmdline"),
}, { confirm = false })
-- CMP: setup
local cmp = require("cmp")
local lspkind = require("lspkind")
local border = vim.g.border_style

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered({
      border = border,
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"
    }),
    documentation = cmp.config.window.bordered({
      border = border,
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,Search:None"
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<c-e>"] = cmp.mapping.abort(),
    ["<c-u>"] = cmp.mapping.scroll_docs(-4),
    ["<c-d>"] = cmp.mapping.scroll_docs(4),
    ["<c-Space>"] = cmp.mapping.complete(),
    ["<cr>"] = cmp.mapping.confirm({ select = true }),
    ["<tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<s-tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  formatting = {
    format = lspkind.cmp_format(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    { name = "codecompanion" }
  }, {
    { name = "buffer" },
  }),
  experimental = {
    ghost_text = {
      hl_group = "Comment",
    }
  }
})

cmp.setup.cmdline({ "/", "?" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- TREE SITTER: install
vim.pack.add({ utils.gh("nvim-treesitter/nvim-treesitter") }, { confirm = false })
-- TREE SITTER: setup
require("nvim-treesitter").setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
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

-- LUA LINE: install
vim.pack.add({ utils.gh("nvim-lualine/lualine.nvim") }, { confirm = false })
-- LUA LINE: setup
require("lualine").setup({
  options = {
    theme = "auto",
    globalstatus = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  }
})

-- NOTIFY: install
vim.pack.add({ utils.gh("rcarriga/nvim-notify") }, { confirm = false })
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

-- DAP: install
vim.pack.add({
  utils.gh("mfussenegger/nvim-dap"),
  utils.gh("igorlfs/nvim-dap-view"),
  utils.gh("nvim-neotest/nvim-nio"),
  utils.gh("nvim-telescope/telescope.nvim"),
  utils.gh("nvim-telescope/telescope-dap.nvim"),
  utils.gh("rcarriga/nvim-notify"),
  utils.gh("nvim-tree/nvim-tree.lua"),
}, { confirm = false })
-- DAP: setup
local dap = require("dap")
local js_debugger = { "pwa-chrome", "pwa-node" }

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

for _, debugger in ipairs(js_debugger) do
  dap.adapters[debugger] = function(cb)
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

dap.adapters.firefox = function(cb, config)
  if config.preLaunchTask then
    vim.fn.system(config.preLaunchTask)
  end

  cb({
    type = "executable",
    command = "firefox-debug-adapter",
  })
end

dap.listeners.before.attach.dapui_config = function()
  vim.notify("Debugger attatched", "info")
end
dap.listeners.before.launch.dapui_config = function()
  vim.notify("Debugger launched", "info")
end
dap.listeners.before.event_exited.dapui_config = function()
  vim.notify("Debugger exited", "info")
end

vim.keymap.set("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "Debugger toggle breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  dap.terminate({
    on_done = function()
      vim.notify("Debugger terminated", "info")
    end
  })
end, { desc = "Debugger terminate" })
vim.keymap.set("n", "<leader>dr", function()
  dap.continue()
end, { desc = "Debugger continue" })
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover(nil, { border = vim.g.border_style })
end, { desc = "Debugger add expression" })

-- DAP VIEW: install
vim.pack.add({ utils.gh("igorlfs/nvim-dap-view"), }, { confirm = false })
-- DAP VIEW: setup
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
-- DAP VIEW: keys
vim.keymap.set("n", "<leader>db", function()
  dap.toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  dap.terminate({}, {}, {
    on_done = function()
      vim.notify("Debugger terminated", "info")
    end,
  })
end, { desc = "DAP: Terminate" })
vim.keymap.set("n", "<leader>dr", function()
  dap.continue()
end, { desc = "DAP: Continue/Start" })
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover(nil, { border = vim.g.border_style or "rounded" })
end, { desc = "DAP: Hover Expression" })

-- CODE COMPANION: install
vim.pack.add({
  utils.gh("github/copilot.vim"),
  utils.gh("nvim-lua/plenary.nvim"),
  utils.gh("olimorris/codecompanion.nvim")
}, { confirm = false })
-- CODE COMPANION: setup
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
-- CODE COMPANION: keys
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionActions<cr>", {
  desc = "Code Companion Actions",
  silent = true
})

-- TOGGLETERM: install
vim.pack.add({ utils.gh("akinsho/toggleterm.nvim") }, { confirm = false })
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
  vim.cmd(vim.v.count + 1000 .. "ToggleTerm direction=horizontal")
end, { desc = "Toggle float terminals", silent = true })

-- MARKVIEW: install
vim.pack.add({ utils.gh("OXY2DEV/markview.nvim") }, { confirm = false })
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

-- GIT SIGNS: install
vim.pack.add({ utils.gh("lewis6991/gitsigns.nvim") })
-- GIT SIGNS: setup
require("gitsigns").setup({
  current_line_blame = true,
})
-- GIT SIGNS: keys
vim.keymap.set("n", "<leader>gt", function()
  vim.cmd("Gitsigns toggle_linehl")
  vim.cmd("Gitsigns toggle_deleted")
end, { desc = "Toggle Line Git Diff", silent = true })
vim.keymap.set("n", "<leader>gd", function()
  vim.cmd("Gitsigns diffthis")
end, { desc = "Toggle Git Diff", silent = true })
