return {
    { 'lewis6991/gitsigns.nvim', config = true },
    'preservim/nerdcommenter',
    'cespare/vim-toml',

    'rust-lang/rust.vim',
    'arzg/vim-rust-syntax-ext',
    'mattn/webapi-vim',
    'leafOfTree/vim-vue-plugin',
    'leafOfTree/vim-svelte-plugin',
    'pbrisbin/vim-colors-off',
    'nvim-tree/nvim-web-devicons',

    { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, config = true },

    'voldikss/vim-floaterm',

    'nvim-neotest/nvim-nio',

    { 'williamboman/mason.nvim', config = true },
    { 'williamboman/mason-lspconfig.nvim', config = true },

    'neovim/nvim-lspconfig',

    { 'windwp/nvim-ts-autotag', config = true },
    'tpope/vim-surround',

    { 'nanozuki/tabby.nvim', config = true },

    'nvim-zh/whitespace.nvim',

    { 'lukas-reineke/headlines.nvim', config = true },

    { 'chentoast/marks.nvim', event = "VeryLazy", config = true },

    { 'utilyre/barbecue.nvim', dependencies = { 'SmiteshP/nvim-navic' }, config = true },

    { 'mrcjkb/rustaceanvim', version = '^6', lazy = false },
    'Bekaboo/deadcolumn.nvim',
    "mbbill/undotree",
    --'b0o/incline.nvim'
}
