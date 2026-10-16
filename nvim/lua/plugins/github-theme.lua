local vim = vim

vim.pack.add({
  "https://github.com/projekt0n/github-nvim-theme"
}, { confirm = vim.g.vim_pack_add_confirm })


require('github-theme').setup({
  options = {
    transparent = true
  }
})

vim.cmd('colorscheme github_dark_colorblind')
