-- ~/.config/nvim/init.lua

vim.opt.number = true -- mostrar número das linhas
vim.opt.relativenumber = true -- número relativo (pra navegação rápida)
vim.opt.mouse = "a" -- ativar mouse
vim.opt.clipboard = "unnamedplus" -- usar clipboard do sistema
vim.opt.expandtab = true -- converter tabs em espaços
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	},
}
local opts = {}

vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set("i", "jk", "<Esc>", {noremap = false})
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR>", { silent = true })

require("lazy").setup("plugins")

require("rose-pine").setup()
vim.cmd.colorscheme("rose-pine")
