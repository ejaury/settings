set nocompatible
colorscheme desert256

if has('gui_running')
    colorscheme desert
    set guioptions-=T
    set guioptions-=a   " I don't want to auto-copy selection
    set guifont=Ubuntu\ Mono\ 10,Inconsolata\ Medium\ 10
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

syntax on
call pathogen#infect()


" Highlight characters: Warn when past 79 chars, Error when past 99 chars
if has('gui_running')
    " Show warning (at 80) and max width markers (at 100)
    let &colorcolumn="80,".join(range(100,400),",")
    hi ColorColumn guibg=#2C2D27
else
    " Set warning highlight
    hi Warn80 ctermfg=darkyellow
    :au BufWinEnter * let w:m1=matchadd('Warn80', '\%<101v.\%>80v', -1)
    " Show max width marker
    set colorcolumn=100
    hi ColorColumn ctermbg=3
endif


" CtrlP for fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim

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

" Tagbar
let tagbar_left = 1


:noremap <silent> <S-j> <C-E>
:noremap <silent> <S-k> <C-Y>

map <C-b><C-n> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>     " Build ctags db for C/C++
map <C-b><C-p> :!ctags -R --languages=python,javascript,js .<CR>            " Build ctags db for python & js
map <C-b><C-k> :!ctags -R --languages=sh .<CR>                              " Build ctags db for sh

map <F3> :NERDTreeToggle<CR>            " NerdTree toggle
map <F4> :TagbarToggle<CR>              " Toggle Tagbar window
"map <F4> :TlistToggle<CR>
map <F5> :wincmd =<CR>                  " Resize windows to equal size
map <silent><A-Right> :tabnext<CR>      " map Alt-RightArrow to jump to the next tab
map <silent><A-Left> :tabprevious<CR>   " map Alt-LeftArrow to jump to the previous tab
nnoremap <leader>. :CtrlPTag<cr>        " CtrlP search for tags

" Map w!! to save a file as a root
cmap w!! w !sudo tee >/dev/null %

" Set gnome-terminal title when opening a file
set title
autocmd BufRead * let &titlestring = expand("%:t") . " (" . expand("%:p:h") . ")"

" vim-indent-guides settings
"let indent_guides_enable_on_vim_startup = 1
let indent_guides_start_level = 2
let indent_guides_guide_size = 1

" Visual mode maps
" ================
" Remove trailing white-space
vnoremap ff :s/[ ]*$//<CR>

" Comment block with #
vnoremap cc :s/^/#/<CR>
" Uncomment block that starts with #
vnoremap CC :s/^#//<CR>
