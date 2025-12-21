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
}

return {
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
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
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter').install(langs)

            --vim.api.nvim_create_autocmd("FileType", {
                --pattern = { "norg", "neorg" },
                --callback = function()
                    --if pcall(vim.treesitter.start) then
                        --vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                        --vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    --end
                --end,
            --})

            --require("nvim-treesitter.parsers").norg = {
                --install_info = {
                    --url = "https://github.com/nvim-neorg/tree-sitter-norg",
                    --files = { "src/parser.c", "src/scanner.cc" },
                    --build_cmd = "yarn gen",
                    --cxx_standard = "c++14",
                    --revision = "d89d95af13d409f30a6c7676387bde311ec4a2c8",
                --},
                --maintainers = { "@JoeyGrajciar", "@vhyrro" },
                --tier = 2,
                --generate_requires_npm = true,
            --}

            vim.api.nvim_create_autocmd('FileType', {
                pattern = langs,
                callback = function()
                    vim.treesitter.start()

                    vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                    vim.wo[0][0].foldmethod = 'expr'

                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })
        end
    }
}

    --return {
    --{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "master" },
    --{
        --'nvim-treesitter/nvim-treesitter',
        --lazy = false,
        --branch = "master",
        --build = ":TSUpdate",
        --config = function ()
            --require("nvim-treesitter.configs").setup({
                --ensure_installed = { "lua", "rust", "toml", "python", "c", "cpp", "zig" },
                --auto_install = true,
                --highlight = {
                    --enable = true,
                    --additional_vim_regex_highlighting=true,
                --},
                --textobjects = {
                    --select = {
                        --enable = true,
                        --keymaps = {
                            --["if"] = "@function.inner",
                            --["ic"] = "@class.inner",
                        --},
                    --},
                    --move = {
                        --enable = true,
                        --set_jumps = true,
                        --goto_next_start = {
                            --["]4"] = "@function.outer",
                        --},
                        --goto_next_end = {
                            --["]$"] = "@function.outer",
                        --},
                        --goto_previous_start = {
                            --["[4"] = "@function.outer",
                        --},
                        --goto_previous_end = {
                            --["[4"] = "@function.outer",
                        --},
                    --}
                --},
                --ident = { enable = true },
            --})
        --end
    --}
--}
