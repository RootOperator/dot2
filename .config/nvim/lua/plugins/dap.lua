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

            dap.adapters.gdb = {
                type = "executable",
                command = "gdb",
                args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
            }

            dap.configurations.c = {
                {
                    name = "Launch gdb",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
                {
                    name = "Launch gdb with args",
                    type = "gdb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    args = function()
                        local args_string = vim.fn.input("Arguments: ")
                        return vim.split(args_string, " +")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtBeginningOfMainSubprogram = false,
                },
                {
                    name = "Launch",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
                {
                    name = "Launch with args",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input(
                            "Path to executable: ",
                            vim.fn.getcwd() .. "/",
                            "file"
                        )
                    end,
                    args = function()
                        local args_string = vim.fn.input("Arguments: ")
                        return vim.split(args_string, " +")
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                }
            }

            dap.configurations.rust = {
                {
                    name = "Launch",
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

            dap.configurations.cpp = dap.configurations.c

            dap.configurations.zig = {
                {
                    name = "Launch Zig Program",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        local default_build_path = vim.fn.input("Path to executable: ", "zig-out/bin/", "file")
                        if default_build_path == nil or default_build_path == '' then
                            error("No executable path provided!")
                        end
                        return default_build_path
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    args = {},
                    preLaunchTask = function()
                        print("Building Zig project...")
                        local job_id = vim.fn.jobstart('zig build', {
                            cwd = vim.fn.getcwd(),
                            on_stdout = function(_, data, _) print(table.concat(data, '\n')) end,
                            on_stderr = function(_, data, _) print(table.concat(data, '\n')) end,
                            on_exit = function(_, code, _)
                                if code ~= 0 then
                                    vim.notify("Zig build failed!", vim.log.levels.ERROR)
                                else
                                    vim.notify("Zig build successful!", vim.log.levels.INFO)
                                end
                            end,
                        })
                    end,
                },
            }
        end
    },

    {
        'rcarriga/nvim-dap-ui',
        dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
        config = function ()
            require("dapui").setup()

            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end
    }
}
