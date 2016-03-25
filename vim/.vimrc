
" Map Ctrl-Backspace to delete the previous word in insert mode.
:imap <C-BS> <C-W>

" Let's us use arrow keys to select stuff.
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" Let character left/right movements wrap to the next line.
set whichwrap+=<,>,h,l,[,]

