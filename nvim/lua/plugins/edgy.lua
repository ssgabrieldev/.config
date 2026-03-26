local vim = vim
local common_panel_highlight = "EndOfBuffer:NvimTreeEndOfBuffer,Normal:NvimTreeNormal,CursorLine:CursorLine"

local function get_toggleterm_winbar()
  local toggle_terminal = require("toggleterm.terminal")
  local bufs = vim.api.nvim_list_bufs()
  local items = {}

  for _, buf in ipairs(bufs) do
    local id = vim.b[buf].toggle_number

    if id ~= nil then
      local term = toggle_terminal.get(id)

      if term then
        local name = "   " .. term.id .. ":" .. vim.split(term.name, ";#")[1] .. "  "
        local hl = term:is_open() and "%#BufferLineBufferSelected#" or "%#BufferLineBackground#"

        table.insert(items, hl .. name)
      end
    end
  end

  local winbar = "%*" .. table.concat(items, "") .. "%#BufferLineFill#"

  return winbar
end

_G.custom_toggleterm_bar = get_toggleterm_winbar

return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  opts = {
    fix_win_height = true,
    left = {
      {
        ft = "NvimTree",
        wo = {
          winfixbuf = false,
          winbar = false
        }
      }
    },
    bottom = {
      {
        ft = "toggleterm",
        filter = function(buf, win)
          return vim.api.nvim_win_get_config(win).relative == ""
        end,
        wo = {
          winfixbuf = true,
          winbar = "%{%v:lua.custom_toggleterm_bar()%}",
        },
      },
      {
        ft = "dap-view://main",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
      {
        ft = "dap-view-term",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
      {
        ft = "dap-view",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
      {
        ft = "dap-repl",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
      {
        ft = "qf",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
      {
        ft = "help",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
    },
    right = {
      {
        ft = "codecompanion",
        wo = {
          winfixbuf = true,
          winbar = false,
          winhighlight = common_panel_highlight
        }
      },
    },
    top = {},
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
    animate = {
      enabled = false
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
  },
}
