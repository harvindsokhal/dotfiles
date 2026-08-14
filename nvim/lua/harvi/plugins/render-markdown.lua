return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },

	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},

	opts = {
		render_modes = true,

		heading = {
			enabled = true,
			sign = true,
			icons = { "󰎤 ", "󰎧 ", "󰎪 ", "󰎭 ", "󰎱 ", "󰎳 " },
		},

		code = {
			enabled = true,
			sign = false,
			width = "block",
			right_pad = 1,
		},

		checkbox = {
			enabled = true,
		},

		pipe_table = {
			enabled = true,
		},

		bullet = {
			enabled = true,
		},
	},

	keys = {
		{
			"<leader>mr",
			"<cmd>RenderMarkdown toggle<cr>",
			desc = "Toggle Markdown rendering",
		},
	},
}
