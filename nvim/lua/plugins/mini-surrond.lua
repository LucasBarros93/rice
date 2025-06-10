return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require("mini.surround").setup()
        
        vim.keymap.set("x", '"', [[:lua MiniSurround.add("visual", "around", '"')<CR>]])
        vim.keymap.set("x", "'", [[:lua MiniSurround.add("visual", "around", "'")<CR>]])
        vim.keymap.set("x", "(", [[:lua MiniSurround.add("visual", "around", "(")<CR>]])
        vim.keymap.set("x", "[", [[:lua MiniSurround.add("visual", "around", "[")<CR>]])
        vim.keymap.set("x", "{", [[:lua MiniSurround.add("visual", "around", "{")<CR>]])
    end
}
