vim.opt.clipboard="unnamedplus"
vim.loader.enable()
require("essentials")
require("lazy_nvim")
vim.cmd([[
  highlight LineNr guifg=#FFAAD5 guibg=NONEi
]])
vim.api.nvim_set_hl(0, 'CursorLine', { blend = 50 }) 

