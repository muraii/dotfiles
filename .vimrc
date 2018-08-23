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
"autocmd! BufEnter,BufNewFile *.py colo molokai
autocmd! BufEnter,BufNewFile *.py colo hybrid
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
