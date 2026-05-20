local vim = vim

local M = {
  colors = {
    black_00  = "#000000",
    black_01  = "#0f0f0f",
    black_02  = "#262626",
    red_00    = "#660708",
    red_01    = "#a4161a",
    red_02    = "#ba181b",
    gray_00   = "#495057",
    gray_01   = "#6c757d",
    gray_02   = "#adb5bd",
    yellow_00 = "#c36f09",
    yellow_01 = "#eeba0b",
    yellow_02 = "#f4e409",
    blue_00   = "#023e8a",
    blue_01   = "#0077b6",
    blue_02   = "#0096c7",
    green_00  = "#006400",
    green_01  = "#007200",
    green_02  = "#008000"
  }
}

M.patterns = {}
M.patterns.normal = { bg = M.colors.black_00, fg = M.colors.gray_01 }
M.patterns.alt_normal = { bg = M.colors.black_01, fg = M.colors.gray_02 }
M.patterns.alt_border = { bg = M.patterns.alt_normal.bg, fg = M.patterns.normal.bg }
M.patterns.window_status_active = { bg = M.colors.black_01, fg = M.colors.gray_01, bold = true }
M.patterns.window_status_inactive = { bg = M.colors.black_01, fg = M.colors.gray_00 }
M.patterns.ok = { bg = M.colors.green_00, fg = M.colors.green_02 }
M.patterns.error = { bg = M.colors.red_00, fg = M.colors.red_02 }
M.patterns.warning = { bg = M.colors.yellow_00, fg = M.colors.yellow_02 }
M.patterns.info = { bg = M.colors.blue_00, fg = M.colors.blue_02 }

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

