local vim = vim

vim.pack.add({
  "https://github.com/Isrothy/neominimap.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

vim.g.neominimap = {
  auto_enable = true,
  float = {
    window_border = vim.g.border_style,
  },
}

vim.keymap.set("n", "<leader>mm", "<CMD>Neominimap Toggle<CR>" , { desc = "Mini Map Toggle" })
vim.keymap.set("n", "<leader>mf", "<CMD>Neominimap ToggleFocus<CR>" , { desc = "Mini Map Toggle Focus" })
