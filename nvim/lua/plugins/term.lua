local vim = vim
local lazygit = nil

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

vim.keymap.set({ "n", "t" }, "<leader>tg", function()
  if not lazygit then
    lazygit = term.new({
      id = 1000,
      cmd = "lg",
      on_exit = function()
        lazygit = nil
      end
    })
  end

  term.toggle({ id = lazygit.id })

  if lazygit:is_open() then
    vim.cmd("startinsert")
  end
end, { desc = "Lazy Git", silent = true })
