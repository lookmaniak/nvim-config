-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
return {
  -- JavaScript / TypeScript support
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- JSON support
  { import = "lazyvim.plugins.extras.lang.json" },

  -- Tailwind CSS support
  { import = "lazyvim.plugins.extras.lang.tailwind" },

  -- Copilot AI coding assistance (optional)
  { import = "lazyvim.plugins.extras.coding.copilot" },

  -- Linting + Formatting for JS/TS (eslint + prettier)
  { import = "lazyvim.plugins.extras.linting.eslint" },
  { import = "lazyvim.plugins.extras.formatting.prettier" },

  -- PHP LSP (Intelephense)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {}, -- PHP
        tsserver = {}, -- JS/TS
        html = {}, -- HTML
        cssls = {}, -- CSS/SCSS/Less
        tailwindcss = {}, -- Tailwind CSS
      },
      setup = {
        intelephense = function()
          require("lspconfig").intelephense.setup({
            settings = {
              intelephense = {
                files = { maxSize = 5000000 },
              },
            },
          })
        end,
      },
    },
  },

  -- null-ls for PHP formatting + linting via phpcsfixer and phpcs
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = opts.sources or {}
      vim.list_extend(opts.sources, {
        null_ls.builtins.formatting.phpcsfixer,
        null_ls.builtins.diagnostics.phpcs,
        null_ls.builtins.formatting.prettier, -- For formatting other filetypes too
      })
    end,
  },
}
