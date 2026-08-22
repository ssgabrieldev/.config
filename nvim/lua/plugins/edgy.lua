local vim = vim
local wo = { winfixbuf = true, winbar = false, winhighlight = "", signcolumn = "no" }

vim.pack.add({
  "https://github.com/folke/edgy.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("edgy").setup({
  animate = {
    enabled = false,
  },
  left = {
    { ft = "NvimTree", wo = wo }
  },
  bottom = {
    {
      ft = "toggleterm",
      wo = vim.tbl_extend("force", wo, {
        signcolumn = "yes:1"
      }),
      filter = function(buf, win)
        return vim.api.nvim_win_get_config(win).relative == ""
      end,
    },
    { ft = "dap-view://main", wo = wo, },
    { ft = "dap-view-term", wo = wo, },
    { ft = "dap-view", wo = wo, },
    { ft = "dap-repl", wo = wo, },
    { ft = "qf", wo = wo, },
    { ft = "help", wo = wo, },
  },
  right = {
    { ft = "codecompanion", wo = wo, },
  },
  options = {
    left = {
      size = function()
        local f = (20 * vim.o.columns) / 100
        local i, _ = math.modf(f)
        local min = 30

        if i < min then
          return min
        end

        return i
      end
    },
    bottom = {
      size = function()
        local f = (40 * vim.o.lines) / 100
        local i, _ = math.modf(f)
        local min = 16

        if i < min then
          return min
        end

        return i
      end
    },
    right = {
      size = function()
        local f = (21 * vim.o.columns) / 100
        local i, _ = math.modf(f)
        local min = 30

        if i < min then
          return min
        end

        return i
      end
    },
    top = { size = 0 },
  },
  keys = {
    ["<a-l>"] = function(win)
      win:resize("width", 2)
    end,
    ["<a-h>"] = function(win)
      win:resize("width", -2)
    end,
    ["<a-k>"] = function(win)
      win:resize("height", 2)
    end,
    ["<a-j>"] = function(win)
      win:resize("height", -2)
    end,
  }
})
