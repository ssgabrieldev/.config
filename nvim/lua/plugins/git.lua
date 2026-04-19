local vim = vim

vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("gitsigns").setup({
  current_line_blame = true,
})

vim.keymap.set("n", "<leader>gt", function()
  vim.cmd("Gitsigns toggle_linehl")
  vim.cmd("Gitsigns toggle_deleted")
end, { desc = "Toggle Line Git Diff", silent = true })
vim.keymap.set("n", "<leader>gd", function()
  vim.cmd("Gitsigns diffthis")
end, { desc = "Toggle Git Diff", silent = true })
