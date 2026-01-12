return {
    'leath-dub/snipe.nvim',
    keys = {
        {'gb', function () require('snipe').open_buffer_menu() end, desc = 'Open Snipe buffer menu'}
    },
    opts = {
        navigate = {
            leader = ' ',
            leader_map = {
                ['s'] = function (m, i) require('snipe').open_vsplit(m, i) end,
                ['i'] = function (m, i) require('snipe').open_split(m, i) end,
            },
            open_vsplit = 'S',
            open_split = 'I',
        },
        hints = {
            dictionary = 'asdflewcmpghio'
        },
    }
}
