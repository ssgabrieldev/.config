local vim = vim

vim.pack.add({
  "https://github.com/lukas-reineke/indent-blankline.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

require("ibl").setup({
  indent = {
    char = "|"
  }
})
