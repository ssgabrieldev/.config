local vim = vim

vim.pack.add({
  "https://github.com/rcarriga/nvim-notify",
}, { confirm = vim.g.vim_pack_add_confirm })

require("notify").setup({
  -- max_width = 45,
  stages = "static",
  timeout = 5000,
  top_down = false,
  render = "wrapped-default",
  on_open = function(win)
    local buf = vim.api.nvim_win_get_buf(win)
    vim.api.nvim_buf_set_option(buf, "filetype", "notify")
    vim.api.nvim_win_set_config(win, {
      focusable = false,
      border = vim.g.border_style,
    })
  end
})

vim.notify = require("notify")

vim.keymap.set("n", "<leader>nh", function()
  vim.cmd("Notifications")
end, { desc = "Close notifications", silent = true })
vim.keymap.set("n", "<leader>nc", function()
  require("notify").dismiss()
end, { desc = "Close notifications", silent = true })
