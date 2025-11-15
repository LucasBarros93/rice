return {
	"christoomey/vim-tmux-navigator",
	lazy = false,
	init = function()
		-- Desabilitar os mapeamentos padrão
		vim.g.tmux_navigator_no_mappings = 1
	end,
	config = function()
		-- Definir os mapeamentos customizados
		vim.keymap.set("n", "<M-h>", ":TmuxNavigateLeft<CR>", { silent = true })
		vim.keymap.set("n", "<M-j>", ":TmuxNavigateDown<CR>", { silent = true })
		vim.keymap.set("n", "<M-k>", ":TmuxNavigateUp<CR>", { silent = true })
		vim.keymap.set("n", "<M-l>", ":TmuxNavigateRight<CR>", { silent = true })
	end,
}
