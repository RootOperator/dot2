set encoding=UTF-8
set termguicolors
set number
set relativenumber
set showbreak=+++
set hlsearch
set smartcase
set incsearch
filetype indent on
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set undolevels=1000
set backspace=indent,eol,start
set splitbelow
set clipboard=unnamedplus
set mouse=a
set guicursor=a:hor10

call plug#begin()
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdcommenter'
Plug 'raimondi/delimitmate'
Plug 'cespare/vim-toml'
Plug 'jiriks74/presence.nvim'

Plug 'rootoperator/true-zen.nvim'

Plug 'dhruvasagar/vim-table-mode'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'arzg/vim-rust-syntax-ext'
Plug 'mattn/webapi-vim'
Plug 'sainnhe/sonokai'
Plug 'lifepillar/vim-gruvbox8'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'pbrisbin/vim-colors-off'
Plug 'rebelot/kanagawa.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug 'nvim-neotest/nvim-nio'

Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'

" Completion framework:
Plug 'hrsh7th/nvim-cmp'

" LSP completion source:
Plug 'hrsh7th/cmp-nvim-lsp'

" Useful completion sources:
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'

Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'

Plug 'windwp/nvim-ts-autotag'

Plug 'tpope/vim-surround'
Plug 'nvim-telescope/telescope.nvim'
Plug 'norcalli/nvim-colorizer.lua'

Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
Plug 'nanozuki/tabby.nvim'

Plug 'kevinhwang91/promise-async'
Plug 'kevinhwang91/nvim-ufo'
call plug#end()


syntax on
let mapleader = '\'
"let g:ale_open_list = 1

let delimitMate_expand_cr = 1

let g:colors_off_a_little = 1

let g:gruvbox_filetype_hi_groups = 1
let g:gruvbox_plugin_hi_groups = 1

let g:closetag_filenames = '*.html,*.xhtml,*.vue'

let g:rust_clip_command = 'wl-copy'

au FileType html,vue let b:delimitMate_matchpairs = "(:),[:],{:}"

let g:vim_vue_plugin_config = { 
    \'syntax': {
    \   'template': ['html'],
    \   'script': ['javascript'],
    \   'style': ['css'],
    \},
    \'full_syntax': [],
    \'initial_indent': [],
    \'attribute': 1,
    \'keyword': 1,
    \'foldexpr': 0,
    \'debug': 0,
    \}

nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>
map <C-n> :NvimTreeToggle<CR>
map <C-t> :FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 <CR>
map <A-t> :FloatermToggle myfloat<CR>
tnoremap <A-t> <C-\><C-n> :FloatermToggle myfloat<CR>
tnoremap <A-n> <C-\><C-n> :FloatermNext<CR> 
nnoremap <S-j> 5j
nnoremap <S-k> 5k
vnoremap <S-j> 5j
vnoremap <S-k> 5k
map ZX :noh<CR>
map <C-m> <Plug>MarkdownPreviewToggle

" stuff
map <Leader>lp :lclose<CR>
map <Leader>ll :lopen<CR>
map <Leader>tm :TableModeToggle<CR>
map <Leader>st :ALEToggle<CR>
map <Leader>nn :lnext<CR>
map <Leader>pp :lprevious<CR>
map <Leader>ft :RustFmt<CR>
map <Leader>b :DapToggleBreakpoint<CR>
map <Leader>c :lua require'dap'.clear_breakpoints()<CR>
nmap <Leader>zn :TZNarrow<CR>
vmap <Leader>zn :'<,'>TZNarrow<CR>
nmap <leader>zf :TZFocus<CR>
nmap <leader>zm :TZMinimalist<CR>
nmap <leader>zz :TZAtaraxis<CR>
map <Leader>te :TabnineEnable<CR>
map <Leader>td :TabnineDisable<CR>
map <Leader>no :Neorg workspace notes<CR>
map <Leader>nr :Neorg return<CR>
map <Leader>nc :Neorg keybind all core.looking-glass.magnify-code-block<CR>
map <F5> :DapContinue<CR>
map <F10> :DapStepOver<CR>
map <F11> :DapStepInto<CR>
map <F12> :DapStepOut<CR>

"telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fn <cmd>Telescope treesitter<cr>
nnoremap <leader>fh <cmd>TodoTelescope<cr>


imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

set background=dark

autocmd InsertEnter,InsertLeave * set cul! "sets cursorline when entering Insert mode
autocmd QuitPre * if empty(&bt) | lclose | endif " Auto close loc list after asocicatet file is closed

if $TERM =~ 'xterm-256color'
    set noek
endif

" {{{lua
lua << EOF
-- TODO: unclutter

-- Welcome to unmanaged garbage :)

require("evil_lualine")
require("mason").setup()
require("mason-lspconfig").setup()
require("todo-comments").setup()
require("nvim-ts-autotag").setup()
require("dapui").setup()
require('colorizer').setup()
require('tabby').setup()



