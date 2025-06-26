vim.opt.encoding="UTF-8"
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showbreak = "+++"
vim.opt.hlsearch = true
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

vim.g.vim_svelte_plugin_use_typescript = 1
vim.g.rust_clip_command = 'wl-copy'
vim.g.colors_off_a_little = 1

vim.cmd([[
    autocmd InsertEnter * set cul
    autocmd InsertLeave * set nocul
    autocmd QuitPre * if empty(&bt) | lclose | endif

    if $TERM =~ 'xterm-256color'
        set noek
    endif
]])

require("keybinds")
require("config.lazy")

-- Garbage

vim.lsp.inlay_hint.enable(true)
vim.cmd('filetype plugin indent on')
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true }
vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
    set signcolumn=yes
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

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
    severity_sort = false,
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
vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
        vim.cmd "quit"
        end
    end
})

vim.cmd("colorscheme kanagawa-paper")
--require('kanagawa.colors').setup()
