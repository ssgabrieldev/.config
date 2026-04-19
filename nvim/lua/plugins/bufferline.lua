local vim = vim

vim.pack.add({
  "https://github.com/akinsho/bufferline.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

require("bufferline").setup({
  options = {
    mode = "buffers",
    separator_style = { "", "" },
    indicator = { icon = "", style = "none" },
    themable = true,
    diagnostics = "nvim_lsp",
    diagnostics_indicator = false,
    offsets = {
      { filetype = "NvimTree",      text = "", text_align = "center", separator = true, highlight = "NvimTreeNormal" },
      { filetype = "codecompanion", text = "", text_align = "center", separator = true, highlight = "NvimTreeNormal" },
    },
  },
})

vim.keymap.set("n", "<TAB>", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<S-TAB>", "<Cmd>BufferLineCyclePrev<CR>",
  { desc = "Previous Buffer", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bh", "<Cmd>BufferLineMovePrev<CR>",
  { desc = "Move Buffer Left", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bl", "<Cmd>BufferLineMoveNext<CR>",
  { desc = "Move Buffer Right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLinePick<CR>", { desc = "Buffer picker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<Cmd>BufferLinePickClose<CR>",
  { desc = "Close buffer via picker", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bH", "<Cmd>BufferLineCloseLeft<CR>",
  { desc = "Close all buffers to the left", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bL", "<Cmd>BufferLineCloseRight<CR>",
  { desc = "Close all buffers to the right", noremap = true, silent = true })
vim.keymap.set("n", "<leader>bO", "<Cmd>BufferLineCloseOthers<CR>",
  { desc = "Close all other buffers", noremap = true, silent = true })
