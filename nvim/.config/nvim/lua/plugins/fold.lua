return{
    {
        "kevinhwang91/nvim-ufo",
        dependencies = {
            "kevinhwang91/promise-async"
        },
        config = function()
            vim.o.foldcolumn = "1" -- 显示折叠列
            vim.o.foldlevel = 99   -- 默认展开所有折叠
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end
            })
        end
    }
}
