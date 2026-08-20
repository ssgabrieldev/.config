local vim = vim

vim.pack.add({
  "https://github.com/zbirenbaum/copilot.lua",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/olimorris/codecompanion.nvim",
  "https://github.com/rcarriga/nvim-notify",
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
  adapters = {
    http = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-3.7-flash",
            },
          },
        })
      end,
      copilot = function()
        return require("codecompanion.adapters").extend("copilot", {
          schema = {
            model = {
              default = "gpt-4.1",
            },
          },
        })
      end
    }
  },
  interactions = {
    chat = {
      adapter = "gemini",
    },
    inline = {
      adapter = "copilot",
    },
    cmd = {
      adapter = "copilot",
    }
  },
  opts = {
    log_level = "DEBUG"
  }
})

vim.api.nvim_create_autocmd("User", {
  pattern = "CodeCompanionRequestStarted",
  callback = function()
    vim.notify("Prompt started", "info", {
      timeout = 500
    })
  end,
})

vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionActions<cr>", {
  desc = "Code Companion Actions",
  silent = true
})
