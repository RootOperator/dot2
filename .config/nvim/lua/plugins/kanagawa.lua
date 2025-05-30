return {
    {
        'rootoperator/kanagawa.nvim',
        opts = {
            compile = true,
            undercurl = true,           -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,        -- do not set background color
            dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
            globalStatus = false,       -- adjust window separators highlight for laststatus=3
            terminalColors = true,
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none"
                        }
                    }
                }
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    -- Assign a static color to strings
                    String = { fg = colors.palette.carpYellow, italic = true },

                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                }
            end,
        }
    },
    {
        'sho-87/kanagawa-paper.nvim',
        opts = {
            undercurl = true,           -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            transparent = false,        -- do not set background color
            dimInactive = false,        -- dim inactive window `:h hl-NormalNC`
            globalStatus = false,       -- adjust window separators highlight for laststatus=3
            terminalColors = true,
            colors = {
                palette = {
                    sumiInk3 = "#181820",
                },
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    -- Assign a static color to strings
                    String = { fg = colors.palette.carpYellow, italic = true },

                    TelescopeTitle = { fg = theme.ui.special, bold = true },
                    TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                    TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                    TelescopeResultsNormal = { fg = theme.ui.fg, bg = theme.ui.bg_m1 },
                    TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                    TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                    TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
                }
            end,
        }
    }
}
