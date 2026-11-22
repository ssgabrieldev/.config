vim.pack.add({ 'projekt0n/github-nvim-theme' })

require('github-theme').setup({
  options = {
    transparent = true,
  },
  groups = {
    all = {
      CursorLine = { link = "Normal" }
    }
  }
})

vim.cmd('colorscheme github_dark_default')
