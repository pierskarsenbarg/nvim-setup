local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    go = { "gofmt" },
    markdown = { "prettier" },
    typescript = { "prettier" },
    javascript = { "prettier" },
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
  formatters = {
    prettier = {
      prepend_args = function()
        return { "--tab-width", "4", "--print-width", 120 }
      end,
    },
  },
}

return options
