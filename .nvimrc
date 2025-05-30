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


syntax on

let g:colors_off_a_little = 1

let g:closetag_filenames = '*.html,*.xhtml,*.vue,*.svelte'

let g:rust_clip_command = 'wl-copy'

let g:vim_svelte_plugin_use_typescript= 1

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
imap <C-BS> <C-W>
nnoremap <C-h> :tabm -1<CR>
nnoremap <C-l> :tabm +1<CR>
nnoremap <A-j> :tabprevious<CR>
nnoremap <A-k> :tabnext<CR>
"map <C-n> :NvimTreeToggle<CR>
map <C-t> :FloatermNew --name=myfloat --height=0.8 --width=0.7 --autoclose=2 <CR>
map <A-t> :FloatermToggle myfloat<CR>
tnoremap <A-t> <C-\><C-n> :FloatermToggle myfloat<CR>
tnoremap <A-n> <C-\><C-n> :FloatermNext<CR>
nnoremap <S-j> 5j
nnoremap <S-k> 5k
vnoremap <S-j> 5j
vnoremap <S-k> 5k
nnoremap <S-h> b
nnoremap <S-l> w
vnoremap <S-h> b
vnoremap <S-l> w

nnoremap <C-S-j> :m .+1<CR>==
nnoremap <C-S-k> :m .-2<CR>==
inoremap <C-S-k> <Esc>:m .-2<CR>==gi
inoremap <C-S-j> <Esc>:m .+1<CR>==gi
vnoremap <C-S-j> :m '>+1<CR>gv=gv
vnoremap <C-S-k> :m '<-2<CR>gv=gv

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

autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
autocmd QuitPre * if empty(&bt) | lclose | endif " Auto close loc list after asocicatet file is closed

if $TERM =~ 'xterm-256color'
    set noek
endif
