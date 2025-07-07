return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
        'saadparwaiz1/cmp_luasnip'
    },

    config = function ()
        local cmp = require('cmp')
        cmp.setup({
            enabled = function()
                local disabled = false
                disabled = disabled or (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
                disabled = disabled or (vim.fn.reg_recording() ~= '')
                disabled = disabled or (vim.fn.reg_executing() ~= '')
                disabled = disabled or require('cmp.config.context').in_treesitter_capture('comment')
                return not disabled
            end,
            snippet = {
                expand = function(args)
                     require('luasnip').lsp_expand(args.body)
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
                { name = 'path' },
                { name = 'nvim_lsp'},
                { name = 'nvim_lsp_signature_help'},
                { name = 'nvim_lua'},
                { name = 'buffer'},
                { name = 'luasnip' },
                { name = 'neorg'},
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
