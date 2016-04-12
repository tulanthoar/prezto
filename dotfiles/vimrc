filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'junegunn/fzf'
Plugin 'ascenator/L9'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/YankRing.vim'
let g:yankring_replace_n_pkey = '<F3>'
let g:yankring_replace_n_nkey = '<F4>'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'easymotion/vim-easymotion'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ervandew/supertab'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'michaeljsmith/vim-indent-object'
"Plugin 'tomtom/tlib_vim'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
call vundle#end()
filetype plugin indent on
"colorscheme solarized
color desert
syntax enable
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=gray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=gray
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:deoplete#enable_at_startup = 1
let g:indent_guides_start_level=2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_b = '%{getcwd()}'
"let g:airline_section_c = '%t'
let g:python3_host_prog = '/bin/python3'
let g:powerline_pycmd="py3"
let NERDTreeIgnore=['\pyc$', '\~$[[file]]', '\swp$', '\git$', '\pyc$', '\pycache__$[[dir]]]']
let NERDTreeQuitOnOpen=1
let NERDTreeCascadeOpenSingleChildDir=1
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=35
let g:multi_cursor_next_key="\<C-s>"
let g:yankring_min_element_length = 2

set cursorline
set cursorcolumn
let &l:colorcolumn=join(range(1,120,10),',')
autocmd VimEnter,Colorscheme * :hi ColorColumn ctermbg=lightgrey
autocmd VimEnter,Colorscheme * :hi CursorColumn ctermbg=black
set autoread
set ai
set background=dark
set backup
set cmdheight=2
set encoding=utf8
set eol
set expandtab
set ffs=unix,dos,mac
set foldcolumn=1
set hidden
set ignorecase
set lbr
set lcs+=extends:&,precedes:&
set list
set magic
set mat=2
set mouse=a
set number
set nuw=2
set relativenumber
set ruler
set scrolljump=5
set showcmd
set showmatch
set showmode
set showtabline=0
set si
set smartcase
set smarttab
set so=5 "ensure 5 lines are above/below cursor when scrolling
set splitright
set timeoutlen=1200
set ts=2 sw=2 et
set undofile
set viminfo^=% " Remember info about open buffers on close
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pyc
set wildignorecase
set wildmenu
set wrap

let mapleader=","
map css yss
"map <F2> :tabnew<CR>
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
"map <leader>e :NERDTreeFind<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %
"map Q gq
"inoremap <C-U> <C-G>u<C-U>
"nnoremap Y y$
nmap  <Leader>p0  :YRGetElem 1<CR>
nmap  <Leader>pp  :YRPop<CR>
nmap  <Leader>f       <Plug>(easymotion-bd-fl)
let g:EasyMotion_startofline = 0
nmap <Leader>J <Plug>(easymotion-sol-j)
nmap <Leader>K <Plug>(easymotion-sol-k)
nmap <Leader>f       <Plug>(easymotion-bd-fl)
nmap <Leader>t       <Plug>(easymotion-bd-tl)
nmap <space> <Plug>(easymotion-bd-f2)
nmap  <Leader>g       <Plug>(easymotion-bd-jk)
nmap  <Leader>e       <Plug>(easymotion-bd-w)
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

"map <F6> "ky
"map <S-F6> "kp
"map <F5> "jy
"map <S-F5> "jp
"map <F4> ml
"map <S-F4> 'l
"map <F3> mk
"map <S-F3> 'k
"map <S-F2> 'j
"map <Leader><space> /
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"map j gj
"map k gk
map <leader>cd :cd %:p:h<cr>:pwd<cr>
"nmap 0 ^

"map K <Plug>(expand_region_expand)
"map J <Plug>(expand_region_shrink)

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
map <leader>q :e ~/buffer<cr>
map <leader>w :w<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>t<space> :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>tn :tabnext

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
