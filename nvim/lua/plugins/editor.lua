local vim = vim

-- GIT
vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("gitsigns").setup({
  current_line_blame = true,
})

vim.keymap.set("n", "<leader>gt", function()
  vim.cmd("Gitsigns toggle_linehl")
  vim.cmd("Gitsigns toggle_deleted")
end, { desc = "Toggle Line Git Diff", silent = true })

vim.keymap.set("n", "<leader>gd", function()
  vim.cmd("Gitsigns diffthis")
end, { desc = "Toggle Git Diff", silent = true })

-- COMPLETION
vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/saghen/blink.lib",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1"
  }
}, { confirm = vim.g.vim_pack_add_confirm })

require("blink.cmp").setup({
  fuzzy = { implementation = "lua" },
  cmdline = {
    enabled = true,
    keymap = { preset = 'cmdline' },
    sources = { 'buffer', 'cmdline' },
    completion = {
      menu = { auto_show = true },
      list = {
        selection = {
          preselect = false,
          auto_insert = true
        }
      },
    }
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
    ghost_text = { enabled = true },
    list = {
      selection = {
        preselect = false,
        auto_insert = true
      }
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "codecompanion" },
    providers = {
      codecompanion = {
        name = "CodeCompanion",
        module = "codecompanion.providers.completion.blink",
        opts = {}
      },
    },
  },
  keymap = {
    ["<s-tab>"] = { "select_prev", "fallback" },
    ["<tab>"] = { "select_next", "fallback" },
    ["<cr>"] = { "accept", "fallback" },
    ["<c-u>"] = { "scroll_documentation_up", "fallback" },
    ["<c-d>"] = { "scroll_documentation_down", "fallback" }
  }
})

-- MINI MAP
vim.pack.add({
  "https://github.com/Isrothy/neominimap.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

vim.g.neominimap = {
  auto_enable = true,
  float = {
    window_border = vim.g.border_style,
  },
}

vim.keymap.set("n", "<leader>mm", "<CMD>Neominimap Toggle<CR>", { desc = "Mini Map Toggle" })
vim.keymap.set("n", "<leader>mf", "<CMD>Neominimap ToggleFocus<CR>", { desc = "Mini Map Toggle Focus" })

-- MARK VIEW
vim.pack.add({
  "https://github.com/OXY2DEV/markview.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("markview").setup({
  preview = {
    enable_hybrid_mode = true,
    condition = function(buffer)
      local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt;
      local filetypes = { "markdown", "codecompanion" }

      if vim.tbl_contains(filetypes, ft) then
        return true;
      elseif bt == "nofile" and ft == "codecompanion" then
        return false;
      end

      return false
    end
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
      style = "simple",
      label_direction = "right"
    }
  }
})

vim.keymap.set("n", "<leader>mv", "<cmd>Markview toggle<cr>", {
  desc = "Toggle Markview Preview"
})

-- IDENT BLANKLINE
vim.pack.add({
  "https://github.com/lukas-reineke/indent-blankline.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

require("ibl").setup({
  indent = {
    char = "▏"
  }
})

-- TREE SITTER
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
}, { confirm = vim.g.vim_pack_add_confirm })

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

-- LSP
vim.pack.add({
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/williamboman/mason-lspconfig.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("mason").setup({ ui = { border = vim.g.border_style } })
require("mason-lspconfig").setup({ automatic_enable = true })

local signs = { Error = "", Warn  = "", Hint  = "󰌶", Info  = "󰋽" }
local opts = { noremap = true, silent = true }
local lsp_config = { capabilities = vim.lsp.protocol.make_client_capabilities() }

vim.diagnostic.config({
  float = { border =  vim.g.border_style },
  virtual_lines = false,
  virtual_text = { prefix = "󰧞", spacing = 0 },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = signs.Error,
      [vim.diagnostic.severity.WARN] = signs.Warn,
      [vim.diagnostic.severity.HINT] = signs.Hint,
      [vim.diagnostic.severity.INFO] = signs.Info,
    },
  },
})

vim.lsp.config("*", lsp_config)

vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
vim.keymap.set({ "n", "v" }, "<leader>lf", function()
  vim.lsp.buf.format({ async = true })
end, opts)
vim.keymap.set("n", "<leader>lh", function()
  vim.lsp.buf.hover({
    border = vim.g.border_style
  })
end, opts)
vim.keymap.set("n", "<leader>le", function()
  vim.diagnostic.open_float({
    border = vim.g.border_style
  })
end, opts)
