
" Plugins {{{
call plug#begin()

" Reference: https://github.com/junegunn/vim-plug

" Themes
Plug 'altercation/vim-colors-solarized'

" Other display stuff
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_color_change_percent=1

" Editing tools
Plug 'thirtythreeforty/lessspace.vim'
Plug 'scrooloose/nerdcommenter'
nnoremap <D-/> <leader>c<space>
inoremap <D-/> <leader>c<space>
vnoremap <D-/> <leader>c<space>

" Navigation
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
noremap <D-R> :CtrlP<CR>

let g:ctrlp_prompt_mappings = {
    \ 'PrtDeleteWord()': ['<c-w>', '<m-bs>', '<c-bs>'],
    \ 'PrtClear()': ['<c-w>', '<d-bs>']
    \ }

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
noremap <D-1> :NERDTreeToggle<CR>

" Syntax
Plug 'keith/swift.vim', { 'for': 'swift' }
Plug 'in3d/vim-raml', { 'for': 'raml' }

call plug#end()
" }}}

" Movement {{{
" Up and down navigate across desplayed lines, as god intended.
" Using `nnoremap` because: http://learnvimscriptthehardway.stevelosh.com/chapters/05.html
nnoremap <up> gk
nnoremap <down> gj
inoremap <up> <C-o>gk
inoremap <down> <C-o>gj

" Let's us use arrow keys to select stuff.
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" Let character left/right movements wrap to the next line.
set whichwrap+=<,>,h,l,[,]

set backspace=indent,eol,start  " Make backspace work as you would expect.

cnoremap <a-bs> <c-w>
cnoremap <d-bs> <c-u>
" }}}

" Code Indentation {{{
set autoindent             " Indent according to previous line.
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
" }}}

" Code Folding {{{
set foldmethod=indent
set foldlevelstart=99
" }}}

" Visual Code {{{
syntax on                  " Enable syntax highlighting.
set display  =lastline     " Show as much as possible of the last line.
set cursorline             " Find the current line quickly.

if has('gui_running')
    colorscheme solarized
    set background=dark
endif

set incsearch              " Highlight while searching with / or ?.

set list                   " Show non-printable characters.
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

if has('gui_running')
    set guifont=Source\ Code\ Pro:h12
endif
" }}}

" Visual Display {{{
set display =lastline   " Show as much as possible of the last line.
set showcmd             " Show already typed keys when more are expected.
set showmode            " Show current mode in command-line.

set report=0            " Always report changed lines.

set number              " Display current line number
set relativenumber      " Use relative line numbers

set ruler               " Display cursor location
" }}}

" Splits {{{
set splitright             " Open new windows right of the current window.
set splitbelow             " Open new windows below the current window.
" }}}

" Other unarganized stuff from the vim-galore minimal-vimrc {{{
filetype plugin indent on  " Load plugins according to detected filetype.

set hidden                 " Switch between buffers without having to save first.

set ttyfast                " Faster redrawing.
set lazyredraw             " Only redraw when necessary.

set wrapscan               " Searches wrap around end-of-file.
" }}}

" Fish Compatability {{{
" The fish shell is not very compatible to other shells and unexpectedly
" breaks things that use 'shell'.
if &shell =~# 'fish$'
  set shell=/bin/bash
endif
" }}}

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

