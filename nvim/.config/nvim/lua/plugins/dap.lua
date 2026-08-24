
return {
  "mfussenegger/nvim-dap",  -- DAP 核心
  "rcarriga/nvim-dap-ui",   -- UI 增強
  "nvim-telescope/telescope-dap.nvim",  -- 讓 telescope 支持 DAP
  "jay-babu/mason-nvim-dap.nvim",  -- Mason DAP 支持
  
  config = function()
    local dap = require("dap")

    -- 配置 GDB 適配器
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",  -- GDB 命令
      args = { "-i", "dap" }  -- 使用 DAP 協議
    }

    -- 配置 C/C++ 的調試配置
    dap.configurations.cpp = {
      {
        name = "Launch with GDB",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    -- 讓 C 和 Rust 也能用 GDB 配置
    dap.configurations.c = dap.configurations.cpp
    dap.configurations.rust = dap.configurations.cpp
  end
}
