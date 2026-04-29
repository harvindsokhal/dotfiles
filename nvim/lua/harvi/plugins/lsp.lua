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
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"ts_ls",
					"html",
					"cssls",
					"tailwindcss",
					"svelte",
					"graphql",
					"emmet_ls",
					"prismals",
					"pyright",
					"gopls",
					"clangd",
					"dockerls",
					"docker_compose_language_service",
					"yamlls",
					"bashls",
					"angularls",
					"vue_ls",
					"bashls",
					"intelephense",
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					-- formatters
					"prettier",
					"stylua",
					"black",
					"isort",
					"gofumpt",
					"goimports",
					"clang-format",
					"shfmt",
					"phpcs",
					"phpcbf",
					"phpstan",

					-- linters
					"eslint_d",
					"pylint",
					"golangci-lint",
					"shellcheck",
					"hadolint",
				},
			})
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local keymap = vim.keymap

			-- keymaps on attach
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }

					keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
					keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
					keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
					keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

					keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

					keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
					keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

					keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

					keymap.set("n", "K", vim.lsp.buf.hover, opts)
					keymap.set("n", "<leader>rs", "<cmd>LspRestart<CR>", opts)
				end,
			})

			-- diagnostic signs
			local signs = {
				Error = " ",
				Warn = " ",
				Hint = "󰠠 ",
				Info = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- =========================
			-- LSP CONFIGS (NEW API)
			-- =========================

			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			vim.lsp.config("rust_analyzer", {
				capabilities = capabilities,
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
					},
				},
			})

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
				filetypes = {
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
				},
			})

			vim.lsp.config("cssls", {
				capabilities = capabilities,
				filetypes = { "css", "scss", "less" },
			})

			vim.lsp.config("tailwindcss", {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"svelte",
					"vue",
				},
			})

			vim.lsp.config("graphql", {
				capabilities = capabilities,
				filetypes = {
					"graphql",
					"gql",
					"svelte",
					"typescriptreact",
					"javascriptreact",
				},
			})

			vim.lsp.config("emmet_ls", {
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"scss",
					"sass",
					"less",
					"javascriptreact",
					"typescriptreact",
					"svelte",
					"vue",
				},
			})

			vim.lsp.config("yamlls", {
				capabilities = capabilities,
				settings = {
					yaml = {
						keyOrdering = false,
					},
				},
			})

			vim.lsp.config("bashls", {
				capabilities = capabilities,
				filetypes = { "sh", "bash", "zsh" },
			})

			vim.lsp.config("intelephense", {
				capabilities = capabilities,
				settings = {
					intelephense = {
						stubs = {
							"apache",
							"bcmath",
							"bz2",
							"calendar",
							"com_dotnet",
							"Core",
							"ctype",
							"curl",
							"date",
							"dba",
							"dom",
							"enchant",
							"exif",
							"FFI",
							"fileinfo",
							"filter",
							"fpm",
							"ftp",
							"gd",
							"gettext",
							"hash",
							"iconv",
							"imap",
							"intl",
							"json",
							"ldap",
							"libxml",
							"mbstring",
							"meta",
							"mysqli",
							"oci8",
							"odbc",
							"openssl",
							"pcntl",
							"pcre",
							"PDO",
							"pdo_ibm",
							"pdo_mysql",
							"pdo_pgsql",
							"pdo_sqlite",
							"pgsql",
							"Phar",
							"posix",
							"pspell",
							"readline",
							"Reflection",
							"session",
							"shmop",
							"SimpleXML",
							"snmp",
							"soap",
							"sockets",
							"sodium",
							"SPL",
							"sqlite3",
							"standard",
							"superglobals",
							"sysvmsg",
							"sysvsem",
							"sysvshm",
							"tidy",
							"tokenizer",
							"wordpress",
							"xml",
							"xmlreader",
							"xmlrpc",
							"xmlwriter",
							"xsl",
							"Zend OPcache",
							"zip",
							"zlib",
						},
						environment = {
							includePaths = {
								"wp-content/plugins/woocommerce",
							},
						},
						files = {
							maxSize = 5000000,
						},
					},
				},
			})

			-- =========================
			-- ENABLE SERVERS
			-- =========================

			local servers = {
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"svelte",
				"graphql",
				"emmet_ls",
				"prismals",
				"pyright",
				"gopls",
				"clangd",
				"csharp_ls",
				"dockerls",
				"docker_compose_language_service",
				"yamlls",
				"bashls",
				"angularls",
				"vue_ls",
				"intelephense",
			}

			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end
		end,
	},
}
