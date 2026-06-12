local vim = vim

vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/igorlfs/nvim-dap-view",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-telescope/telescope-dap.nvim",
  "https://github.com/rcarriga/nvim-notify",
  "https://github.com/nvim-tree/nvim-tree.lua",
  "https://github.com/igorlfs/nvim-dap-view"
}, { confirm = vim.g.vim_pack_add_confirm })

local js_debugger = { "pwa-chrome", "pwa-node" }
local build_title = function(title, icon)
  return function(width)
    if width <= 118 then
      return icon
    end

    return title
  end
end

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "", linehl = "", numhl = "" })

for _, debugger in ipairs(js_debugger) do
  require("dap").adapters[debugger] = function(cb)
    local adap = {
      type = "server",
      host = "localhost",
      port = "${port}",
      protocol = "inspector",
      executable = {
        command = "js-debug-adapter",
        args = { "${port}" },
      }
    }

    cb(adap)
  end
end

require("dap").adapters.firefox = function(cb, config)
  if config.preLaunchTask then
    vim.fn.system(config.preLaunchTask)
  end

  cb({
    type = "executable",
    command = "firefox-debug-adapter",
  })
end
require("dap").listeners.before.attach.dapui_config = function()
  vim.notify("Debugger attatched", "info")
end
require("dap").listeners.before.launch.dapui_config = function()
  vim.notify("Debugger launched", "info")
end
require("dap").listeners.before.event_exited.dapui_config = function()
  vim.notify("Debugger exited", "info")
end

require("dap-view").setup({
  winbar = {
    default_section = "repl",
    sections = { "watches", "scopes", "exceptions", "breakpoints", "threads", "repl", "console" },
    controls = { enabled = true },
    base_sections = {
      breakpoints = { label = build_title("Breakpoints", ""), keymap = "B" },
      scopes = { label = build_title("Scopes", "󰭳"), keymap = "S" },
      exceptions = { label = build_title("Exceptions", "󱈸"), keymap = "E" },
      watches = { label = build_title("Watches", "󰈈"), keymap = "W" },
      threads = { label = build_title("Threads", ""), keymap = "T" },
      repl = { label = build_title("REPL", ""), keymap = "R" },
      sessions = { label = build_title("Sessions", "󰭳"), keymap = "K" },
      console = { label = build_title("Console", ""), keymap = "C" },
    },
  }
})

vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "Debugger toggle breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  require("dap").terminate({
    on_done = function()
      vim.notify("Debugger terminated", "info")
    end
  })
end, { desc = "Debugger terminate" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "Debugger continue" })
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover(nil, { border = vim.g.border_style })
end, { desc = "Debugger add expression" })
vim.keymap.set("n", "<leader>du", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>db", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>de", function()
  require("dap").terminate({}, {}, {
    on_done = function()
      vim.notify("Debugger terminated", "info")
    end,
  })
end, { desc = "DAP: Terminate" })
vim.keymap.set("n", "<leader>dr", function()
  require("dap").continue()
end, { desc = "DAP: Continue/Start" })
vim.keymap.set({ "n", "v" }, "<leader>dh", function()
  require("dap.ui.widgets").hover(nil, { border = vim.g.border_style or "rounded" })
end, { desc = "DAP: Hover Expression" })
vim.keymap.set({ "n" }, "<leader>du", function()
  require("dap-view").toggle()
end, { desc = "Debugger toggle ui" })
vim.keymap.set({ "n", "v" }, "<leader>dw", function()
  require("dap-view").add_expr()
end, { desc = "Debugger add expression" })
