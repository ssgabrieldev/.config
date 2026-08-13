local vim = vim
local lazygit = nil

vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
}, { confirm = vim.g.vim_pack_add_force })

require("toggleterm").setup({
  persist_size = false,
  persist_mode = true,
  shade_terminals = false,
  winbar = {
    enabled = true,
    name_formatter = function(term)
      return term.id .. "<LEADER>tt"
    end
  },
  float_opts = {
    border = vim.g.border_style,
    title_pos = "center",
    winblend = 0,
    width = function()
      return vim.o.columns
    end,
    height = function()
      return vim.o.lines
    end,
  },
})

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  vim.cmd(vim.v.count .. "ToggleTerm direction=horizontal")
end, {
  desc = "Toggle horizontal terminals",
  silent = true
})
vim.keymap.set({ "n", "t" }, "<leader>tf", function()
  vim.cmd(vim.v.count .. "ToggleTerm direction=float")
end, { desc = "Toggle float terminals", silent = true })
vim.keymap.set({ "n", "t" }, "<leader>tg", function()
  local Terminal = require('toggleterm.terminal').Terminal

  if lazygit == nil then
    lazygit = Terminal:new({
      cmd = "lg",
      hidden = true,
      display_name = "LazyGit",
      direction = "float",
      close_on_exit = true
    })
  end

  lazygit:toggle()
end, { desc = "Toggle float terminals", silent = true })
