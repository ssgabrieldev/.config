local vim = vim

vim.pack.add({
  { src = "https://github.com/Isrothy/neominimap.nvim" },
})

vim.g.neominimap = {
  auto_enable = true,
  float = {
    window_border = vim.g.border_style,
  },
}

vim.keymap.set("n", "<leader>mm", "<CMD>Neominimap Toggle<CR>" , { desc = "Mini Map Toggle" })
vim.keymap.set("n", "<leader>mf", "<CMD>Neominimap ToggleFocus<CR>" , { desc = "Mini Map Toggle Focus" })
