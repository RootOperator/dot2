--return {
    --{
        --"nvim-treesitter/nvim-treesitter-textobjects",
        --branch = 'main'
    --},
    --{
        --'nvim-treesitter/nvim-treesitter',
        --branch = 'main',
        --lazy = false,
        --build = ":TSUpdate",
        --config = function()
            --require('nvim-treesitter').install({
                --'lua', 'rust', 'toml', 'python', 'c', 'cpp', 'zig'
            --})

            --vim.api.nvim_create_autocmd('FileType', {
                --pattern = { 'lua', 'rust', 'toml', 'python', 'c', 'cpp', 'zig' },
                --callback = function()
                    --vim.treesitter.start()
                    --vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                --end,
            --})

        --end
    --}
--}

return {
    { "nvim-treesitter/nvim-treesitter-textobjects" },
    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "rust", "toml", "python", "c", "cpp", "zig" },
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting=true,
                },
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            ["if"] = "@function.inner",
                        },
                    },
                },
                ident = { enable = true },
            })
        end
    }
}
