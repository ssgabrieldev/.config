local vim = vim

vim.pack.add({
  "https://github.com/OXY2DEV/markview.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("markview").setup({
  preview = {
    enable_hybrid_mode = true,
    condition = function(buffer)
      local ft, bt = vim.bo[buffer].ft, vim.bo[buffer].bt;
      local filetypes = { "markdown", "codecompanion" }

      if vim.tbl_contains(filetypes, ft) then
        return true;
      elseif bt == "nofile" and ft == "codecompanion"  then
        return false;
      end

      return false
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
