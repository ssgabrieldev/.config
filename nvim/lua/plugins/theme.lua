local vim = vim
local transparent = true

vim.pack.add({
  "https://github.com/projekt0n/github-nvim-theme",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/rebelot/kanagawa.nvim",
  "https://github.com/AlexvZyl/nordic.nvim",
  "https://github.com/tiagovla/tokyodark.nvim",
  "https://github.com/ellisonleao/gruvbox.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

require("gruvbox").setup({
  transparent_mode = transparent
})

require("github-theme").setup({
  options = {
    transparent = transparent,
    terminal_colors = false
  }
})

require("onedark").setup({
  style = "deep",
  transparent = transparent,
  lualine = {
    transparent = transparent
  }
})

require("kanagawa").setup({
  transparent = transparent,
  theme = "wave"
})

require("nordic").setup({
  bold_keywords = true,
  italic_comments = true,
  reduced_blue = false,
  transparent = {
    bg = transparent,
    float = transparent
  },
  cursorline = {
    blend = 0
  },
  telescope = {
    style = "classic"
  }
})

require("tokyodark").setup({
  transparent_background = transparent,
  gamma = 0.8
})

vim.cmd("colorscheme tokyodark")
-- require("onedark").load()
