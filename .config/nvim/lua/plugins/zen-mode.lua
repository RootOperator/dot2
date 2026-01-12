return {
    'folke/zen-mode.nvim',
    opts = {
        window = {
            options = {
                signcolumn = 'no',
            }
        },
        plugins = {
            options = {
                enabled = true,
                showcmd = false,
                laststatus = 0
            },
            gitsigns = { enabled = true },
            tmux = { enabled = true },
            alacritty = {
                enabled = true,
                font = '14',
            },
        },
        on_open = function(win)
            vim.cmd('Barbecue hide')
            vim.lsp.inlay_hint.enable(false)
            vim.diagnostic.config({ virtual_text = false })
        end,
        on_close = function()
            vim.cmd('Barbecue show')
            vim.lsp.inlay_hint.enable(true)
            vim.diagnostic.config({ virtual_text = true })
        end
    },
}
