return {
  -- Configure Prettier options
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        yaml = { "prettier" },
        yml = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = function(_, ctx)
            -- Force 2 spaces for YAML files
            if vim.tbl_contains({ "yaml", "yml" }, vim.bo[ctx.buf].filetype) then
              return { "--tab-width", "2" }
            end
            return {}
          end,
        },
      },
      -- NOTE: LazyVim handles format-on-save via vim.g.autoformat
      -- Do NOT set format_on_save here as it conflicts with LazyVim's formatting system
    },
  },
}