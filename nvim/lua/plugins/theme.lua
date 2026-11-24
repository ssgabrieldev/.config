vim.pack.add({ 'projekt0n/github-nvim-theme' })

require('github-theme').setup({
  options = {
    transparent = true,
    terminal_colors = false
  },
  groups = {
    all = {
      CursorLine = false
    }
  }
})

vim.cmd('colorscheme github_dark_default')
