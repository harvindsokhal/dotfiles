vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true 
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false


-- search settings 
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if mixed case included in search, assume case-sensitive

opt.termguicolors = true
opt.background = "dark"

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom


--clipboard
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "WslClipboard",
		copy = {
			["+"] = "clip.exe",
			["*"] = "clip.exe",
		},
		paste = {
			["+"] = 'powershell.exe -NoProfile -Command Get-Clipboard',
			["*"] = 'powershell.exe -NoProfile -Command Get-Clipboard',
		},
		cache_enabled = 0,
	}

	vim.opt.clipboard = "unnamedplus"
end
