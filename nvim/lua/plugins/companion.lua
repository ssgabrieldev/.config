local vim = vim

vim.pack.add({
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/olimorris/codecompanion.nvim"
}, { confirm = vim.g.vim_pack_add_confirm })

require("copilot").setup({
  suggestion = {
    auto_trigger = false,
    enabled = true,
    keymap = {
      accept = "<leader>ca",
      next = "<leader>cn",
      prev = "<leader>cp",
      dismiss = "<leader>cd",
    }
  },
  panel = { enabled = false },
})

require("codecompanion").setup({
  strategies = {
    chat = {
      adapter = "copilot",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    }
  }
})

vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionActions<cr>", {
  desc = "Code Companion Actions",
  silent = true
})
