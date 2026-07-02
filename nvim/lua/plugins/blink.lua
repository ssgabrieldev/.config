local vim = vim

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
