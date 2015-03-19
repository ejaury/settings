" Visual mode maps
vnoremap cc :s/^/#/ <bar> let @/ = ""<CR>       " Comment block with #, then clear search highlight
vnoremap CC :s/^#//<CR>                         " Uncomment block that starts with #

" Auto-complete (complete with Space or Enter)
abbr cl class
abbr fo forms
abbr mo models
abbr ob objects
abbr pd import ipdb; ipdb.set_trace()
abbr pu import pudb; pudb.set_trace()
abbr doc # TODO: add doc
abbr mv # TODO: MOVE
abbr rem # TODO: REMOVE
abbr rev # TODO: REVERT
abbr tt # TODO: TEST
abbr ut # TODO: Add a unit test

let b:surround_{char2nr("c")} = "'''\r'''"
