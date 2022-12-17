call plug#begin()

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/syntastic'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

set number
set encoding=UTF-8
set mouse=a

nmap <C-t> :colorscheme desert<CR>
nmap <C-y> :colorscheme elflord<CR>

nmap <F9> :PlugInstall<CR>
nmap <F10> :PlugClean<CR>
nmap <F11> :PlugUpdate<CR>

nmap <C-b> :NERDTreeToggle<CR>

nmap <F3> :set number<CR>
nmap <F4> :set nonumber<CR>

nmap <C-f> :Lines<CR>

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

nmap <C-e> :tabnew<CR>
nmap <C-w> :tabclose<CR>
nnoremap <S-E> :tabf<CR>
nmap <C-z> u

noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

noremap <silent> <C-Q> :q<CR>
vnoremap <silent> <C-Q> <C-C>:q<CR>
inoremap <silent> <C-Q> <C-O>:q<CR>

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
hi Pmenu        ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black

imap <F5> <Esc> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