-- better folds
vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local handler = function(virtText, lnum, endLnum, width, truncate)
    local newVirtText = {}
    local suffix = (' 󰁂 %d '):format(endLnum - lnum)
    local sufWidth = vim.fn.strdisplaywidth(suffix)
    local targetWidth = width - sufWidth
    local curWidth = 0
    for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
        else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, {chunkText, hlGroup})
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
                suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
            end
            break
        end
        curWidth = curWidth + chunkWidth
    end
    table.insert(newVirtText, {suffix, 'MoreMsg'})
    return newVirtText
end

require('ufo').setup({
    fold_virt_text_handler = handler,
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
    ["rust_analyzer"] = function ()
        local rt = require("rust-tools")

        rt.setup({
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<C-x>", rt.hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        })
    end
}

require("true-zen").setup({
    modes = {
        ataraxis = {
            minimum_writing_area = {
                width = 120,
                height = 44,
            },
            padding = { -- padding windows
                left = 150,
                right = 52,
                top = 0,
                bottom = 0,
            },
            callbacks = { -- run functions when opening/closing Ataraxis mode
                open_pre = function () vim.cmd("UfoDisable") end,
                open_pos = nil,
                close_pre = nil,
                close_pos = function() vim.cmd("UfoEnable") end
           },
        },
    },

    integrations = {
        lualine = true
    },
})


--neorg 
require("neorg").setup({
    load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.export"] = {},
        ["core.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.dirman"] = {
            config = {
                workspaces = {
                    notes = "~/notes",
                }
            }
        },
    }
})


-- The setup config table shows all available config options with their default values:
require("presence").setup({
    -- General options
    auto_update         = true,
    neovim_image_text   = "Nvim",
    main_image          = "file",
    log_level           = nil,
    debounce_timeout    = 10,
    enable_line_number  = false,
    blacklist           = {"/home/rootoperator/notes"},
    buttons             = false,
    file_assets         = {},
    show_time           = true,

    -- Rich Presence text options
    editing_text        = "Editing %s",
    file_explorer_text  = "Browsing %s",
    git_commit_text     = "Committing changes",
    plugin_manager_text = "Managing plugins",
    reading_text        = "Reading %s",
    workspace_text      = "Working on %s",
    line_number_text    = "Line %s out of %s",
})

require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<C-Space>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
})

vim.cmd("TabnineDisable")

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

-- Completion Plugin Setup
local cmp = require'cmp'
cmp.setup({
-- Enable LSP snippets
    snippet = {
        expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
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
        { name = 'path' },                              -- file paths
        { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
        { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
        { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
        { name = 'buffer', keyword_length = 2 },        -- source current buffer
        { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip 
        { name = 'calc'},                               -- source for math calculation
        { name = 'neorg'},                              -- notes
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        fields = {'menu', 'abbr', 'kind'},
        format = function(entry, item)
        local menu_icon ={
            nvim_lsp = 'λ',
            vsnip = '⋗',
            buffer = 'Ω',
            path = '',
        }
        item.menu = menu_icon[entry.source.name]
        return item
        end,
    },
})

require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-s>"] = "select_vertical",
                ["<C-i>"] = "select_horizontal",
            },
            n = {
                ["s"] = "select_vertical",
                ["i"] = "select_horizontal",
            }
        }
    }
}


vim.opt.termguicolors = true

local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
    vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
    vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
    vim.keymap.set('n', 'u', api.tree.change_root_to_parent, opts('Up'))
end


local function open_nvim_tree(data)

  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  -- buffer is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

  -- only files please
  if not real_file and not no_name then
    return
  end

  -- open the tree but don't focus it
  require("nvim-tree.api").tree.toggle({ focus = false })
end


require("nvim-tree").setup {
    on_attach = my_on_attach,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
}

-- auto open nvimtree
-- vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- LSP Diagnostics Options Setup 
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


require('nvim-treesitter.configs').setup {
    ensure_installed = { "lua", "rust", "toml", "python", "cpp", "hyprlang" },
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting=true,
    },
    ident = { enable = true }, 
}


require('kanagawa').setup({
    undercurl = true,           -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,        -- do not set background color
    dimInactive = true,        -- dim inactive window `:h hl-NormalNC`
    globalStatus = false,       -- adjust window separators highlight for laststatus=3
    terminalColors = true,
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    },
    overrides = function(colors)
        local theme = colors.theme
        return {
            -- Assign a static color to strings
            String = { fg = colors.palette.carpYellow, italic = true },

            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = theme.ui.bg_p1 },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
            TelescopePreviewNormal = { bg = theme.ui.bg_dim },
            TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
        }
    end,
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    executable = {
        command = "/home/rootoperator/.local/share/nvim/mason/bin/codelldb",
        args = {"--port", "${port}"},
    }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            local t={}
            for str in string.gmatch(vim.fn.getcwd(), "([^/]+)") do 
              table.insert(t, str)
            end 

            return vim.fn.getcwd() .. '/' .. t[#t] 
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    }
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            local t={}
            for str in string.gmatch(vim.fn.getcwd(), "([^/]+)") do 
              table.insert(t, str)
            end 

            return vim.fn.getcwd() .. '/target/debug/' .. t[#t] 
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    }
}

dap.configurations.c = dap.configurations.cpp

vim.cmd("colorscheme kanagawa")
require('kanagawa.colors').setup()
EOF
" }}}
