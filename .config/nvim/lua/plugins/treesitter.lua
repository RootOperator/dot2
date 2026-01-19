local langs = {
    'lua',
    'rust',
    'python',
    'c',
    'cpp',
    'zig',
    'bash',
    'toml',
    'ini',
    'json',
    'meson',
    'make',
    'cmake',
    'markdown',
    'markdown_inline',
    'regex',
    'hyprlang',
    'html',
    'css',
    'javascript',
    'typescript',
    'svelte',
    'norg',
    'norg_meta',
    'c3',
}

return {
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        opts = {
            move = {
                set_jumps = true,
            }
        }
    },
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter').install(langs)

            vim.api.nvim_create_autocmd('FileType', {
                pattern = langs,
                callback = function()
                    vim.treesitter.start()

                    -- vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    -- vim.wo[0][0].foldmethod = 'expr'

                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end
    }
}
