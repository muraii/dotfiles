set t_Co=256
execute pathogen#infect()
execute pathogen#helptags()
filetype on
filetype plugin on
filetype plugin indent on
" For CloseTag plugin, per mirnazim.org
autocmd FileType html,htmldjango let b:closetag_html_style=1
set number
set autoindent
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set ruler
set laststatus=2
set guioptions-=r
set guioptions-=L
highlight Comment ctermfg=blue
"colorscheme jellyx
colorscheme smyck
autocmd! BufEnter,BufNewFile *.py colo molokai
autocmd! BufLeave *.py colo smyck

syntax enable

let g:pydiction_location = '~/.vim/plugin/pydiction-1.2/complete-dict'

" Map the damn Esc to something nicer.
:inoremap jj <Esc>

nnoremap <F8> :NERDTree<CR>
nnoremap <F9> :NERDTreeClose<CR>
"nnoremap <C-j> <C-w> j
"nnoremap <C-k> <C-w> k
"nnoremap <C-h> <C-w> h
"nnoremap <C-l> <C-w> l
