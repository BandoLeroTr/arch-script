call plug#begin()
"Plug 'ThePrimeagen/vim-be-good'
Plug 'yamatsum/nvim-nonicons'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'https://github.com/adelarsq/image_preview.nvim'
Plug 'samodostal/image.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'editorconfig/editorconfig-vim'

"Plug 'nvim-lua/plenary.nvim'"
"Plug 'pacha/vem-tabline'
"Plug 'ap/vim-buftabline'
Plug 'mg979/vim-xtabline'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim',
Plug 'terryma/vim-multiple-cursors'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }"
"Plug 'junegunn/fzf.vim'"
"
Plug 'yggdroot/indentline'
"Plug 'lukas-reineke/indent-blankline.nvim'"
Plug 'chiel92/vim-autoformat'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'weilbith/nvim-code-action-menu'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'folke/tokyonight.nvim', { 'branch': 'main' }"
Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'Abstract-IDE/Abstract-cs'

"Plug 'farfanoide/vim-kivy'"
""Plug 'kivy/kivy'"

"Plug 'valloric/youcompleteme'"

Plug 'honza/vim-snippets'
Plug 'cj/vim-webdevicons'
Plug 'tpope/vim-projectionist'
Plug 'chun-yang/auto-pairs'
Plug 'iamcco/coc-flutter'
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
Plug 'raimondi/delimitmate'
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'
Plug 'natebosch/vim-lsc'
Plug 'sheerun/vim-polyglot'
"Plug 'natebosch/vim-lsc-dart'"
Plug 'natebosch/dartlang-snippets'

Plug 'reisub0/hot-reload.vim'

Plug 'docunext/closetag.vim'
Plug 'pangloss/vim-javascript'
Plug 'neoclide/coc-css'

Plug 'elzr/vim-json'
call plug#end()

let g:pymode_rope = 0
set cursorline
set cursorcolumn
set nocompatible
set number
set encoding=UTF-8
set mouse=a
set guicursor=i:block
set softtabstop=4
filetype on
syntax on

vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

colorscheme abscs

nnoremap <S-up> <c-w>k   
nnoremap <S-down> <c-w>j
nnoremap <S-left> <c-w>h
nnoremap <S-right> <c-w>l

augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
    highlight CursorLine   guibg=#0b1c23
    highlight CursorColumn guibg=#0b1c23
augroup END

inoremap <S-Tab> <C-d>

noremap <Tab> >>
noremap <S-Tab> <<

noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

nmap <F9>  :PlugInstall<CR>
nmap <F10> :PlugClean<CR>

noremap  <silent> <C-d>      :CodeActionMenu<CR>
vnoremap <silent> <C-d> <C-C>:CodeActionMenu<CR>
inoremap <silent> <C-d> <C-O>:CodeActionMenu<CR>

noremap  <silent> <C-b>      :CHADopen<CR>
vnoremap <silent> <C-b> <C-C>:CHADopen<CR>
inoremap <silent> <C-b> <C-O>:CHADopen<CR>

noremap  <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

noremap  <silent> <C-Q>      :q<CR>
vnoremap <silent> <C-Q> <C-C>:q<CR>
inoremap <silent> <C-Q> <C-O>:q<CR>

noremap  <silent> <Esc>      :q!<CR>
vnoremap <silent> <Esc> <C-C>:q!<CR>
inoremap <silent> <Esc> <C-O>:q!<CR>

noremap  <silent> <C-t>      :tabnew<CR>
vnoremap <silent> <C-t> <C-C>:tabnew<CR>
inoremap <silent> <C-t> <C-O>:tabnew<CR>

noremap  <silent> <C-w>      :vsplit<CR>
vnoremap <silent> <C-w> <C-C>:vsplit<CR>
inoremap <silent> <C-w> <C-O>:vsplit<CR>

noremap  <silent> <C-e>      :split h<CR>
vnoremap <silent> <C-e> <C-C>:split h<CR>
inoremap <silent> <C-e> <C-O>:split h<CR>

noremap  <silent> <C-f>      :Telescope find_files<CR>
vnoremap <silent> <C-f> <C-C>:Telescope find_files<CR>
inoremap <silent> <C-f> <C-O>:Telescope find_files<CR>

noremap  <silent> <F5>      :Telescope colorscheme<CR>
vnoremap <silent> <F5> <C-C>:Telescope colorscheme<CR>
inoremap <silent> <F5> <C-O>:Telescope colorscheme<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
hi Pmenu ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black"

noremap  <silent> <Esc> <C-c>     :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
vnoremap <silent> <Esc> <C-C><C-c>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
inoremap <silent> <Esc> <C-O><C-c>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"noremap  <silent> <Esc> <C-c>     :w<CR>:exec '!dart' shellescape(@%,1)<CR>"
"vnoremap <silent> <Esc> <C-C><C-c>:w<CR>:exec '!dart' shellescape(@%,1)<CR>"
"inoremap <silent> <Esc> <C-O><C-c>:w<CR>:exec'!dart'"shellescape(@%,"1)<CR>"

noremap  <silent> <F8>      :r/home/bandolero/state.dart<CR>
vnoremap <silent> <F8> <C-C>:r/home/bandolero/state.dart<CR>
inoremap <silent> <F8> <C-O>:r/home/bandolero/state.dart<CR>

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

noremap  <silent> <F4>      :call Number()<CR>
vnoremap <silent> <F4> <C-C>:call Number()<CR>
inoremap <silent> <F4> <C-O>:call Number()<CR>

let g:indentLine_char_list = ["|"]

function Number()
    if (&number)
        setlocal nonumber
        echo "nonumber"
    else
        set number
        echo "number"
    endif
endfunction


"let g:airline#extensions#tabline#enabled = 1
