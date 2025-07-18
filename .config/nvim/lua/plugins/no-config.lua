return {
    'preservim/nerdcommenter',
    'arzg/vim-rust-syntax-ext',
    --'leafOfTree/vim-vue-plugin',
    --'leafOfTree/vim-svelte-plugin',
    'nvim-tree/nvim-web-devicons',
    'nvim-neotest/nvim-nio',
    'neovim/nvim-lspconfig',
    'tpope/vim-surround',
    'nvim-zh/whitespace.nvim',
    'Bekaboo/deadcolumn.nvim',
    'mbbill/undotree',
    'sindrets/diffview.nvim',


    { 'rust-lang/rust.vim', dependencies = { 'mattn/webapi-vim' }},
    { 'lewis6991/gitsigns.nvim', config = true },
    { 'folke/todo-comments.nvim', dependencies = { 'nvim-lua/plenary.nvim' }, config = true },
    { 'mason-org/mason.nvim', config = true },
    { 'mason-org/mason-lspconfig.nvim', config = true },
    { 'windwp/nvim-ts-autotag', config = true },
    { 'nanozuki/tabby.nvim', config = true },
    { 'chentoast/marks.nvim', event = "VeryLazy", config = true },
    { 'utilyre/barbecue.nvim', dependencies = { 'SmiteshP/nvim-navic' }, config = true },
    { 'mrcjkb/rustaceanvim', version = '^6', lazy = false },
    { 'echasnovski/mini.align', config = true},

}
