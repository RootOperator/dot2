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
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.guicursor= "a:hor10"
vim.opt.scrolloff = 10
vim.opt.swapfile = false

vim.g.vim_svelte_plugin_use_typescript = 1
vim.g.rust_clip_command = 'wl-copy'

vim.api.nvim_create_autocmd({"BufWinEnter", "BufRead"}, {
  pattern = {"*/doc/*", "man://*"},
  callback = function()
    vim.cmd("wincmd L")
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "quiet",
  callback = function()
    vim.api.nvim_set_hl(0, 'Pmenu', { fg = '#ffffff', bg = '#1c1c1c' })
    vim.api.nvim_set_hl(0, 'PmenuSel', { fg = '#000000', bg = '#808080' })

    vim.api.nvim_set_hl(0, 'MatchParen', {
      fg = '#e8a004',
    })
  end
})

local function set_terminal_bg(color_code)
  local is_tmux = os.getenv("TMUX") ~= nil
  local sequence

  if color_code then
    sequence = string.format("\027]11;%s\007", color_code)
  else
    sequence = "\027]111\007"
  end

  if is_tmux then
    sequence = sequence:gsub("\027", "\027\027")
    sequence = "\027Ptmux;" .. sequence .. "\027\\"
  end

  io.write(sequence)
end

vim.api.nvim_create_autocmd({ "UIEnter", "ColorScheme" }, {
  callback = function()
    local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
    if normal.bg then
      set_terminal_bg(string.format("#%06x", normal.bg))
    end
  end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    set_terminal_bg(nil)
  end,
})

vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
        vim.opt.cursorline = true
    end,
})

vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        vim.opt.cursorline = false
        MiniTrailspace.trim()
        MiniTrailspace.trim_last_lines()
    end,
})

vim.api.nvim_create_autocmd('VimLeave', {
    command = 'set guicursor=a:block100,a:blinkon100-blinkoff50',
})

require("config.lazy")
require("keybinds")
require("luasnip.loaders.from_snipmate").load()

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
    elseif hour >= 18 or hour <= 8 then
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
    virtual_text = {
        prefix = '■',
        source = "if_many"
    },
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

vim.cmd(string.format("colorscheme %s", get_colorscheme()))
