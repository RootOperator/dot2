return {
    {
        'rootoperator/true-zen.nvim',
        opts = {
            modes = {
                ataraxis = {
                    minimum_writing_area = {
                        width = 120,
                        height = 44,
                    },
                    padding = { -- padding windows
                        left = 150,
                        right = 52,
                        top = 0,
                        bottom = 0,
                    },
                    callbacks = { -- run functions when opening/closing Ataraxis mode
                        open_pre = function () vim.cmd("UfoDisable") end,
                        open_pos = nil,
                        close_pre = nil,
                        close_pos = function() vim.cmd("UfoEnable") end
                    },
                },
                minimalist = {
                    callbacks = { -- run functions when opening/closing Ataraxis mode
                        open_pre = function () vim.cmd("Barbecue hide") end,
                        open_pos = nil,
                        close_pre = nil,
                        close_pos = function() vim.cmd("Barbecue show") end
                    },
                },
            },

            integrations = {
                lualine = true
            },
        }
    }
}
