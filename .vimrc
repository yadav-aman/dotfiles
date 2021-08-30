syntax on

set nocompatible 
set tabstop=4 softtabstop=4
set shiftwidth=4
set noerrorbells
set expandtab
set smartindent 
" above line will also indent the code pasted from clipboard so to avoid that use F3 to toggle paste
set pastetoggle=<F3>
" will display relative numbers to easily move between lines
set relativenumber
set number
set incsearch
set nowrap
" show matching braces
set showmatch
" make search case insensitive when all in lowercase but becomes case sensitive if
" search contains capital letter
set smartcase
set ignorecase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set encoding=utf-8 
"light line
set laststatus=2
" This will mark extra whitespace as bad and probably color it red.
"au BufRead, BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgreen

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Plugin Manager
Plugin 'VundleVim/Vundle.vim'
"colour scheme
Plugin 'morhetz/gruvbox'
"grep for vim
Plugin 'jremmen/vim-ripgrep' 
"Plugin 'vim-utils/vim-man' "man page
"file finding
Plugin 'https://github.com/ctrlpvim/ctrlp.vim.git' 
"Auto complete
Plugin 'https://github.com/ycm-core/YouCompleteMe.git' 
"Undo tree
Plugin 'mbbill/undotree'
"Replace status line
Plugin 'itchyny/lightline.vim' 
"Nerd tree
Plugin 'preservim/nerdtree' 
call vundle#end()
filetype plugin indent on

colorscheme gruvbox
" more colour themes at /usr/share/vim/vim81/colors/
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader = " "
"ctrl_p
let g:ctrlp_user_command = ['.git','git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0
" nerd tree 
"in NERDTree, to open file in newtab with Enter
let NERDTreeMapOpenInTab='<TAB>'
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
"file tree - no need as we have installed nerd tree
"nnoremap <silent> <Leader>ft :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
"prevent vim to open in replace mode
nnoremap <esc>^[ <esc>^[  
"redo
nnoremap <leader>r <C-R>
nnoremap <leader>wq :wq<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qall
" Toggle Relative number
nnoremap <silent> <leader>rn :set relativenumber!<CR>
imap jk <Esc>
let g:ycm_autoclose_preview_window_after_completion=1
"Go to definition
nnoremap <silent> <Leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR> 
" go to the end of the line
nnoremap <Leader>e $
nnoremap <Leader>b ^
nnoremap <leader>te :tabedit 
" Switch between tabs
nnoremap <Leader>1 1gt
nnoremap <Leader>2 2gt
nnoremap <Leader>3 3gt
nnoremap <Leader>4 4gt
nnoremap <Leader>5 5gt
nnoremap <Leader>6 6gt
nnoremap <Leader>7 7gt
nnoremap <Leader>8 8gt
nnoremap <Leader>9 9gt
noremap <Leader>tN :tabnew<CR>
"noremap <Leader>tc :tabclose<CR>
noremap <Leader>tm :tabmove<CR>
noremap <Leader>tn :tabnext<CR>
noremap <Leader>tp :tabprevious<CR>
"select untill next new line 
nnoremap sb {v}
" build cpp files 
autocmd filetype cpp nnoremap <F5> :wall <bar> !g++ %<CR> l
"autocmd filetype cpp nnoremap <F5> :wall <bar> !g++ % && ./a.out < input.txt > output.txt<CR> l
set autoread
" bracket auto complete
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" insert code snippets
command -nargs=1 CODEINSERT :r /mnt/c/Users/AMAN\ YADAV/Desktop/Nuclear\ Codes/Codes/codeforces-helper/codeSegments/<args>
nnoremap <Leader>ci :CODEINSERT 
