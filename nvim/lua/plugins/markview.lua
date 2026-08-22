local vim = vim

vim.pack.add({
  "https://github.com/OXY2DEV/markview.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("markview").setup({
  preview = {
    filetypes = { "markdown", "codecompanion" },
    condition = function(buffer)
      local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt;

      if bt == "nofile" and ft == "codecompanion" then
        return true;
      elseif bt == "nofile" then
        return false;
      else
        return true;
      end
    end
  },
  markdown = {
    headings = {
      shift_width = 0,
      sign = false,
      heading_1 = {
        sign = "",
      },
      heading_2 = {
        sign = "",
      },
      heading_3 = {
        sign = "",
      },
      heading_4 = {
        sign = "",
      },
      heading_5 = {
        sign = "",
      }
    },
    code_blocks = {
      pad_amount = 0,
      wrap = true,
      sign = false,
      style = "simple",
      label_direction = "right"
    }
  }
})

vim.keymap.set("n", "<leader>mv", "<cmd>Markview toggle<cr>", {
  desc = "Toggle Markview Preview"
})
