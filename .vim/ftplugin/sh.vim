" Visual mode maps
vnoremap cc :s/^/#/ <bar> let @/ = ""<CR>       " Comment block with //, then clear search highlight
vnoremap CC :s/^#//<CR>                         " Uncomment block that starts with //
