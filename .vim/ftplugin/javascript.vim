if has('gui_running')
    colorscheme molokai
    " Reset max width warning color from .vimrc which needs to be done after
    " setting the colorscheme.
    hi ColorColumn guibg=#2C2D27
else
    "Only set reset colorscheme when this JS file is the first file in the
    "buffer. This is avoid unexpected change of colorscheme when opening
    "another file with different type in the same Vim instance.
    if g:colors_name != "darkburn" && bufnr('$') == 1
        "colorscheme wombat256
        colorscheme darkburn
    endif
endif

" Visual mode maps
vnoremap cc :s/^/\/\// <bar> let @/ = ""<CR>       " Comment block with //, then clear search highlight
vnoremap CC :s/^\/\///<CR>                         " Uncomment block that starts with //

let b:surround_{char2nr("c")} = "/*\r*/"

abbr rem // TODO: REMOVE
