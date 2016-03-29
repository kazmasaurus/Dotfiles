
" Movement {{{
" Up and down navigate across desplayed lines, as god intended.
" Using `nnoremap` because: http://learnvimscriptthehardway.stevelosh.com/chapters/05.html
nnoremap <up> gk
nnoremap <down> gj

" Let's us use arrow keys to select stuff.
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" Let character left/right movements wrap to the next line.
set whichwrap+=<,>,h,l,[,] 

set backspace=indent,eol,start  " Make backspace work as you would expect.
" }}}

" Code Indentation {{{
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
" }}}

" Vimscript file settings {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Visual Code {{{
syntax on                  " Enable syntax highlighting.
set display  =lastline     " Show as much as possible of the last line.
set cursorline             " Find the current line quickly.

set incsearch              " Highlight while searching with / or ?.
set hlsearch               " Keep matches highlighted.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

}}}

" Visual Display {{{
set display  =lastline     " Show as much as possible of the last line.
set showcmd                " Show already typed keys when more are expected.
set showmode               " Show current mode in command-line.

set report      =0         " Always report changed lines.
}}}

" Splits {{{
set splitright             " Open new windows right of the current window.
set splitbelow             " Open new windows below the current window.
}}}

" Other unarganized stuff from the vim-galore minimal-vimrc {{{
filetype plugin indent on  " Load plugins according to detected filetype.

set hidden                 " Switch between buffers without having to save first.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set wrapscan               " Searches wrap around end-of-file.
}}}

" Fish Compatability {{{
" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif
}}}

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
"set backup
"set backupdir   =$HOME/.vim/files/backup/
"set backupext   =-vimbackup
"set backupskip  =
"set directory   =$HOME/.vim/files/swap//
"set updatecount =100
"set undofile
"set undodir     =$HOME/.vim/files/undo/
"set viminfo     ='100,n$HOME/.vim/files/info/viminfo

