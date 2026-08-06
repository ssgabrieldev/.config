local vim = vim
local border_style = vim.g.border_style

vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope-dap.nvim",
  "https://github.com/nvim-telescope/telescope-ui-select.nvim",
  "https://github.com/nvim-telescope/telescope-live-grep-args.nvim",
}, { confirm = vim.g.vim_pack_add_confirm })

require("telescope").load_extension("ui-select")
require("telescope").load_extension("live_grep_args")
require("telescope").setup({
  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown({}) }
  },
  defaults = {
    preview = true,
    dynamic_preview_title = true,
    layout_strategy = "vertical",
    layout_config = {
      vertical = {
        preview_cutoff = 0
      }
    },
    sorting_strategy = "descending",
    borderchars = { border_style[2], border_style[4], border_style[6], border_style[8], border_style[1], border_style[3], border_style[5], border_style[7] },
    file_ignore_patterns = { "node_modules", ".git/" },
    mappings = {
      n = {
        ["<leader><leader>"] = require("telescope.actions").close
      }
    }
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<leader>x"] = require("telescope.actions").delete_buffer
        }
      }
    }
  }
})

vim.keymap.set({ "n", "t" }, "<leader>ff", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true, })
end, { desc = "Find file" })
vim.keymap.set({ "n", "t" }, "<leader>fgs", function()
  require("telescope.builtin").git_status()
end, { desc = "Git status" })
vim.keymap.set({ "n", "t" }, "<leader>fgb", function()
  require("telescope.builtin").git_branches()
end, { desc = "Git status" })
vim.keymap.set({ "n", "t" }, "<leader>fw", function()
  require("telescope").extensions.live_grep_args.live_grep_args()
end, { desc = "Find pattern with args" })
vim.keymap.set({ "n", "t" }, "<leader>fb", function()
  require("telescope.builtin").buffers()
end, { desc = "Find buffer" })
vim.keymap.set({ "n", "t" }, "<leader>fr", function()
  require("telescope.builtin").resume()
end, { desc = "Resume last picker" })
vim.keymap.set({ "n", "t" }, "<leader>fc", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true, cwd = "~/.config/nvim" })
end, { desc = "Find config files", silent = true })
