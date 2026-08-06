local vim = vim

vim.g.mapleader = ";"
-- vim.g.border_style = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" }
-- vim.g.border_style = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
vim.g.border_style = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

if vim.fn.executable("/usr/bin/fish") == 1 then
  vim.o.shell = "/usr/bin/fish"
end

if vim.env.SSH_TTY then
  local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  local osc52 = require("vim.ui.clipboard.osc52")
  vim.g.clipboard = {
    name = "OSC 52",
    copy = {
      ["+"] = osc52.copy("+"),
      ["*"] = osc52.copy("*"),
    },
    paste = {
      ["+"] = paste,
      ["*"] = paste,
    },
  }
end

vim.wo.wrap = false
vim.wo.number = true
vim.wo.relativenumber = true

local tab_len = 2
vim.opt.splitkeep = "screen"
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.cmdheight = 0
vim.opt.cursorline = true
vim.opt.tabstop = tab_len
vim.opt.softtabstop = tab_len
vim.opt.shiftwidth = tab_len
vim.opt.expandtab = true
vim.opt.swapfile = true
vim.opt.directory = "/tmp//"
vim.opt.splitright = true
vim.opt.smartindent = true
vim.opt.scrolloff = 5
vim.opt.termsync = false
vim.opt.timeout = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo"
vim.opt.undofile = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.lsp.foldexpr()"
vim.opt.foldlevel = 99

vim.o.confirm = true

require("keymaps")

-- THEMES

-- PLUGINS
require("plugins.toggleterm")
require("plugins.nvim-tree")
require("plugins.bufferline")
require("plugins.telescope")
require("plugins.ident-blankline")
require("plugins.edgy")
require("plugins.mason")
require("plugins.treesitter")
require("plugins.lualine")
require("plugins.notify")
require("plugins.dap")
require("plugins.companion")
require("plugins.markview")
require("plugins.git")
require("plugins.blink")
require("theme").setup()
