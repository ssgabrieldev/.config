local vim = vim

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
  float = { border = vim.g.border_style },
  virtual_text = { prefix = " ", spacing = 1 },
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
    border = vim.g.border_style,
    max_width = 100,
    max_height = 35
  })
end, opts)
vim.keymap.set("n", "<leader>le", function()
  vim.diagnostic.open_float({
    border = vim.g.border_style,
    max_width = 100,
    max_height = 35
  })
end, opts)

