vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('i', '<C-BS>', '<C-W>', {noremap = true})
vim.keymap.set('n', '<C-h>', '<cmd>tabm -1<CR>', {noremap = true})
vim.keymap.set('n', '<C-l>', '<cmd>tabm +1<CR>', {noremap = true})
vim.keymap.set('n', '<A-j>', '<cmd>tabprevious<CR>', {noremap = true})
vim.keymap.set('n', '<A-k>', '<cmd>tabnext<CR>', {noremap = true})
vim.keymap.set('', '<C-n>', '<cmd>NvimTreeToggle<CR>', {noremap = true})

vim.keymap.set('', '<C-t>', '<cmd>FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 <CR>', {noremap = true})
vim.keymap.set('', '<A-t>', '<cmd>FloatermToggle myfloat<CR>', {noremap = true})
vim.keymap.set('t', '<A-t>', '<C-\\><C-n> <cmd>FloatermToggle myfloat<CR>', {noremap = true})
vim.keymap.set('t', '<A-n>', '<C-\\><C-n> <cmd>FloatermNext<CR>', {noremap = true})

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

vim.keymap.set('n', '<Leader>tt', '<cmd>ToggleInlayEndHints<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>m', '<cmd>MarkdownPreviewToggle<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>lp', '<cmd>lclose<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>ll', '<cmd>lopen<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>st', '<cmd>ALEToggle<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>nn', '<cmd>lnext<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>pp', '<cmd>lprevious<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>ft', '<cmd>Format<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>b', '<cmd>DapToggleBreakpoint<CR>', {noremap = true})
vim.keymap.set('n', '<Leader>c', '<cmd>lua require\'dap\'.clear_breakpoints()<CR>', {noremap = true})
vim.keymap.set('n', "<leader>u",'<cmd>UndotreeToggle<CR>')

vim.keymap.set('n', '<Leader>zn', '<cmd>TZNarrow<CR>', {noremap = true})
vim.keymap.set('v', '<Leader>zn', '<cmd>\'<,\'>TZNarrow<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zf', '<cmd>TZFocus<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zm', '<cmd>TZMinimalist<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zz', '<cmd>TZAtaraxis<CR>', {noremap = true})

vim.keymap.set('', '<Leader>no', '<cmd>Neorg workspace notes<CR>', {noremap = true})
vim.keymap.set('', '<Leader>nr', '<cmd>Neorg return<CR>', {noremap = true})
vim.keymap.set('', '<Leader>nc', '<cmd>Neorg keybind all core.looking-glass.magnify-code-block<CR>', {noremap = true})

vim.keymap.set('', '<F5>', ':DapContinue<CR>', {noremap = true})
vim.keymap.set('', '<F10>', ':DapStepOver<CR>', {noremap = true})
vim.keymap.set('', '<F11>', ':DapStepInto<CR>', {noremap = true})
vim.keymap.set('', '<F12>', ':DapStepOut<CR>', {noremap = true})

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', {noremap = true})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {noremap = true})
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', {noremap = true})
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope treesitter<cr>', {noremap = true})
vim.keymap.set('n', '<leader>fh', '<cmd>TodoTelescope<cr>', {noremap = true})

vim.cmd([[
    imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
]])
