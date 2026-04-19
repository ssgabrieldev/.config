local vim = vim

vim.pack.add({
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-tree/nvim-tree.lua"
}, { confirm = vim.g.vim_pack_add_confirm })

require("nvim-tree").setup({
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = { corner = "|", edge = "|", item = "|", bottom = " ", none = " " },
    },
  },
  filters = { enable = false },
  actions = {
    open_file = {
      resize_window = false,
      window_picker = { enable = false }
    }
  },
  update_focused_file = { enable = true }
})

vim.keymap.set("n", "<leader>ee", function()
  require("nvim-tree.api").tree.toggle()
end, { desc = "Toggle NvimTree", silent = true })
