return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local bg = "#011628"
      local bg_dark = "#011423"
      local bg_highlight = "#143652"
      local bg_search = "#0A64AC"
      local bg_visual = "#275378"
      local fg = "#CBE0F0"
      local fg_dark = "#B4D0E9"
      local fg_gutter = "#627E97"
      local border = "#547998"

      require("tokyonight").setup({
        style = "night",
        transparent = true,
        terminal_colors = true,

        on_colors = function(colors)
          colors.bg = bg
          colors.bg_dark = bg_dark
          colors.bg_float = bg_dark
          colors.bg_highlight = bg_highlight
          colors.bg_popup = bg_dark
          colors.bg_search = bg_search
          colors.bg_sidebar = bg_dark
          colors.bg_statusline = bg_dark
          colors.bg_visual = bg_visual
          colors.border = border
          colors.fg = fg
          colors.fg_dark = fg_dark
          colors.fg_float = fg
          colors.fg_gutter = fg_gutter
          colors.fg_sidebar = fg_dark
        end,

        on_highlights = function(highlights, colors)
          highlights.Normal = { bg = "NONE" }
          highlights.NormalNC = { bg = "NONE" }
          highlights.NormalFloat = { bg = "NONE" }
          highlights.FloatBorder = { bg = "NONE", fg = colors.border }
          highlights.SignColumn = { bg = "NONE" }
          highlights.EndOfBuffer = { bg = "NONE" }
          highlights.StatusLine = { bg = "NONE" }
          highlights.StatusLineNC = { bg = "NONE" }
          highlights.TabLine = { bg = "NONE" }
          highlights.TabLineFill = { bg = "NONE" }
          highlights.WinSeparator = { bg = "NONE", fg = colors.border }
          highlights.Pmenu = { bg = colors.bg_dark, fg = colors.fg }
          highlights.PmenuSel = { bg = colors.bg_highlight, fg = colors.fg }
          highlights.TelescopeNormal = { bg = "NONE" }
          highlights.TelescopeBorder = { bg = "NONE", fg = colors.border }
          highlights.TelescopePromptNormal = { bg = "NONE" }
          highlights.TelescopePromptBorder = { bg = "NONE", fg = colors.border }
          highlights.TelescopeResultsNormal = { bg = "NONE" }
          highlights.TelescopeResultsBorder = { bg = "NONE", fg = colors.border }
          highlights.TelescopePreviewNormal = { bg = "NONE" }
          highlights.TelescopePreviewBorder = { bg = "NONE", fg = colors.border }
          highlights.NvimTreeNormal = { bg = "NONE" }
          highlights.NvimTreeNormalNC = { bg = "NONE" }
          highlights.NvimTreeEndOfBuffer = { bg = "NONE" }
          highlights.NvimTreeWinSeparator = { bg = "NONE", fg = colors.border }
          highlights.NvimTreeRootFolder = { fg = colors.fg }
        end,
      })

      vim.cmd("colorscheme tokyonight")

      vim.opt.termguicolors = true
      vim.opt.winblend = 10
      vim.opt.pumblend = 10

      vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE" })
      vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })
    end,
  },
}
