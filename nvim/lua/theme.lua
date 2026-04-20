local vim = vim

vim.g.colors_name = "knot"

local colors = {
  black_00  = "#000000",
  black_01  = "#1B1B1B",
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

local patterns = {}
patterns.normal = { bg = colors.black_00, fg = colors.gray_01 }
patterns.float_normal = { bg = colors.black_01, fg = colors.gray_02 }
patterns.float_border = vim.tbl_extend('force', patterns.float_normal, { fg = patterns.normal.bg })
patterns.ok = { bg = colors.green_00, fg = colors.green_02 }
patterns.error = { bg = colors.red_00, fg = colors.red_02 }
patterns.warning = { bg = colors.yellow_00, fg = colors.yellow_02 }
patterns.info = { bg = colors.blue_00, fg = colors.blue_02 }

vim.cmd("highlight clear")

if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- NEOVIM BASE
hl("Normal", patterns.normal)
hl("Comment", vim.tbl_extend('force', patterns.normal, { fg = colors.gray_00 }))
hl("Delimiter", { fg = colors.gray_02 })
hl("Keyword", { fg = colors.red_02 })
-- hl("StatusLine", { bg = colors.black_02, fg = colors.gray_03 })
hl("DiagnosticInfo", vim.tbl_extend('force', patterns.info, { bg = 'NONE' }))
hl("DiagnosticWarn", vim.tbl_extend('force', patterns.warning, { bg = 'NONE' }))
hl("DiagnosticError", vim.tbl_extend('force', patterns.error, { bg = 'NONE' }))
hl("DiagnosticHint", vim.tbl_extend('force', patterns.info, { bg = 'NONE' }))
hl("Added", vim.tbl_extend('force', patterns.ok, { bg = 'NONE' }))
hl("Removed", vim.tbl_extend('force', patterns.error, { bg = 'NONE' }))
hl("Changed", vim.tbl_extend('force', patterns.info, { bg = 'NONE' }))
hl("Search", vim.tbl_extend('force', patterns.warning, { bg = 'NONE' }))

-- WINDOW CONTENT
hl("Visual", { link = "CursorLine" })
hl("CursorLine", { bg = colors.black_01 })
hl("CursorLineNr", { link = "Keyword" })
-- hl("EndOfBuffer", { fg = colors.black_00, bg = colors.black_00 })
-- hl("Directory", { link = "Normal" })
hl("NormalFloat", patterns.float_normal)

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
-- hl("DiagnosticSignInfo", { link = "DiagnosticInfo" })
-- hl("DiagnosticSignWarn", { link = "DiagnosticWarn" })
-- hl("DiagnosticSignError", { link = "DiagnosticError" })
-- hl("DiagnosticSignHint", { link = "DiagnosticHint" })

-- Texto Virtual de Diagnóstico
hl("DiagnosticVirtualTextInfo", patterns.info)
hl("DiagnosticVirtualTextWarn", patterns.warning)
hl("DiagnosticVirtualTextError", patterns.error)
hl("DiagnosticVirtualTextHint", patterns.info)

-- DIAGNOSTICS
-- hl("DiagnosticUnderlineInfo", { sp = colors.blue_02, undercurl = true })
-- hl("DiagnosticUnderlineWarn", { sp = colors.yellow_02, undercurl = true })
-- hl("DiagnosticUnderlineError", { sp = colors.red_02, undercurl = true })
-- hl("DiagnosticUnderlineHint", { sp = colors.blue_02, undercurl = true })
-- hl("ErrorMsg", { link = "DiagnosticError" })
-- hl("WarningMsg", { link = "DiagnosticWarn" })
hl("htmlTagName", { link = "Delimiter" })
hl("typescriptParens", { link = "Delimiter" })

-- TREESITTER
hl("@keyword", { link = "Keyword" })
hl("@string", { link = "Keyword" })
hl("@variable.parameter", { link = "Delimiter" })
hl("@function", { link = "Keyword" })
hl("@function.method", { link = "Keyword" })
hl("@function.builtin", { link = "Keyword" })
hl("@method", { link = "Keyword" })
-- hl("@variable", { fg = colors.gray_03 })
hl("@number", { link = "Delimiter" })
hl("@boolean", { link = "Delimiter" })
-- hl("@lsp.type.property", { fg = colors.gray_03 })
hl("@markup.raw.block.markdown", { bold = true })

-- WINDOW DECORATION
-- hl("StatusLineNC", { fg = "#555555", bg = colors.black_02 }) -- gray_li16.da(50)
-- hl("WinSeparator", { bg = colors.black_00, fg = colors.black_02 })
hl("FloatBorder", patterns.float_border)
-- hl("WinBar", { bg = colors.black_03 })
-- hl("WinBarNC", { link = "WinBar" })
-- hl("WinBarActive", { bg = colors.black_03 })
-- hl("WinBarInactive", { bg = colors.black_02 })

-- TELESCOPE
hl("TelescopeNormal", { link = "NormalFloat" })
hl("TelescopeBorder", { link = "FloatBorder" })
hl("TelescopeTitle", { bg = colors.red_01, fg = colors.black_00 })

-- NVIMTREE
-- hl("NvimTreeNormal", { bg = colors.black_00, fg = colors.gray_03 })
-- hl("NvimTreeEndOfBuffer", { fg = colors.black_00, bg = colors.black_00 })
-- hl("NvimTreeCursorLine", { bg = colors.black_00 })

-- BUFFERLINE: BASE & INACTIVE
-- hl("BufferLineOffsetSeparator", { link = "WinSeparator" })
-- hl("BufferLineBackground", { bg = colors.black_02 })
-- hl("BufferLineDuplicate", { link = "BufferLineBackground" })
-- hl("BufferLineFill", { link = "BufferLineBackground" })
-- hl("BufferLineModified", { link = "BufferLineBackground" })
-- hl("BufferLineCloseButton", { link = "BufferLineBackground" })
-- hl("BufferLinePick", { bg = colors.black_02, fg = colors.red_01 })
-- hl("BufferLineHint", { fg = colors.blue_01, bg = colors.black_02 })
-- hl("BufferLineError", { fg = colors.red_01, bg = colors.black_02 })
-- hl("BufferLineWarning", { fg = colors.yellow_01, bg = colors.black_02 })
-- hl("BufferLineInfo", { fg = colors.blue_01, bg = colors.black_02 })
-- hl("BufferLineDevIconDefault", { link = "BufferLineBackground" })
-- hl("BufferLineDevIconDefaultInactive", { link = "BufferLineBufferSelected" })

-- BUFFERLINE: VISIBLE
-- hl("BufferLineBufferVisible", { bg = visible_bg, fg = colors.gray_01 })
-- hl("BufferLineDuplicateVisible", { link = "BufferLineBufferVisible" })
-- hl("BufferLineIndicatorVisible", { link = "BufferLineBufferVisible" })
-- hl("BufferLineCloseButtonVisible", { link = "BufferLineBufferVisible" })
-- hl("BufferLineModifiedVisible", { link = "BufferLineBufferVisible" })
-- hl("BufferLineDevIconDefaultVisible", { bg = visible_bg })
-- hl("BufferLineHintVisible", { fg = colors.blue_01, bg = visible_bg })
-- hl("BufferLineErrorVisible", { fg = colors.red_01, bg = visible_bg })
-- hl("BufferLineWarningVisible", { fg = colors.yellow_01, bg = visible_bg })
-- hl("BufferLineInfoVisible", { fg = colors.blue_01, bg = visible_bg })

-- BUFFERLINE: SELECTED
-- hl("BufferLineBufferSelected", { bg = selected_bg, fg = colors.gray_03, bold = true })
-- hl("BufferLineDuplicateSelected", { link = "BufferLineBufferSelected" })
-- hl("BufferLineModifiedSelected", { link = "BufferLineBufferSelected" })
-- hl("BufferLineIndicatorSelected", { link = "BufferLineBufferSelected" })
-- hl("BufferLineCloseButtonSelected", { link = "BufferLineBufferSelected" })
-- hl("BufferLineDevIconDefaultSelected", { link = "BufferLineBufferSelected" })
-- hl("BufferLinePickSelected", { bg = selected_bg, fg = colors.red_01 })
-- hl("BufferLineHintSelected", { bg = selected_bg, fg = colors.blue_01 })
-- hl("BufferLineErrorSelected", { bg = selected_bg, fg = colors.red_01 })
-- hl("BufferLineWarningSelected", { bg = selected_bg, fg = colors.yellow_01 })
-- hl("BufferLineInfoSelected", { bg = selected_bg, fg = colors.blue_01 })

-- DAP VIEW
-- hl("NvimDapViewTab", { link = "BufferLineBackground" })
-- hl("NvimDapViewTabSelected", { link = "BufferLineBufferSelected" })
-- hl("NvimDapViewTabFill", { link = "NvimDapViewTab" })
-- hl("NvimDapViewControlNC", { link = "NvimDapViewTabFill" })
-- hl("NvimDapViewControlPause", { fg = colors.red_01, bg = colors.black_02 })
-- hl("NvimDapViewControlPlay", { link = "NvimDapViewControlPause" })
-- hl("NvimDapViewControlRunLast", { link = "NvimDapViewControlPause" })

-- MARKVIEW
-- hl("MarkViewCode", { bg = colors.black_01 })
-- for i = 1, 5 do
--   hl("MarkviewHeading" .. i, { bg = colors.black_00, fg = colors.red_01 })
-- end

-- EDGY
-- hl("EdgyWinBar", { link = "WinBar" })
-- hl("EdgyWinBarNC", { link = "WinBarNC" })
-- hl("EdgyNormal", { link = "NvimTreeNormal" })
