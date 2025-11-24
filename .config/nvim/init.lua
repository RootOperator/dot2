vim.opt.encoding="UTF-8"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showbreak = "+++"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.undolevels = 1000
vim.opt.backspace = "indent,eol,start"
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.guicursor= "a:hor10"
vim.opt.scrolloff = 10
vim.opt.swapfile = false

vim.g.vim_svelte_plugin_use_typescript = 1
vim.g.rust_clip_command = 'wl-copy'

vim.cmd([[
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul
    autocmd InsertLeave * :StripTrailingWhitespace
    autocmd QuitPre * if empty(&bt) | lclose | endif

    au VimLeave * set guicursor=a:block100,a:blinkon100-blinkoff50
]])

require("config.lazy")
require("keybinds")
require("luasnip.loaders.from_snipmate").load()

-- Garbage
-- TODO: clean up

local function get_background()
    local handle = io.popen("change-background")
    local result = handle:read("*a")
    handle:close()

    return tonumber(result)
end

local function get_colorscheme()
    local default_colorscheme = "kanagawa"
    local hour = os.date("*t").hour

    if get_background() == 2 then
        return "kanagawa-dragon"
    elseif hour >= 19 or hour <= 6 then
        return "kanagawa-paper"
    else
        return default_colorscheme
    end
end

vim.api.nvim_create_autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.lsp.inlay_hint.enable(true)
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

local sign = function(opts)
vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
})
end

vim.fn.sign_define('DapBreakpoint', {
    texthl = 'DiagnosticSignError',
    text = '',
    numhl = ''
})

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- close NvimTree when it's the last opened buffer
--vim.api.nvim_create_autocmd("BufEnter", {
    --nested = true,
    --callback = function()
    --if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
        --vim.cmd "quit"
        --end
    --end
--})

vim.cmd(string.format("colorscheme %s", get_colorscheme()))
--require('kanagawa.colors').setup()
