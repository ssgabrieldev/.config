return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
      require("tokyonight").setup({
        plugins = { ["nvim-tree"] = false }
      })
      -- vim.cmd("colorscheme tokyonight-night")
    end
  },
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'darker'
      }
      -- require('onedark').load()
    end
  },
  {
    'projekt0n/github-nvim-theme',
    name = 'github-theme',
    lazy = false,
    priority = 1000,
    config = function()
      require('github-theme').setup({})

      -- vim.cmd('colorscheme github_dark_colorblind')
    end,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require('kanagawa').setup({})

      -- vim.cmd("colorscheme kanagawa-dragon")
    end
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- require('nordic').load()
    end
  },
  {
    -- "ssgabrieldev/knot.nvim",
    dir = "~/Documentos/my/dev/knot.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.cmd("color knot")
    end,
  }
}
