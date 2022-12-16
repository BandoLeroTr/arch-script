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

set number                                    "satır numarası"
set encoding=UTF-8
set mouse=a                                   "vim içinde mouse kullanma"

nmap <C-t> :colorscheme desert<CR>
nmap <C-y> :colorscheme elflord<CR>

nmap <F9> :PlugInstall<CR>                    "plugin yükleme"
nmap <F10> :PlugClean<CR>                     "plugin kaldırma"

nmap <C-b> :NERDTreeToggle<CR>                 "ekranın sol tarafında klasör ve dosyaları görme"

nmap <F3> :set number<CR>                     "satır numaralarını açar"
nmap <F4> :set nonumber<CR>                   "satır numaralarını kapar"

nmap <C-f> :Lines<CR>                         "fzf ile vim içinde sayı ve kelime aratma"

nnoremap <S-Tab> <<                           "kelimeyi bir tab sağa kaydırma"
inoremap <S-Tab> <C-d>                        "kelimeyi bir tab sola kaydırma"

nmap <C-e> :tabnew<CR>                        "vim içinde yeni sayfa açma"
nmap <C-w> :tabclose<CR>                      "açılan sayfayı kapatma"
nmap <Tab> :tabn<CR>                          "sayfalar arasında tab tuşu ile geçiş yapma. mouse ile de geçiş yapılabiliyor"
nnoremap <S-E> :tabf<CR>
nmap <C-z> u                                  "geri al"
nmap <C-s> :w<CR>                             "sayfayı kaydeder"
nmap <C-q> :q<CR>                             "sayfa daha önceden kaydedilmişse çıkar"
nmap <ESC> :q!<CR>                            "kaydetmeden çıkar"

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>" 
