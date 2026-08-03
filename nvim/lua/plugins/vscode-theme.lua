local vim = vim

vim.pack.add({
  "https://github.com/mofiqul/vscode.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require('vscode').setup({
  transparent = false,
  italic_comments = true,
  italic_inlayhints = true,
  underline_links = true,
  disable_nvimtree_bg = true,
  terminal_colors = true,
  color_overrides = {
    -- vscLineNumber = '#FFFFFF',
  },
  group_overrides = {
    -- Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
  }
})

vim.cmd("color vscode")
