return {
  'nvimdev/lspsaga.nvim',
  event = 'LspAttach',
  config = function()
    require('lspsaga').setup({
        ui = {
            border = 'rounded' -- 使用圓角邊框
        },
        lightbulb = {
            enable = false, -- 顯示代碼動作的提示燈泡
        },
        symbol_in_winbar = {
            enable = true, -- 在窗口頂部顯示當前符號
        }
    })
  end,
  dependencies = {
    {'nvim-tree/nvim-web-devicons'},
    {'nvim-treesitter/nvim-treesitter'}
  }
}
