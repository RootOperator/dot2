vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<C-j>', '<cmd>tabprevious<CR>', {noremap = true})
vim.keymap.set('n', '<C-k>', '<cmd>tabnext<CR>', {noremap = true})

vim.keymap.set('n', '<C-n>', '<cmd>lua MiniFiles.open()<CR>', {noremap = true})

vim.keymap.set('n', '<C-l>', '1z=', {noremap = true})
vim.keymap.set('n', '[2', '[s', {noremap = true})
vim.keymap.set('n', ']2', ']s', {noremap = true})
vim.keymap.set('n', '<leader>ss', '<cmd> set spell<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ns', '<cmd> set nospell<CR>', {noremap = true})


vim.keymap.set('n', '<C-e>', '5<C-e>', {noremap = true})
vim.keymap.set('n', '<C-y>', '5<C-y>', {noremap = true})

vim.keymap.set('n', '<S-j>', '5j', {noremap = true})
vim.keymap.set('n', '<S-k>', '5k', {noremap = true})
vim.keymap.set('v', '<S-j>', '5j', {noremap = true})
vim.keymap.set('v', '<S-k>', '5k', {noremap = true})

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>j', function()
  vim.cmd('norm! ' .. vim.v.count1 .. 'J')
end)

vim.keymap.set('n', '<leader>tt', '<cmd>ToggleInlayEndHints<CR>', {noremap = true})
vim.keymap.set('n', '<leader>mt', '<cmd>MarkdownPreviewToggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>lp', '<cmd>lclose<CR>', {noremap = true})
vim.keymap.set('n', '<leader>ll', '<cmd>lopen<CR>', {noremap = true})

vim.keymap.set('n', '<leader>ft', '<cmd>Format<CR>', {noremap = true})
vim.keymap.set('n', '<leader>b', '<cmd>DapToggleBreakpoint<CR>', {noremap = true})
vim.keymap.set('n', '<leader>cb', '<cmd>lua require\'dap\'.clear_breakpoints()<CR>', {noremap = true})
vim.keymap.set('n', "<leader>u",'<cmd>UndotreeToggle<CR>')

vim.keymap.set('n', '<leader>zz', '<cmd>ZenMode<CR>', {noremap = true})
vim.keymap.set('n', '<leader>zf', '<C-w>_<C-w>|', {noremap = true})

vim.keymap.set('', '<leader>no', '<cmd>Neorg workspace notes<CR>', {noremap = true})
vim.keymap.set('', '<leader>nr', '<cmd>Neorg return<CR>', {noremap = true})
vim.keymap.set('', '<leader>nc', '<Plug>(neorg.looking-glass.magnify-code-block)', {noremap = true})

vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap = true})
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
vim.keymap.set('n', '<C-x>', '<cmd>lua require("pretty_hover").hover()<CR>', {noremap = true})
vim.keymap.set('n', '[3', '<cmd>lua vim.diagnostic.goto_next()<CR>', {noremap = true})
vim.keymap.set('n', ']3', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {noremap = true})
vim.keymap.set('n', '[#', '<cmd>lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})<CR>', {noremap = true})
vim.keymap.set('n', ']#', '<cmd>lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})<CR>', {noremap = true})
vim.keymap.set('i', '<C-j>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap = true})
vim.keymap.set('n', 'grr', '<cmd>Telescope lsp_references<CR>', {noremap = true})

vim.keymap.set('n', '<leader>xx','<cmd>Trouble diagnostics toggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xX','<cmd>Trouble diagnostics toggle filter.buf=0<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xs','<cmd>Trouble symbols toggle focus=false<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xl','<cmd>Trouble lsp toggle focus=false win.position=right<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xL','<cmd>Trouble loclist toggle<CR>', {noremap = true})
vim.keymap.set('n', '<leader>xQ','<cmd>Trouble qflist toggle<CR>', {noremap = true})
vim.keymap.set('n', '[%','<cmd>Trouble next skip_groups = true jump = true<CR>', {noremap = true})
vim.keymap.set('n', ']%','<cmd>Trouble prev skip_groups = true jump = true<CR>', {noremap = true})

vim.keymap.set('', '<F5>', ':DapContinue<CR>', {noremap = true})
vim.keymap.set('', '<F6>', ':DapTerminate<CR>', {noremap = true})
vim.keymap.set('', '<F10>', ':DapStepOver<CR>', {noremap = true})
vim.keymap.set('', '<F11>', ':DapStepInto<CR>', {noremap = true})
vim.keymap.set('', '<F12>', ':DapStepOut<CR>', {noremap = true})

vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fn', '<cmd>Telescope lsp_document_symbols<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fm', '<cmd>Telescope man_pages<CR>', {noremap = true})
vim.keymap.set('n', '<leader>fh', '<cmd>TodoTelescope<CR>', {noremap = true})

vim.keymap.set('n', '<leader>fr', '<cmd>reg<CR>', {noremap = true})

vim.keymap.set('n', '<leader>mm', ':lua require"popui.marks-manager"()<CR>', {noremap = true, silent = true})

vim.keymap.set('n', 'saa', 'sa_', { remap = true })

vim.keymap.set({ 'n', 'x', 'o' }, ']4', function()
  require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, ']]', function()
  require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
end)

vim.keymap.set({ 'n', 'x', 'o' }, ']$', function()
  require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '][', function()
  require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
end)

vim.keymap.set({ 'n', 'x', 'o' }, '[4', function()
  require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[[', function()
  require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
end)

vim.keymap.set({ 'n', 'x', 'o' }, '[$', function()
  require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
end)
vim.keymap.set({ 'n', 'x', 'o' }, '[]', function()
  require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
end)


vim.keymap.set("i", "<Tab>", function()
    if require("luasnip").jumpable(1) then
        return "<Plug>luasnip-jump-next"
    else
        return "<Tab>"
    end
end, { silent = true, expr = true })

vim.keymap.set("i", "<S-Tab>", function() require("luasnip").jump(-1) end, { silent = true })

vim.keymap.set("s", "<Tab>", function() require("luasnip").jump(1) end, { silent = true })

vim.keymap.set("s", "<S-Tab>", function() require("luasnip").jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if require("luasnip").choice_active() then
        return "<Plug>luasnip-next-choice"
    else
        return "<C-E>"
    end
end, { silent = true, expr = true })
