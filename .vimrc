" Set shell so the split window navigation works.
" set shell=/bin/bash
if has('win32')
    let g:os = 'Windows'
else
    let g:os = substitute(system('uname'), '\n', '', '')
endif
if g:os == 'Darwin'
    set shell=/usr/local/bin/zsh
elseif g:os == 'Linux'
    set shell=/usr/bin/zsh
endif
set t_Co=256
set encoding=utf-8
"execute pathogen#infect()
"execute pathogen#helptags()
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tmhedberg/SimpylFold'
" Plug 'ycm-core/YouCompleteMe', {'branch': 'legacy-vim'}
Plug 'ycm-core/YouCompleteMe'
Plug 'mcchrish/nnn.vim'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'edkolev/tmuxline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-system-copy'
Plug 'dhruvasagar/vim-zoom'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" ########### Doing airline stuff.
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Use airline for tabs, too.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.dirty='⚡'

" ########### /Doing airline stuff.

" ########### Doing tmuxline stuff.
let g:airline#extensions#tmuxline#enabled = 0

set rtp+=/usr/lib/python3/dist-packages/powerline/bindings/vim/
set laststatus=2
filetype on
filetype plugin on
filetype plugin indent on
" For CloseTag plugin, per mirnazim.org
autocmd FileType html,htmldjango let b:closetag_html_style=1
" Make LINQ files get syntax highlighting like C#.
autocmd BufNewFile,BufRead *.linq set syntax=cs
set relativenumber
set number
set splitright
set splitbelow
set autoindent
set breakindent
set breakindentopt=shift:2
set softtabstop=4
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set ruler
command VW :vsp +VimwikiIndex
command -range CP :'<, '> w !clip.exe
highlight Comment ctermfg=blue
colorscheme monokai
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" This autocommand to *add* the highlight group from https://github.com/rodtreweek/Castle-Winbuntu/blob/master/README.md
autocmd ColorScheme * highlight BadWhitespace ctermbg=DarkBlue guibg=darkred
" The autocommand below from
" https://realpython.com/vim-and-python-a-match-made-in-heaven/.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$\| \+\ze\t/
syntax enable

let g:pydiction_location = '~/.vim/plugin/pydiction-1.2/complete-dict'

" Map the damn Esc to something nicer.
:inoremap jj <Esc>
:inoremap ii <C-T>
:inoremap kk <C-D>
"nmap <Leader>tt <Plug>VimwikiToggleListItem
"vmap <Leader>tt <Plug>VimwikiToggleListItem
nnoremap <F8> :NERDTree<CR>
nnoremap <F9> :NERDTreeClose<CR>
nnoremap <Leader>c :Calendar<CR>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:taskwiki_disable_concealcursor='yes'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
	return g:word_count
endfunction
function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END

" For notational-fzf-vim
let g:nv_search_paths = ['~/notes', '~/writing', '~/code', '~/.task', '~/vimwiki', '~/projects']
set rtp+=/usr/local/opt/fzf
set rtp+=~/winHome/gitrepos/fzf

" Creating the copy/paste mapping for Windows. Will adjust later if I need
" to first check terminal type or OS.
" source: https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows/44534222#44534222
" copy (write) highlighted text to .vimbuffer
vmap <C-c> y:new ~/.vimbuffer<CR>VGp:x<CR> \| :!cat ~/.vimbuffer \| clip.exe <CR><CR>
" paste from buffer
map <C-q> :r ~/.vimbuffer<CR>
hi CursorLineNr cterm=bold
