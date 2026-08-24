return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("tokyonight").setup({
                transparent = true, -- Disables the background color
                styles = {
                    -- Optional: These make other UI elements transparent as well
                    sidebars = "transparent",
                    floats = "transparent",
                },
            })
            vim.cmd[[colorscheme tokyonight-storm]]
            vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "WinBar", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "WinBarNC", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineBackground", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineSeparator", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineBufferSelected", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NavicText", { bg = "NONE" })
            vim.api.nvim_set_hl(0, "NavicSeparator", { bg = "NONE" })
            local custom_code = require('lualine.themes.OceanicNext')
            custom_code.normal.c.bg = 'NONE'
            custom_code.insert.c.bg = 'NONE'
            custom_code.visual.c.bg = 'NONE'
            custom_code.replace.c.bg = 'NONE'

            -- Inactive windows usually have their own background definition
            if custom_code.inactive then
                custom_code.inactive.c.bg = 'NONE'
            end
            require('lualine').setup { options = { theme  = custom_code } }
            -- require('lualine').setup({
            --     options = {
            --         theme = 'OceanicNext'
            --     },
            -- })
            require('barbecue').setup {
                theme = 'auto',
            }
        end
    },
}
