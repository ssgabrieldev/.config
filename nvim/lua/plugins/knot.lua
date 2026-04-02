return {
  "ssgabrieldev/knot.nvim",
  -- dir = "~/Documentos/my/dev/knot.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
    vim.cmd("color knot")
  end,
}
