local vim=vim

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
