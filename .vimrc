" Use Vim mode.
set nocompatible

" Enable modelines
set modeline

" Load the Vundle bundles.
source $HOME/.vundles.vim

" Enable file type detection, plugin loading, and indent settings loading.
filetype plugin indent on

" Enable syntax highlighting.
syntax enable
colorscheme elflord

" Hide buffers instead of closing them.
set hidden

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set title

" Make the backspace key work like it ought to.
set backspace=indent,eol,start

" Set the number of columns in a tab.
set tabstop=8
set softtabstop=4
" Set the number of columns per indentation level.
set shiftwidth=4
set shiftround
" Tab and indent operations insert spaces.
set smarttab
set expandtab

" Indentation.
set smartindent
set autoindent

" Do not wrap text.
"set nowrap
set wrap

" Break lines.
"set textwidth=79

" Set the number of lines to keep under/over cursor when scrolling.
set scrolloff=3
" Set the number of columns to scroll horizontally.
set sidescroll=10

" Don't beep.
set visualbell
set noerrorbells

" Use incremental search.
set incsearch
" Use case-insensitive searching.
set ignorecase
" Override 'ignorecase' if the search pattern contains upper case.
set smartcase

" Make Vim use sensible colors.
set background=dark

" Disable swap and backup files
set nobackup
set nowritebackup
set noswapfile

" Show matching parenthesis
set showmatch

" File/command completion options.
set wildmenu
set wildmode=list:longest

" Automatically reload unchanged files when changed outside of Vim.
set autoread

" Set the leader key.
let mapleader = ','
nnoremap , ,,

" Save the shift key.
nnoremap ; :

" Emacs bindings in command line mode.
"cnoremap <C-a> <home>
"cnoremap <C-e> <end>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Jump to next row in the editor, not the next line.
nnoremap j gj
nnoremap k gk

" Yank to the end of the current line
"nnoremap Y y$

" Format the current paragraph or selection.
"vmap Q gq
"nmap Q gqap

" Toggle spell checking.
nnoremap <silent> <leader>sp :set spell!<CR>
setlocal spelllang=en_us

" Auto format (indent) the entire file.
nnoremap <leader>af 1G=G

" Display the buffer list and ready the buffer command.
nnoremap <leader>b :ls<CR>:buffer<Space>

" Toggle line numbers.
nnoremap <silent> <leader>nn :set relativenumber!<CR>
inoremap <silent> <leader>nn <C-O>:set number!<CR>

function! NumberSwitch()
    if (&number)
        set relativenumber
    elseif (&relativenumber)
        set number
    endif
endfunc

autocmd! InsertEnter * :call NumberSwitch()
autocmd! InsertLeave * :call NumberSwitch()

" Start with line numbers on.
set relativenumber

" Use four (3 digits + 1 space)  columns when showing line numbers.
set numberwidth=4

" Toggle search highlighting.
nnoremap <silent> <leader>hl :set hlsearch!<CR>

" Toggle the NERD Tree.
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>

" Generate ctags and toggle the list.
nnoremap <silent> <leader>tl :TlistToggle<CR>

" Hopefully this will not ever backfire.
inoremap jj <Esc>

" Show the current buffer in hex mode.
nnoremap <leader>hx :%!xxd<CR> :set readonly<CR>
" Revert the current buffer to normal mode.
nnoremap <leader>xh :%!xxd -r<CR> :set noreadonly<CR>

" SuperTab
let g:SuperTabDefaultCompletionType='context'

" Syntastic
let g:syntastic_check_on_open=1
noremap <silent> <leader>eo :Errors<CR>  " Open the errors window.
noremap <silent> <leader>ec :lcl<CR>     " Close the errors window.

" Powerline
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols='fancy'

" !Powerline
set statusline=%t                               " tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, " file encoding
set statusline+=%{&ff}]                         " file format
set statusline+=%h                              " help file flag
set statusline+=%m                              " modified flag
set statusline+=%r                              " read-only flag
set statusline+=%y                              " filetype
set statusline+=%=                              " left/right separator
set statusline+=%c,                             " cursor column
set statusline+=%l/%L                           " cursor line/total lines
set statusline+=\ %P                            " percentage through file

" ctrlp options
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(o|exe|so|dll|lob)$'
  \ }

let g:ctrlp_working_path_mode = 'a' " Start in the current working directory

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

