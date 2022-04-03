-- LSP Symbols in gutter
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Diagnostic Popup
vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  underline = true,
  update_in_insert = true,
  severity_sort = false,
})

-- Changing prefix of line diagnostic to a lion 🦁
vim.diagnostic.config({
  virtual_text = {
    prefix = '🦁', -- Could be '●', '▎', 'x'
  }
})

-- vim.cmd [[autocmd! CursorHold * Lspsaga hover_doc]]
vim.cmd [[autocmd! CursorHold,CursorHoldI * Lspsaga show_cursor_diagnostics]]
vim.o.updatetime = 500

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end
