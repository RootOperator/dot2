return {
    {
        'mfussenegger/nvim-dap',
        config = function ()
            local dap = require("dap")

            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    command = "/home/rootoperator/.local/share/nvim/mason/bin/codelldb",
                    args = {"--port", "${port}"},
                }
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        local t={}
                        for str in string.gmatch(vim.fn.getcwd(), "([^/]+)") do
                            table.insert(t, str)
                        end

                        return vim.fn.getcwd() .. '/' .. t[#t]
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                }
            }

            dap.configurations.rust = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        local t={}
                        for str in string.gmatch(vim.fn.getcwd(), "([^/]+)") do
                            table.insert(t, str)
                        end

                        return vim.fn.getcwd() .. '/target/debug/' .. t[#t]
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                }
            }

            dap.configurations.c = dap.configurations.cpp
        end
    },

    {
        'rcarriga/nvim-dap-ui',
        config = function ()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
            end
        end
    }
}
