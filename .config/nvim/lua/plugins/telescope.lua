return {
    'nvim-telescope/telescope.nvim',
    opts = {
        defaults = {
            mappings = {
                i = {
                    ['<C-s>'] = 'select_vertical',
                    ['<C-i>'] = 'select_horizontal',
                    ['<C-t>'] = 'select_tab',
                },
                n = {
                    ['s'] = 'select_vertical',
                    ['i'] = 'select_horizontal',
                    ['t'] = 'select_tab',
                }
            }
        },
        pickers = {
            find_files = {
                find_command = { 'rg' , '--files', '--color', 'never', '--no-require-git'}
            },
            man_pages = {
                sections = { 'ALL' }
            },
        }
    }
}
