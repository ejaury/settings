" Visual mode maps
vnoremap cc :s/^/\/\// <bar> let @/ = ""<CR>       " Comment block with //, then clear search highlight
vnoremap CC :s/^\/\///<CR>                         " Uncomment block that starts with //

abbr doc // TODO: add doc
abbr mv // TODO: MOVE
abbr rev // TODO: REVERT
abbr rem // TODO: REMOVE
abbr tt // TODO: TEST
