return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function ()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "lua", "rust", "toml", "python", "c", "cpp", "zig", "hyprlang" },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting=true,
            },
            ident = { enable = true },
        })
    end
}
