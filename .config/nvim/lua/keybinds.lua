vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-h>', '<cmd>tabm -1<CR>', {noremap = true})
vim.keymap.set('n', '<C-l>', '<cmd>tabm +1<CR>', {noremap = true})
vim.keymap.set('n', '<A-j>', '<cmd>tabprevious<CR>', {noremap = true})
vim.keymap.set('n', '<A-k>', '<cmd>tabnext<CR>', {noremap = true})
vim.keymap.set('', '<C-n>', '<cmd>NvimTreeToggle<CR>', {noremap = true})

vim.keymap.set('n', '<S-j>', '5j', {noremap = true})
vim.keymap.set('n', '<S-k>', '5k', {noremap = true})
vim.keymap.set('v', '<S-j>', '5j', {noremap = true})
vim.keymap.set('v', '<S-k>', '5k', {noremap = true})
vim.keymap.set('n', '<S-h>', 'b', {noremap = true})
vim.keymap.set('n', '<S-l>', 'w', {noremap = true})
vim.keymap.set('v', '<S-h>', 'b', {noremap = true})
vim.keymap.set('v', '<S-l>', 'w', {noremap = true})

vim.keymap.set('n', '<C-S-j>', ':m .+1<CR>==', {noremap = true})
vim.keymap.set('n', '<C-S-k>', ':m .-2<CR>==', {noremap = true})
vim.keymap.set('i', '<C-S-k>', '<Esc>:m .-2<CR>==gi', {noremap = true})
vim.keymap.set('i', '<C-S-j>', '<Esc>:m .+1<CR>==gi', {noremap = true})
vim.keymap.set('v', '<C-S-j>', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.keymap.set('v', '<C-S-k>', ':m \'<-2<CR>gv=gv', {noremap = true})

vim.keymap.set('n', '<leader>df', 'daBdd')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>j', function()
  vim.cmd('norm! ' .. vim.v.count1 .. 'J')
end)

vim.keymap.set('n', '<leader>tt', '<cmd>ToggleInlayEndHints<CR>', {noremap = true})
vim.keymap.set('n', '<leader>m', '<cmd>MarkdownPreviewToggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>lp', '<cmd>lclose<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ll', '<cmd>lopen<CR>', {noremap = true})

vim.keymap.set('n', '<leader>at', '<cmd>ALEToggle<CR>', {noremap = true})

vim.keymap.set('n', '<leader>ft', '<cmd>Format<CR>', {noremap = true})
vim.keymap.set('n', '<leader>b', '<cmd>DapToggleBreakpoint<CR>', {noremap = true})
vim.keymap.set('n', '<leader>cb', '<cmd>lua require\'dap\'.clear_breakpoints()<CR>', {noremap = true})
vim.keymap.set('n', "<leader>u",'<cmd>UndotreeToggle<CR>')

vim.keymap.set('n', '<leader>zn', '<cmd>TZNarrow<CR>', {noremap = true})
vim.keymap.set('v', '<leader>zn', '<cmd>\'<,\'>TZNarrow<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zf', '<cmd>TZFocus<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zm', '<cmd>TZMinimalist<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zz', '<cmd>TZAtaraxis<CR>', {noremap = true})

vim.keymap.set('', '<leader>no', '<cmd>Neorg workspace notes<CR>', {noremap = true})
vim.keymap.set('', '<leader>nr', '<cmd>Neorg return<CR>', {noremap = true})
vim.keymap.set('', '<leader>nc', '<Plug>(neorg.looking-glass.magnify-code-block)', {noremap = true})

vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
vim.keymap.set('n', '<C-x>', '<cmd>lua require("pretty_hover").hover()<CR>', {noremap = true})
vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true})
vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
vim.keymap.set('n', '[e', '<cmd>lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})<CR>', {noremap = true})
vim.keymap.set('n', ']e', '<cmd>lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})<CR>', {noremap = true})
vim.keymap.set('n', 'grt', '<cmd>Telescope lsp_references<CR>', {noremap = true})

vim.keymap.set('n', '<leader>xx','<cmd>Trouble diagnostics toggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xX','<cmd>Trouble diagnostics toggle filter.buf=0<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xs','<cmd>Trouble symbols toggle focus=false<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xl','<cmd>Trouble lsp toggle focus=false win.position=right<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xL','<cmd>Trouble loclist toggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xQ','<cmd>Trouble qflist toggle<CR>', {noremap = true})
vim.keymap.set('n', '[t','<cmd>Trouble next skip_groups = true jump = true<CR>', {noremap = true})
vim.keymap.set('n', ']t','<cmd>Trouble prev skip_groups = true jump = true<CR>', {noremap = true})

vim.keymap.set('', '<F5>', ':DapContinue<CR>', {noremap = true})
vim.keymap.set('', '<F6>', ':DapTerminate<CR>', {noremap = true})
vim.keymap.set('', '<F10>', ':DapStepOver<CR>', {noremap = true})
vim.keymap.set('', '<F11>', ':DapStepInto<CR>', {noremap = true})
vim.keymap.set('', '<F12>', ':DapStepOut<CR>', {noremap = true})

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope lsp_document_symbols<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fh', '<cmd>TodoTelescope<CR>', {noremap = true})

vim.cmd([[
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
]])
