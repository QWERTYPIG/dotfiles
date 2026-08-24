return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
      local nts = require("nvim-treesitter")

      nts.setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })

      nts.install({
        "lua",
        "vim",
        "vimdoc",
        "query",
        "html",
        "css",
        "javascript",
        "c",
        "cpp",
        "python",
        "markdown",
        "markdown_inline",
      })

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          local ft = vim.bo[args.buf].filetype

          -- 先跳過 markdown，避免 code block injection 又炸
          if ft == "markdown" or ft == "markdown_inline" then
            return
          end

          pcall(vim.treesitter.start, args.buf)

          local ok, ts = pcall(require, "nvim-treesitter")
          if ok and ts.indentexpr then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v",
            ["@function.outer"] = "V",
            ["@class.outer"] = "<c-v>",
          },
          include_surrounding_whitespace = false,
        },
      })

      local select = require("nvim-treesitter-textobjects.select")

      vim.keymap.set({ "x", "o" }, "af", function()
        select.select_textobject("@function.outer", "textobjects")
      end, { desc = "Select outer function" })

      vim.keymap.set({ "x", "o" }, "if", function()
        select.select_textobject("@function.inner", "textobjects")
      end, { desc = "Select inner function" })

      vim.keymap.set({ "x", "o" }, "ac", function()
        select.select_textobject("@class.outer", "textobjects")
      end, { desc = "Select outer class" })

      vim.keymap.set({ "x", "o" }, "ic", function()
        select.select_textobject("@class.inner", "textobjects")
      end, { desc = "Select inner class" })

      vim.keymap.set({ "x", "o" }, "as", function()
        select.select_textobject("@local.scope", "locals")
      end, { desc = "Select local scope" })
    end,
  },
}
