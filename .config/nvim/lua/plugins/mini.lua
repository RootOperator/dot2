return {
    { 'nvim-mini/mini.align', config = true },
    { 'nvim-mini/mini.move', config = true },
    { 'nvim-mini/mini.pairs', config = true },
    { 'nvim-mini/mini.splitjoin', config = true },
    { 'nvim-mini/mini.surround', config = true },
    {
        'nvim-mini/mini.ai',
        opts = function()
            local gen_spec = require('mini.ai').gen_spec
            return {
                custom_textobjects = {
                    f = gen_spec.treesitter({ a = '@function.outer', i = '@function.inner' }, {}),
                },
            }
        end,
    },
    {
        'nvim-mini/mini.files',
        config = function()
            require("mini.files").setup({
                content = {
                    filter = function(entry)
                        return entry.name:sub(1, 1) ~= '.'
                    end,
                },
                mappings = {
                    go_in = 'L',
                    go_in_plus = 'l',
                    synchronize = "<CR>"
                }
            })
            local map_split = function(buf_id, lhs, direction)
                local rhs = function()
                    local cur_target = MiniFiles.get_explorer_state().target_window
                    local new_target = vim.api.nvim_win_call(cur_target, function()
                        vim.cmd(direction .. ' split')
                        return vim.api.nvim_get_current_win()
                    end)

                    MiniFiles.set_target_window(new_target)
                    MiniFiles.go_in()
                    if direction ~= "tab" then
                        MiniFiles.close()
                    end
                end

                local desc = 'Split ' .. direction
                vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc, nowait = true })
            end

            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local buf_id = args.data.buf_id

                    vim.keymap.set('n', '<C-n>', '<cmd>lua MiniFiles.close()<CR>', { buffer = buf_id })
                    map_split(buf_id, 'i', 'horizontal')
                    map_split(buf_id, 's', 'vertical')
                    map_split(buf_id, 't', 'tab')
                end,
            })

            -- toggle dotfiles
            local show_dotfiles = true

            local filter_show = function(fs_entry) return true end

            local filter_hide = function(fs_entry)
                return not vim.startswith(fs_entry.name, '.')
            end

            local toggle_dotfiles = function()
                show_dotfiles = not show_dotfiles
                local new_filter = show_dotfiles and filter_show or filter_hide
                MiniFiles.refresh({ content = { filter = new_filter } })
            end

            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local buf_id = args.data.buf_id
                    -- Tweak left-hand side of mapping to your liking
                    vim.keymap.set('n', '.', toggle_dotfiles, { buffer = buf_id })
                end,
            })
        end
    },
}
