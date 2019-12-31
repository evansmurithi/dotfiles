" load plugins
execute pathogen#infect()
call pathogen#helptags()

set nocompatible
syntax on
filetype off
filetype plugin indent on

let mapleader = ","

"
" Settings
"
set noerrorbells " No beeps and screen flashing
set number " Show line numbers
set backspace=indent,eol,start " Makes backspace key more powerful.
set showcmd " Show me what I'm typing
set showmode " Show current mode
set splitright " Split vertical windows right to the current windows
set splitbelow " Split horizontal windows below to the current windows
set encoding=utf-8 " Set default encoding to UTF-8
set laststatus=2 " Always display the status-bar
set ruler " Show the cursor position all the time

set noshowmatch " Do not show matching brackets by flickering
set noshowmode  " We show the mode with airline or lightline
set incsearch " Shows match while typing
set hlsearch " Highlight found searches
set ignorecase " Search case insensitive
set smartcase " ... but not when search pattern contains upper case characters
set ttyfast
set lazyredraw " Wait to redraw

set updatetime=100

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

" Make Vim to handle long lines nicely.
set wrap
set textwidth=79
set formatoptions=qrn1

set autoindent " Copy the indentation from the previous line
set complete-=i
set showmatch

set et
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab

" Folding
set foldenable " Enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested fold max
set foldmethod=indent " fold based on indent level

" Color scheme
syntax enable
let g:solarized_termcolors=256
let g:solarized_termtrans=1
set background=dark
colorscheme solarized

" TMUX
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"
" File type settings
"
au BufNewFile,BufRead *.yml,*.yaml setlocal expandtab ts=2 sw=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
au BufNewFile,BufRead *.md setlocal spell noet ts=4 sw=4
au BufNewFile,BufRead *.json setlocal expandtab ts=2 sw=2

"
" Plugin configs
"

" ==================== CtrlP ====================
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height = 10		" maxiumum height of match window
let g:ctrlp_switch_buffer = 'et'	" jump to a file if it's open already
let g:ctrlp_mruf_max=450 		" number of recently opened files
let g:ctrlp_max_files=0  		" do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" ==================== Fugitive ====================
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gb :Gblame<CR>

" =================== vim-airline ========================
let g:airline_theme='solarized_flood'

"==================== NerdTree ====================
" For toggling
nmap <C-n> :NERDTreeToggle<CR>
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ==================== delimitMate ====================
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
let g:delimitMate_expand_inside_quotes = 0
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
