set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" One that starts it all
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'docunext/closetag.vim'
Plugin 'bling/vim-airline'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'

" Syntax plugins
Plugin 'flazz/vim-colorschemes'
Plugin 'klen/python-mode'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-markdown'
" Use the community driven JSHint instead:
" http://stackoverflow.com/a/5893447/289256
"Plugin 'wookiehangover/jshint.vim'

call vundle#end()

set background=dark

if has('gui_running')
    colorscheme desert  " Other nice ones: wombat, codeschool
    set guioptions-=T
    set guioptions-=a   " I don't want to auto-copy selection
    set guifont=Ubuntu\ Mono\ 10,Inconsolata\ Medium\ 10
else
    " Set gnome-terminal title when opening a file
    set title
    autocmd BufRead * let &titlestring = expand("%:t") . " (" . expand("%:p:h") . ")"
    colorscheme desert256
endif

filetype plugin indent on
syntax on

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
set formatoptions+=nl1t
set hlsearch
set matchtime=1
set undolevels=100
set backspace=2

" Ctags search path: look for tags in current directory, then work up the tree
" towards the root until one is found
set tags=./tags;/

" Enable closetag.vim
autocmd FileType html,htmldjango let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango, source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

" Show whitespaces as characters
" set list

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

:noremap <silent> <S-j> <C-E>
:noremap <silent> <S-k> <C-Y>

map <C-b><C-n> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>     " Build ctags db for C/C++
map <C-b><C-p> :!ctags -R --languages=python,javascript,js .<CR>            " Build ctags db for python & js
map <C-b><C-k> :!ctags -R --languages=sh .<CR>                              " Build ctags db for sh

map <F3> :NERDTreeToggle<CR>                    " NerdTree toggle
map <F4> :TagbarToggle <bar> :wincmd =<CR>      " Toggle Tagbar window
map <F6> :wincmd =<CR>                          " Resize windows to equal size
map <F8> :TlistToggle <bar> :wincmd =<CR>       " Toggle TagList window
map <silent><A-Right> :tabnext<CR>              " map Alt-RightArrow to jump to the next tab
map <silent><A-Left> :tabprevious<CR>           " map Alt-LeftArrow to jump to the previous tab

" Visual mode maps
" ================
vnoremap ff :s/[ ]*$//<CR>                      " Remove trailing white-space

" Map w!! to save a file as a root
cmap w!! w !sudo tee >/dev/null %

" CtrlP for fuzzy search
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|svn)$',
    \ 'file': '\v\~$|\.(o|so|swp|pyc)$|tags$|cscope.+$',
    \ }
nmap ; :CtrlPBuffer<CR>
nnoremap <leader>f :CtrlP<cr>                   " CtrlP search for files
nnoremap <leader>. :CtrlPTag<cr>                " CtrlP search for tags

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

" Syntastic
" Passive filter for Python for now as it's too slow using pylint. Let
" python-mode handle the linting with pyflakes.
let g:syntastic_mode_map = { "mode": "active",
                            \ "passive_filetypes": ["python"] }

" Taglist 
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40

" Tagbar
let tagbar_left = 1

" vim-indent-guides settings
"let indent_guides_enable_on_vim_startup = 1
let indent_guides_start_level = 2
let indent_guides_guide_size = 1

" vim-airline
set laststatus=2

" python-mode
let g:pymode_folding = 0
let g:pymode_lint_cwindow = 0           " This lint slows vim down over time. Use plain pyflake
let g:pymode_trim_whitespaces = 0
let g:pymode_lint_ignore = "E501"       " Ignore this error so more important error takes precedence
let g:pymode_rope = 0                   " Causing a bug with cursor moved when typing period

" Cscope
" Auto-load CScope database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()

" Local vim config
if filereadable(glob("~/.vimrclocal"))
    source ~/.vimrclocal
endif
