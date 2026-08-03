local vim = vim

vim.pack.add({
  "https://github.com/nvim-lualine/lualine.nvim",
}, { confirm = vim.g.pack_add_confirm })

require("lualine").setup({
  options = {
    -- theme = require("theme").lualine(),
    globalstatus = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  }
})
