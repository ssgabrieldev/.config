local vim = vim

vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
}, { confirm = vim.g.vim_pack_add_force })

require("toggleterm").setup({
  persist_size = false,
  persist_mode = true,
  shade_terminals = false,
  winbar = { enabled = false },
  float_opts = {
    border = vim.g.border_style,
    title_pos = "center",
    winblend = 0,
    width = function()
      return vim.o.columns - 2
    end,
    height = function()
      return vim.o.lines - 4
    end,
  },
  highlights = {
    Normal = {
      link = "NvimTreeNormal"
    }
  }
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
