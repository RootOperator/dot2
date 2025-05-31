vim.opt.termguicolors = true

require("config.lazy")
--require("lazy").setup("plugins")


-- Garbage

vim.lsp.inlay_hint.enable(true)

vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess = vim.opt.shortmess + { c = true}
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

vim.cmd("colorscheme kanagawa")
require('kanagawa.colors').setup()

vim.cmd("source ~/.nvimrc")
