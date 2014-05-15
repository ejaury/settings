if has('gui_running')
    colorscheme molokai
    " Reset max width warning color from .vimrc which needs to be done after
    " setting the colorscheme.
    hi ColorColumn guibg=#2C2D27
else
    colorscheme wombat256
endif

" Visual mode maps
vnoremap cc :s/^/\/\// <bar> let @/ = ""<CR>       " Comment block with //, then clear search highlight
vnoremap CC :s/^\/\///<CR>                         " Uncomment block that starts with //

let b:surround_{char2nr("c")} = "/*\r*/"
