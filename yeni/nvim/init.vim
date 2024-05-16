call plug#begin()
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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

noremap  <silent> <C-b>      :CHADopen<CR>
vnoremap <silent> <C-b> <C-C>:CHADopen<CR>
inoremap <silent> <C-b> <C-O>:CHADopen<CR>

noremap  <silent> <C-S>      :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

noremap  <silent> <C-Q>      :q<CR>
vnoremap <silent> <C-Q> <C-C>:q<CR>
inoremap <silent> <C-Q> <C-O>:q<CR>

noremap  <silent> <C-t>      :tabnew<CR>
vnoremap <silent> <C-t> <C-C>:tabnew<CR>
inoremap <silent> <C-t> <C-O>:tabnew<CR>

noremap  <silent> <C-w>      :vsplit<CR>
vnoremap <silent> <C-w> <C-C>:vsplit<CR>
inoremap <silent> <C-w> <C-O>:vsplit<CR>

noremap  <silent> <C-e>      :split h<CR>
vnoremap <silent> <C-e> <C-C>:split h<CR>
inoremap <silent> <C-e> <C-O>:split h<CR>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
hi Pmenu ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black"

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
