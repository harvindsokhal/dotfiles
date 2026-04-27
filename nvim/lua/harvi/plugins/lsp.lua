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
      local lspconfig = require("lspconfig")

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "pyright",
        },
        handlers = {
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
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
            lspconfig.rust_analyzer.setup({
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

          ["ts_ls"] = function()
            lspconfig.ts_ls.setup({
              capabilities = capabilities,
              filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
              },
            })
          end,

          ["cssls"] = function()
            lspconfig.cssls.setup({
              capabilities = capabilities,
              filetypes = {
                "css",
                "scss",
                "less",
              },
            })
          end,

          ["tailwindcss"] = function()
            lspconfig.tailwindcss.setup({
              capabilities = capabilities,
              filetypes = {
                "html",
                "css",
                "scss",
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
              },
            })
          end,

          ["pyright"] = function()
            lspconfig.pyright.setup({
              capabilities = capabilities,
            })
          end,
        },
      })
    end,
  },
}
