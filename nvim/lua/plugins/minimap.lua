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

vim.keymap.set("n", "<leader>mm", function()
  require('neominimap.api').toggle()
end
, {
  desc = "Toggle Markview Preview"
})
