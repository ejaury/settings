set nocompatible
colorscheme desert256

if has('gui_running')
    colorscheme wombat
    set guioptions-=T
    set guifont=Inconsolata\ Medium\ 10
endif

filetype plugin on
filetype indent on

set ignorecase
set smartcase
set number
set scrolloff=3
set wrap
set nobackup
set cursorline
set cino=l1,g0,t0
set autochdir
set clipboard=unnamed
set tags=tags
set autoindent
set smartindent 
set tabstop=4 expandtab
set shiftwidth=4
set softtabstop=4
set list listchars=tab:>-,trail:.
set textwidth=79
set showmatch
set showcmd
" Auto-format: numbered list, no autoformat if text > tw, don't break 1-letter
" word
set formatoptions+=nl1
set hlsearch
set matchtime=1
set undolevels=100
set backspace=2

" Ctags search path: look for tags in current directory, then work up the tree
" towards the root until one is found
set tags=./tags;/

" Show whitespaces as characters
" set list

" Highlight characters that go beyond 80-char limit
match ErrorMsg '\%>80v.\+'

syntax on
call pathogen#infect()

:noremap <silent> <S-j> <C-E>
:noremap <silent> <S-k> <C-Y>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"] 
" Close preview window after unfocus
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Taglist 
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40

" Build ctags db for C/C++
map <C-b><C-n> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" Build ctags db for python
map <C-b><C-p> :!ctags -R --languages=python .<CR>
" Build ctags db for sh
map <C-b><C-k> :!ctags -R --languages=sh .<CR>
" Toggle Taglist window
map <F4> :TlistToggle<CR>
" Resize windows to equal size
map <F5> :wincmd =<CR>

" Map w!! to save a file as a root
cmap w!! w !sudo tee >/dev/null %

" Visual mode maps
" ================
" Remove trailing white-space
vnoremap ff :s/[ ]*$//<CR>

" Comment block with #
vnoremap cc :s/^/#/<CR>
" Uncomment block that starts with #
vnoremap CC :s/^#//<CR>

" Set gnome-terminal title when opening a file
set title
autocmd BufRead * let &titlestring = expand("%:t") . " (" . expand("%:p:h") . ")"
