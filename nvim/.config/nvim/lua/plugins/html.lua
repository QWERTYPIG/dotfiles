
return {
  {
    "othree/html5.vim",
    ft = { "html" },
    config = function()
      -- 啟用 html5.vim 的縮排支援
      vim.g.html5_indent_inctags = "style,script"

      -- 修正 HTML 自動縮排問題
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "html",
        callback = function()
          -- 啟用 Neovim 內建的縮排機制
          vim.opt_local.autoindent = true
          vim.opt_local.smartindent = true
          vim.opt_local.expandtab = true
          vim.opt_local.shiftwidth = 2
          vim.opt_local.tabstop = 2


          -- 修正 `<style>` 內的縮排
          vim.api.nvim_create_autocmd("FileType", {
            pattern = "css",
            callback = function()
              vim.opt_local.autoindent = true
              vim.opt_local.smartindent = true
              vim.opt_local.indentexpr = ""
            end,
          })
        end,
      })
    end,
  }
}
