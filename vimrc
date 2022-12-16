call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'neoclide/jsonc.vim'"
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}



call plug#end()

set number
set encoding=UTF-8
set mouse=a


nmap <C-t> :colorscheme desert<CR>

nmap <F9> :PlugInstall<CR>
nmap <F10> :PlugClean<CR>

nmap <F5> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '->'
let g:NERDTreeDirArrowCollapsible = '-'

nmap <F3> :set number<CR>
nmap <F4> :set nonumber<CR>

nmap <C-f> :Lines<CR>

nmap <C-y> :colorscheme elflord<CR>

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

nmap <C-e> :tabnew<CR>
nmap <C-w> :tabclose<CR>
nmap <Tab> :tabn<CR>
nnoremap <S-E> :tabf<CR>

nmap <C-s> :w<CR>
nmap <C-q> :q<CR>
nmap <ESC> :q!<CR>
