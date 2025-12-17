return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-path',
        'onsails/lspkind.nvim',
        {
            'L3MON4D3/LuaSnip',
            build = 'make install_jsregexp',
            opts = {
                history = true,
                update_events = "TextChanged,TextChangedI",
                delete_check_events = "TextChanged",
                region_check_events = "InsertEnter",
            }
        },
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
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-n>'] = cmp.mapping.select_next_item(),
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
                { name = 'luasnip' },
                { name = 'neorg'},
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = function(entry, vim_item)
                    local kind = require("lspkind").cmp_format({
                        mode = "symbol_text",
                    })(entry, vim.deepcopy(vim_item))

                    local highlights_info = require("colorful-menu").cmp_highlights(entry)
                    -- error, such as missing parser, fallback to use raw label.
                    if highlights_info == nil then
                        vim_item.abbr = entry:get_completion_item().label
                    else
                        vim_item.abbr_hl_group = highlights_info.highlights
                        vim_item.abbr = highlights_info.text
                    end

                    local strings = vim.split(kind.kind, "%s", { trimempty = true })
                    vim_item.icon = " " .. (strings[1] or "") .. " "
                    vim_item.menu = ""

                    return vim_item
                end,
            },
        })
    end
}
