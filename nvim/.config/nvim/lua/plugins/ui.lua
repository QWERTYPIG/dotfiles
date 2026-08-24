return {
    {
        "akinsho/bufferline.nvim",
        config = true, 
    },
    {
        "lewis6991/gitsigns.nvim",
        config = true,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    },
    {
        "RRethy/vim-illuminate",
        config = function()
            require('illuminate').configure({
                filetypes_denylist = { "java" },
    })
        end
    },
}
