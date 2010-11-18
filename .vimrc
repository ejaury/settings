set nocompatible
colorscheme desert256

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
set textwidth=80
set showmatch
set showcmd
" Auto-format: numbered list, no autoformat if text > tw, don't break 1-letter
" word
set formatoptions+=nl1
set nohlsearch
set matchtime=1
set undolevels=100
set backspace=2

" Highlight characters that go beyond 80-char limit
match ErrorMsg '\%>80v.\+'

syntax on

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
" Toggle Taglist window
map <F4> :TlistToggle<CR>
