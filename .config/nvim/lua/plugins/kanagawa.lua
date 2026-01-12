return {
    {
        'rebelot/kanagawa.nvim',
        opts = {
            compile = true,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = 'none'
                        }
                    }
                }
            },
            overrides = function(colors)
                local theme = colors.theme
                return {
                    String = { fg = colors.palette.carpYellow, italic = true },

                    LspInlayHint = { italic = true, fg = theme.ui.nontext },

                    MiniIndentscopeSymbol = { fg = colors.palette.sumiInk5 },

                    ['@string.special.url'] = { fg = theme.syn.special1, underline = true, undercurl = false },
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
        opts = function()
            local colors = require('kanagawa-paper.colors')
            return {
                styles = {
                    comment = { italic = true },
                    functions = {},
                    keyword = { italic = true },
                    statement = { bold = true },
                    type = { italic = false },
                },
                colors = {
                    theme = {
                        ink = {
                            ui = {
                                bg = colors.palette.sumiInk1
                            }
                        }
                    }
                },
                overrides = function(colors)
                    local theme = colors.theme
                    return {
                        String = { fg = colors.palette.carpYellow, italic = true },

                        LspInlayHint = { fg = '#494c56', bg = colors.palette.sumiInk1, italic = true },
                        MiniIndentscopeSymbol = { fg = colors.palette.sumiInk5 },

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
        end
    }
}
