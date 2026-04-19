local vim = vim

vim.pack.add({
  "rcarriga/nvim-notify",
}, { confirm = vim.g.vim_pack_add_confirm })

require("notify").setup({
  -- background_colour = "#000000",
  stages = "static",
  timeout = 2500,
  max_width = 45,
  top_down = false,
  render = "wrapped-compact",
  on_open = function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_set_option(buf, "filetype", "notify")
    vim.api.nvim_win_set_config(win, {
      focusable = false,
      border = vim.g.border_style
    })
  end
})

vim.notify = require("notify")

vim.keymap.set("n", "<leader>nc", function()
  require("notify").dismiss()
end, { desc = "Close notifications", silent = true })
