return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/vim-vsnip',
    },
    config = function ()
        local cmp = require'cmp'
        cmp.setup({
            -- Enable LSP snippets
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            mapping = {
                ['<S-Tab>'] = cmp.mapping.select_prev_item(),
                ['<Tab>'] = cmp.mapping.select_next_item(),
                ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-e>'] = cmp.mapping.close(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                })
            },
            -- Installed sources:
            sources = {
                { name = 'path' },                              -- file paths
                { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
                { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
                { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'buffer', keyword_length = 2 },        -- source current buffer
                { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
                { name = 'calc'},                               -- source for math calculation
                { name = 'neorg'},                              -- notes
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                fields = {'menu', 'abbr', 'kind'},
                format = function(entry, vim_item)
                    local highlights_info = require("colorful-menu").cmp_highlights(entry)

                    local menu_icon ={
                        nvim_lsp = 'λ',
                        vsnip = '⋗',
                        buffer = 'Ω',
                        path = '',
                    }
                    vim_item.menu = menu_icon[entry.source.name]

                    if highlights_info ~= nil then
                        vim_item.abbr_hl_group = highlights_info.highlights
                        vim_item.abbr = highlights_info.text
                    end

                    return vim_item
                end,
            },
        })
    end
}
