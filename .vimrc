set t_Co=256
execute pathogen#infect()
execute pathogen#helptags()
filetype on
filetype plugin on
filetype plugin indent on
" For CloseTag plugin, per mirnazim.org
autocmd FileType html,htmldjango let b:closetag_html_style=1
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
set laststatus=2
set guioptions-=r
set guioptions-=L
highlight Comment ctermfg=blue
"if has('gui_running')
"    colorscheme hybrid
"else
"    colorscheme smyck
"endif
"colorscheme wwdc16
colorscheme smyck
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
autocmd! BufEnter,BufNewFile *.py colo monokai
"autocmd! BufEnter,BufNewFile *.py colo hybrid
autocmd! BufLeave *.py colo smyck

syntax enable

let g:pydiction_location = '~/.vim/plugin/pydiction-1.2/complete-dict'

" Map the damn Esc to something nicer.
:inoremap jj <Esc>
:inoremap ii <C-T>
:inoremap kk <C-D>

nmap <Leader>tt <Plug>VimwikiToggleListItem
vmap <Leader>tt <Plug>VimwikiToggleListItem
nnoremap <F8> :NERDTree<CR>
nnoremap <F9> :NERDTreeClose<CR>
nnoremap <Leader>c :Calendar<CR>
"nnoremap <C-j> <C-w> j
"nnoremap <C-k> <C-w> k
"nnoremap <C-h> <C-w> h
"nnoremap <C-l> <C-w> l
" vimwiki/vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Set statusline, shown here a piece at a time
highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
set statusline=%1*			" Switch to User1 color highlight
set statusline+=%<%F			" file name, cut if needed at start
set statusline+=%M			" modified flag
set statusline+=%y			" file type
set statusline+=%=			" separator from left to right justified
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

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
