return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    local lazy_status = require("lazy.status")

    local colors = {
      blue = "#65D1FF",
      green = "#3EFFDC",
      violet = "#FF61EF",
      yellow = "#FFDA7B",
      red = "#FF4A4A",
      fg = "#CBE0F0",
      fg_dark = "#B4D0E9",
      inactive_fg = "#627E97",
      transparent = "NONE",
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = "#011628", gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = "#011628", gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = "#011628", gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = "#011628", gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = "#011628", gui = "bold" },
        b = { bg = colors.transparent, fg = colors.fg },
        c = { bg = colors.transparent, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.transparent, fg = colors.inactive_fg, gui = "bold" },
        b = { bg = colors.transparent, fg = colors.inactive_fg },
        c = { bg = colors.transparent, fg = colors.inactive_fg },
      },
    }

    lualine.setup({
      options = {
        theme = my_lualine_theme,
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "filename",
            path = 0,
          },
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = "#ff9e64", bg = "NONE" },
          },
          { "encoding" },
          { "fileformat" },
          { "filetype" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
    })

    vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
  end,
}