M.setup = function()
  vim.g.colors_name = "knot"
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  -- NEOVIM BASE
  hl("Normal", M.patterns.normal)
  hl("Comment", vim.tbl_extend('force', M.patterns.normal, { fg = M.colors.gray_00 }))
  hl("StatusLine", M.patterns.window_status_active)
  hl("DiagnosticInfo", vim.tbl_extend('force', M.patterns.info, { bg = 'NONE' }))
  hl("DiagnosticWarn", vim.tbl_extend('force', M.patterns.warning, { bg = 'NONE' }))
  hl("DiagnosticError", vim.tbl_extend('force', M.patterns.error, { bg = 'NONE' }))
  hl("DiagnosticHint", vim.tbl_extend('force', M.patterns.info, { bg = 'NONE' }))
  hl("Added", vim.tbl_extend('force', M.patterns.ok, { bg = 'NONE' }))
  hl("Removed", vim.tbl_extend('force', M.patterns.error, { bg = 'NONE' }))
  hl("Changed", vim.tbl_extend('force', M.patterns.info, { bg = 'NONE' }))
  hl("Search", vim.tbl_extend('force', M.patterns.warning, { bg = 'NONE' }))
  hl("Delimiter", { fg = M.colors.gray_02 })
  hl("Keyword", { fg = M.colors.red_02 })

  -- WINDOW CONTENT
  hl("CursorLine", { bg = M.patterns.normal.bg })
  hl("EndOfBuffer", { bg = M.patterns.normal.bg, fg = M.patterns.normal.bg })
  hl("NormalFloat", M.patterns.alt_normal)
  hl("Visual", { bg = M.colors.black_01 })
  hl("CursorLineNr", { link = "Keyword" })
  hl("Directory", { link = "Normal" })

  -- SYNTAX
  hl("String", { link = "Keyword" })
  hl("Function", { link = "Keyword" })
  hl("Statement", { link = "Keyword" })
  hl("Special", { link = "Delimiter" })
  hl("Type", { link = "Keyword" })
  hl("Identifier", { link = "Delimiter" })
  hl("Number", { link = "Delimiter" })
  hl("Boolean", { link = "Delimiter" })

  -- DIFF AND GIT
  hl("DiffAdd", { link = "Added" })
  hl("DiffDelete", { link = "Removed" })
  hl("DiffChange", { link = "Changed" })
  hl("GitSignsAdd", { link = "Added" })
  hl("GitSignsDelete", { link = "Removed" })
  hl("GitSignsChange", { link = "Changed" })

  -- Sinais de Diagnóstico
  hl("DiagnosticSignInfo", { link = "DiagnosticInfo" })
  hl("DiagnosticSignWarn", { link = "DiagnosticWarn" })
  hl("DiagnosticSignError", { link = "DiagnosticError" })
  hl("DiagnosticSignHint", { link = "DiagnosticHint" })

  -- Texto Virtual de Diagnóstico
  hl("DiagnosticVirtualTextInfo", M.patterns.info)
  hl("DiagnosticVirtualTextWarn", M.patterns.warning)
  hl("DiagnosticVirtualTextError", M.patterns.error)
  hl("DiagnosticVirtualTextHint", M.patterns.info)

  -- DIAGNOSTICS
  hl("DiagnosticUnderlineInfo", { sp = M.patterns.info.fg, undercurl = true })
  hl("DiagnosticUnderlineWarn", { sp = M.patterns.warning.fg, undercurl = true })
  hl("DiagnosticUnderlineError", { sp = M.patterns.error.fg, undercurl = true })
  hl("DiagnosticUnderlineHint", { sp = M.patterns.info.fg, undercurl = true })
  hl("ErrorMsg", { link = "DiagnosticError" })
  hl("WarningMsg", { link = "DiagnosticWarn" })
  hl("htmlTagName", { link = "Delimiter" })
  hl("typescriptParens", { link = "Delimiter" })

  -- TREESITTER
  hl("@variable", { fg = M.colors.gray_02 })
  hl("@keyword", { link = "Keyword" })
  hl("@string", { link = "Keyword" })
  hl("@variable.parameter", { link = "Delimiter" })
  hl("@function", { link = "Keyword" })
  hl("@function.method", { link = "Keyword" })
  hl("@function.builtin", { link = "Keyword" })
  hl("@method", { link = "Keyword" })
  hl("@number", { link = "Delimiter" })
  hl("@boolean", { link = "Delimiter" })
  hl("@lsp.type.property", { fg = M.colors.gray_02 })
  hl("@markup.raw.block.markdown", { bold = true })

  -- WINDOW DECORATION
  hl("StatusLineNC", M.patterns.window_status_inactive)
  hl("FloatBorder", M.patterns.alt_border)
  hl("WinSeparator", { bg = M.patterns.normal.bg, fg = M.patterns.normal.bg })
  hl("WinBarActive", M.patterns.window_status_active)
  hl("WinBarInactive", M.patterns.window_status_inactive)
  hl("WinBar", { link = "WinBarActive" })
  hl("WinBarNC", { link = "WinBarInactive" })

  -- TELESCOPE
  hl("TelescopeNormal", { link = "NormalFloat" })
  hl("TelescopeBorder", { link = "FloatBorder" })
  hl("TelescopeTitle", { bg = M.colors.red_01, fg = M.colors.black_00 })

  -- NVIMTREE
  M.patterns.nvimtree_normal = M.patterns.normal

  hl("NvimTreeNormal", M.patterns.nvimtree_normal)
  hl("NvimTreeEndOfBuffer", { bg = M.patterns.nvimtree_normal.bg, fg = M.patterns.nvimtree_normal.bg })

  -- BUFFERLINE
  M.patterns.bufferline_hidden = M.patterns.normal

  hl("BufferLineOffsetSeparator", { link = "WinSeparator" })
  hl("BufferLineBackground", M.patterns.bufferline_hidden)
  hl("BufferLinePick", vim.tbl_extend("force", M.patterns.bufferline_hidden, { fg = M.colors.red_02, bold = true }))
  hl("BufferLineHint", { bg = M.patterns.bufferline_hidden.bg, fg = M.colors.blue_02 })
  hl("BufferLineError", { bg = M.patterns.bufferline_hidden.bg, fg = M.colors.red_02 })
  hl("BufferLineWarning", { bg = M.patterns.bufferline_hidden.bg, fg = M.colors.yellow_02 })
  hl("BufferLineInfo", { bg = M.patterns.bufferline_hidden.bg, fg = M.colors.blue_02 })
  hl("BufferLineDuplicate", { link = "BufferLineBackground" })
  hl("BufferLineFill", { link = "BufferLineBackground" })
  hl("BufferLineModified", { link = "BufferLineBackground" })
  hl("BufferLineCloseButton", { link = "BufferLineBackground" })
  hl("BufferLineDevIconDefault", { link = "BufferLineBackground" })
  hl("BufferLineDevIconDefaultInactive", { link = "BufferLineBufferSelected" })

  M.patterns.bufferline_visible = M.patterns.normal

  hl("BufferLineBufferVisible", M.patterns.bufferline_visible)
  hl("BufferLinePickVisible", { bg = M.patterns.bufferline_visible.bg, fg = M.colors.red_02 })
  hl("BufferLineHintVisible", { bg = M.patterns.bufferline_visible.bg, fg = M.colors.blue_02 })
  hl("BufferLineErrorVisible", { bg = M.patterns.bufferline_visible.bg, fg = M.colors.red_02 })
  hl("BufferLineWarningVisible", { bg = M.patterns.bufferline_visible.bg, fg = M.colors.yellow_02 })
  hl("BufferLineInfoVisible", { bg = M.patterns.bufferline_visible.bg, fg = M.colors.blue_02 })
  hl("BufferLineDuplicateVisible", { link = "BufferLineBufferVisible" })
  hl("BufferLineIndicatorVisible", { link = "BufferLineBufferVisible" })
  hl("BufferLineCloseButtonVisible", { link = "BufferLineBufferVisible" })
  hl("BufferLineModifiedVisible", { link = "BufferLineBufferVisible" })
  hl("BufferLineDevIconDefaultVisible", { link = "BufferLineBufferVisible" })

  M.patterns.bufferline_selected = M.patterns.window_status_active

  hl("BufferLineBufferSelected", M.patterns.bufferline_selected)
  hl("BufferLinePickSelected", vim.tbl_extend("force", M.patterns.bufferline_selected, { fg = M.colors.red_02 }))
  hl("BufferLineHintSelected", vim.tbl_extend("force", M.patterns.bufferline_selected, { fg = M.colors.blue_02 }))
  hl("BufferLineErrorSelected", vim.tbl_extend("force", M.patterns.bufferline_selected, { fg = M.colors.red_02 }))
  hl("BufferLineWarningSelected", vim.tbl_extend("force", M.patterns.bufferline_selected, { fg = M.colors.yellow_02 }))
  hl("BufferLineInfoSelected", vim.tbl_extend("force", M.patterns.bufferline_selected, { fg = M.colors.blue_02 }))
  hl("BufferLineDuplicateSelected", { link = "BufferLineBufferSelected" })
  hl("BufferLineModifiedSelected", { link = "BufferLineBufferSelected" })
  hl("BufferLineIndicatorSelected", { link = "BufferLineBufferSelected" })
  hl("BufferLineCloseButtonSelected", { link = "BufferLineBufferSelected" })
  hl("BufferLineDevIconDefaultSelected", { link = "BufferLineBufferSelected" })

  -- DAP VIEW
  M.patterns.dapview_visible = M.patterns.window_status_active
  M.patterns.dapview_hidden = M.patterns.normal

  hl("NvimDapViewControlPause", { bg = M.patterns.dapview_hidden.bg, fg = M.colors.red_02 })
  hl("NvimDapViewTab", M.patterns.dapview_hidden)
  hl("NvimDapViewTabSelected", M.patterns.dapview_visible)
  hl("NvimDapViewTabFill", { link = "NvimDapViewTab" })
  hl("NvimDapViewControlNC", { link = "NvimDapViewTabFill" })
  hl("NvimDapViewControlPlay", { link = "NvimDapViewControlPause" })
  hl("NvimDapViewControlRunLast", { link = "NvimDapViewControlPause" })

  -- MARKVIEW
  hl("MarkViewCode", { bg = M.colors.black_01 })
  for i = 1, 5 do
    hl("MarkviewHeading" .. i, { bg = M.colors.black_00, fg = M.colors.red_02 })
  end

  -- EDGY
  hl("EdgyWinBar", { link = "WinBar" })
  hl("EdgyWinBarNC", { link = "WinBarNC" })
  hl("EdgyNormal", { link = "NvimTreeNormal" })
