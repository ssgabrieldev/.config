local vim = vim

vim.pack.add({
  "https://github.com/ssgabrieldev/term.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

local term = require("term")

term.setup()

vim.keymap.set({ "n", "t" }, "<leader>tt", function()
  term.toggle({ id = vim.v.count })
end, { desc = "Toggle terminals", silent = true })
vim.keymap.set({ "n", "t" }, "<leader>to", function()
  term.open({ id = vim.v.count })
end, { desc = "Open terminal", silent = true })
vim.keymap.set({ "n", "t" }, "<leader>tc", function()
  term.close({ id = vim.v.count })
end, { desc = "Close terminal", silent = true })
