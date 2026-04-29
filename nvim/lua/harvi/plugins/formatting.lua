return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				vue = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				scss = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				prisma = { "prettier" },

				lua = { "stylua" },
				python = { "isort", "black" },
				go = { "goimports", "gofumpt" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				cs = { "csharpier" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				zsh = { "shfmt" },
				php = { "phpcbf" },
			},

			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_format = "fallback",
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range" })
	end,
}