end

M.lualine = function()
  M.patterns.lualine_normal = M.patterns.normal
  M.patterns.lualine_inactive = M.patterns.window_status_inactive
  M.patterns.lualine_insert = { bg = M.patterns.lualine_normal.bg, fg = M.patterns.error.fg }
  M.patterns.lualine_visual = { bg = M.patterns.lualine_normal.bg, fg = M.patterns.warning.fg }
  M.patterns.lualine_command = { bg = M.patterns.lualine_normal.bg, fg = M.patterns.info.fg }
  M.patterns.lualine_diff_add = { bg = M.patterns.lualine_normal.bg, fg = M.patterns.ok.fg }

  return {
    normal = {
      a = M.patterns.lualine_normal,
      b = M.patterns.lualine_normal,
      c = M.patterns.lualine_normal,
    },
    insert = {
      a = M.patterns.lualine_insert,
      b = M.patterns.lualine_insert,
      c = M.patterns.lualine_insert,
    },
    visual = {
      a = M.patterns.lualine_visual,
      b = M.patterns.lualine_visual,
      c = M.patterns.lualine_visual,
    },
    replace = {
      a = M.patterns.lualine_visual,
      b = M.patterns.lualine_visual,
      c = M.patterns.lualine_visual,
    },
    command = {
      a = M.patterns.lualine_command,
      b = M.patterns.lualine_command,
      c = M.patterns.lualine_command,
    },
    inactive = {
      a = M.patterns.lualine_inactive,
      b = M.patterns.lualine_inactive,
      c = M.patterns.lualine_inactive,
    }
  }
end

return M
