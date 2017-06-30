" Sane defaults 
set nocompatible
set modelines=0
set encoding=utf-8
set ttyfast
" So vim-airline appears all the time
set laststatus=2
" Line number at the current line, relative numbers elsewhere
set number
set relativenumber  
set undofile
" For vim-indent-guides
set ts=2 sw=2 et
" Highlights all search results
set hlsearch
" Enhanced command-line completion
set wildmenu
set wildmode=longest:full,full
set ignorecase
set smartcase
set showmatch
set hlsearch

" Change the leader key to spacebar
noremap <Space> <Nop>
let mapleader="\<Space>"

syntax enable
colorscheme gruvbox
set background=dark
" Automatically populates the g:airline_symbols dictionary with powerline
" symbols
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
" CtrlP
let g:ctrlp_match_window = 'results:100' " overcome limit imposed by max height
" Remap ranger.vim from <leader>f to -
let g:ranger_map_keys = 0

" Highlights characters beyond column 80
match ErrorMsg '\%>80v.\+'

" Use vim-plug (junegunn/vim-plug) as the plugin manager
" The string in single quotes is the directory for the plugins 
call plug#begin('~/.vim/plugged')

" This shorthand notation fetches http://github.com/X/Y
" Plug 'X/Y'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sheerun/vim-polyglot'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-ragtag'
Plug 'francoiscabrol/ranger.vim'

call plug#end()

" Disable arrow keys for now to force hjkl movement
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Move by screen line instead of file line
nnoremap j gj
nnoremap k gk

" Tab to move around matching bracket pairs in normal/visual mode
nnoremap <tab> %
vnoremap <tab> %

" Insert newline after cur line by pressing Enter (Shift+Enter inserts before
" the current line
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Add shortcuts for easy buffer navigation
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Ranger.vim mapping
nmap - :Ranger<CR> 

" Close current buffer
nmap <F6> :bd<CR>

" Open a new empty buffer
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>
nmap <F8> :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>
nmap <F7> :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>lb :ls<CR>

" Add a bind for save all open buffers
nmap <F9> :wa<CR>

" Add bindings for selection/clipboard buffer copy-pasting
noremap <Leader>Y "*y
noremap <Leader>P "*p
noremap <Leader>y "+y
noremap <Leader>p "+p

" CtrlP keybinds
nmap <leader>bf :CtrlP<cr>
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" % to match do/end combos and others in ruby files
runtime macros/matchit.vim

" CtrlP show all files in a dir
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" Autorun vim-indent-guides on startup
" disable by pressing <leader>ig
autocmd VimEnter * IndentGuidesEnable
