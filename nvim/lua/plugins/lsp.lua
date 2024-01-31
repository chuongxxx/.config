return {
  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      table.insert(opts.ensure_installed, "js-debug-adapter")
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufNewFile", "BufReadPre", "BufReadPost" },
    opts = {
      servers = {
        tsserver = {
          init_options = {
            hostInfo = "neovim",
            preferences = {
              includeCompletionsForModuleExports = true,
              includeCompletionsForImportStatements = true,
              importModuleSpecifierPreference = "relative",
            },
          },
        },
      },
    },
  },
}
