local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "neovim/nvim-lspconfig",
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "folke/lazydev.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
        },
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  completion = {
                    callSnippet = "Replace",
                  },
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    checkThirdParty = false,
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            })
          end,

          ["rust_analyzer"] = function()
            require("lspconfig").rust_analyzer.setup({
              capabilities = capabilities,
              settings = {
                ["rust-analyzer"] = {
                  cargo = {
                    allFeatures = true,
                  },
                  checkOnSave = {
                    command = "clippy",
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
