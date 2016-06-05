"init on 2016-05-26
let mapleader=","
filetype off
let &path='/usr/include,/usr/include/c++/6.1.1,/home/ant/apps/code/include,'
set rtp+=/home/ant/.config/nvim/bundle/Vundle.vim
call vundle#begin('/home/ant/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'ascenator/L9'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-airline'
Plugin 'fholgado/minibufexpl.vim'
" Plugin 'vim-scripts/Superior-Haskell-Interaction-Mode-SHIM.git'
" Plugin 'lukerandall/haskellmode-vim'
Plugin 'neovimhaskell/haskell-vim.git'
Plugin 'mbbill/undotree'
Plugin 'jiangmiao/auto-pairs'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'bling/vim-bufferline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'freeo/vim-kalisi'
Plugin 'junegunn/seoul256.vim'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'kana/vim-textobj-user'
Plugin 'klen/python-mode'
Plugin 'lisposter/vim-blackboard'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'majutsushi/tagbar'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'nielsmadan/harlequin'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/deoplete.nvim'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/buttercream.vim'
Plugin 'vim-scripts/c.vim'
Plugin 'vim-scripts/summerfruit256.vim'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'vim-scripts/YankRing.vim'
call vundle#end()
filetype plugin indent on
set t_Co=256  " make use of 256 terminal colors
let g:seoul256_background = 233
color seoul256
syntax enable
let g:miniBufExplorerAutoStart = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#quickfix#location_text = 'Location'
let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b ='%{getcwd()}'
let g:airline_theme='molokai'
let g:bufferline_echo = 0
let g:bufferline_modified = '**'
let g:ctrlp_by_filename = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_max_depth = 400
let g:ctrlp_max_files = 100000
let g:ctrlp_show_hidden = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_smart_case = 1
let g:EasyMotion_keys = 'ASDFGHJKLQWERUIO;'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
let g:expand_region_text_objects = {'iw':0, 'iW':0, 'i"':0, 'i''':0, 'i]':1, 'ib':1, 'iB':1, 'il':0, 'ii':1, 'ip':0, 'ie':0}
let g:haddock_browser="/usr/bin/qutebrowser"
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level=2
let g:jedi#use_tabs_not_buffers = 1
let g:multi_cursor_next_key="<F2>"
let g:multi_cursor_visual_maps = {'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1, 'S':1}
let g:NERDTreeCascadeOpenSingleChildDir=1
let g:NERDTreeIgnore=['\pyc$', '\~$[[file]]', '\swp$', '\git$', '\pyc$', '\pycache__$[[dir]]]']
let g:NERDTreeMinimalUI=1
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeShowFiles = 0
let g:NERDTreeShowHidden=0
let g:NERDTreeWinSize=35
let g:NERDTreeShowLineNumbers=1
let g:pymode_rope_completion = 0
let g:python3_host_prog = '/usr/bin/python3'
let g:SuperTabCrMapping = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:Tlist_Use_SingleClick=1
let g:yankring_replace_n_nkey = ',]'
let g:yankring_replace_n_pkey = ',['
let g:yankring_min_element_length = 2
let g:yankring_window_height = 12
let g:miniBufExplCycleArround = 1
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplCloseOnSelect = 1

au BufEnter *.hs compiler ghc
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkred
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter,Colorscheme * :hi CursorColumn ctermbg=88
autocmd VimEnter,Colorscheme * :hi CursorLine ctermbg=17

set background=dark
set backupdir   =$HOME/.config/nvim/files/backup/
set cmdheight=2
set cursorcolumn
set cursorline
set directory   =$HOME/.config/nvim/files/swap/
set encoding=utf8
set expandtab
set ffs=unix,dos,mac
" set foldcolumn=1
set hidden
set ignorecase
set linebreak
set list
set listchars+=extends:&,precedes:&
set mouse=v
set noshowmode
set number
set numberwidth=2
set scrolljump=2
set scrolloff=5 "ensure 5 lines are above/below cursor when scrolling
set showcmd
set showmatch
set showtabline=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitright
set shiftwidth=2
set tildeop
set tabstop=2
set undodir     =$HOME/.config/nvim/files/undo/
set undofile
set viminfo     ='100,n$HOME/.config/nvim/files/info/viminfo
set viminfo+=% " Remember info about open buffers on close
set whichwrap+=<,>,h,l
set wildignorecase
set wildignore=*.o,*~,*.pyc
set writebackup

map      <unique> <leader>0       <Plug>(easymotion-sol-bd-jk)
map      <unique> <leader>e       <Plug>(easymotion-bd-el)
map      <unique> <leader>f       <Plug>(easymotion-bd-fl)
map      <unique> <leader>j       <Plug>(easymotion-sol-j)
map      <unique> <leader>k       <Plug>(easymotion-sol-k)
map      <unique> <leader>n       <Plug>(easymotion-bd-n)
map      <unique> <leader>$       <Plug>(easymotion-eol-bd-jk)
map      <unique> <leader><space> <Plug>(easymotion-overwin-f2)
map      <unique> <leader>t       <Plug>(easymotion-bd-tl)
map      <unique> <leader>v       <Plug>(expand_region_expand)
map      <unique> <leader>V       <Plug>(expand_region_shrink)
map      <unique> <leader>w       <Plug>(easymotion-bd-wl)
nnoremap <unique> <leader>h       :tabprevious<cr>
nnoremap <unique> <leader>l       :tabnext<cr>
nnoremap <unique> <leader>sp      :setlocal spell!<cr>
nnoremap <unique> <leader>;       :TmuxNavigatePrevious<cr>
noremap  <unique> <leader>H       H
noremap  <unique> <leader>L       L
nnoremap <unique> <leader>q       :q<cr>

:imap <F3> <Plug>snipMateNextOrTrigger
:smap <F3> <Plug>snipMateNextOrTrigger
noremap <unique> <F5>    <esc>:cd %:p:h<cr>:pwd<cr>
inoremap <unique> <F5>    <esc>:cd %:p:h<cr>:pwd<cr>
inoremap <unique> <F1> <Delete>
cnoremap <unique> w!! w !sudo tee > /dev/null %
nnoremap <unique> ]P :<C-U>YRYankCount 'yy'<CR>p
nnoremap <unique> [P :<C-U>YRYankCount 'yy'<CR>P
inoremap <unique> ]P <esc>:<C-U>YRYankCount 'yy'<CR>p
inoremap <unique> [P <esc>:<C-U>YRYankCount 'yy'<CR>P
nmap <unique> [C [Pj:Commentary<cr>`[
nmap <unique> ]C ]Pk:Commentary<cr>`[
imap <unique> [C <esc>[C
imap <unique> ]C <esc>]C
inoremap <unique> <F4> <esc>:w<cr>
inoremap <unique> <S-F4> <esc>:x<cr>
nnoremap <unique> <F4> :w<cr>
noremap <unique> <S-F4> :x<cr>
inoremap <unique> jf           <esc>
inoremap <unique> fj           <esc>
nnoremap <unique> \n i<cr><esc>
nmap <space>    <Plug>(easymotion-bd-f2)
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <unique> css yss
nnoremap <unique> <C-H> :TmuxNavigateLeft<cr>
nnoremap <unique> <C-J> :TmuxNavigateDown<cr>
nnoremap <unique> <C-K> :TmuxNavigateUp<cr>
nnoremap <unique> <C-L> :TmuxNavigateRight<cr>
noremap ^ 0
noremap 0 ^
noremap <Down> +
noremap <S-Down> +$
noremap <Up> -
noremap <S-Up> -$
noremap <Left> ^
noremap <Right> $
noremap H Hzz
noremap L Lzz
vnoremap <silent> # :call VisualSelection('b')<cr>
vnoremap <silent> * :call VisualSelection('f')<cr>
vnoremap <unique> C <Plug>Commentary

let mapleader="-"
inoremap <unique> <leader><F4>    <esc>:qall<cr>
nnoremap <unique> <leader><F4>    :qall<cr>
nnoremap <unique> <leader><Tab>   :exe "tabn ".g:lasttab<cr>
inoremap <unique> <leader>R       <esc>:nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>i
nnoremap <unique> <leader>R       :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
noremap <unique> <leader>k :MBEbf<CR>
noremap <unique> <leader>j :MBEbb<CR>
noremap <leader>h :MBEbp<CR>
noremap <leader>l :MBEbn<CR>
noremap  <unique> <leader>0 <esc>:MBEOpen<cr>:MBEFocus<cr>
nnoremap <silent><unique> <leader>p :YRShow<cr>
nnoremap <unique> <leader>fb :CtrlPBuffer<cr>
nnoremap <unique> <leader>fc :CtrlPChange<cr>
nnoremap <unique> <leader>fd :CtrlPDir<cr>
nnoremap <unique> <leader>ff :CtrlP<cr>
nnoremap <unique> <leader>fl :CtrlPLine<cr>
nnoremap <unique> <leader>fr :CtrlPMRU<cr>
nnoremap <unique> <leader>fu :CtrlPUndo<cr>
nnoremap <unique> <leader>nd :NERDTreeCWD<cr>
nnoremap <unique> <leader>nh :NERDTreeToggle ~<cr>
nnoremap <unique> <leader>nm :NERDTreeMirror<cr>
nnoremap <unique> <leader>nn :NERDTreeFind<cr>
nnoremap <unique> <leader>ta :TlistToggle<cr>
nnoremap <unique> <leader>to <Plug>TaskList
noremap  <unique> <leader>1 :b1<cr>
noremap  <unique> <leader>2 :b2<cr>
noremap  <unique> <leader>3 :b3<cr>
noremap  <unique> <leader>4 :b4<cr>
noremap  <unique> <leader>5 :b5<cr>
noremap  <unique> <leader>6 :b6<cr>
noremap  <unique> <leader>7 :b7<cr>
noremap  <unique> <leader>8 :b8<cr>
noremap  <unique> <leader>9 :b9<cr>
noremap  <unique> <leader>b :e ~/buffer<cr>
noremap  <unique> <leader>q :Bclose<cr>
noremap  <unique> <leader><space> :tabnew<cr>
let mapleader=","
function! RangeChooser()
    let temp = tempname()
    " The option "--choosefiles" was added in ranger 1.5.1. Use the next line
    " with ranger 1.4.2 through 1.5.0 instead.
    "exec 'silent !ranger --choosefile=' . shellescape(temp)
    if has("gui_running")
        exec 'silent !st -e ranger --choosefiles=' . shellescape(temp)
    else
        exec 'silent !ranger --choosefiles=' . shellescape(temp)
    endif
    if !filereadable(temp)
        redraw!
        " Nothing to read.
        return
    endif
    let names = readfile(temp)
    if empty(names)
        redraw!
        " Nothing to open.
        return
    endif
    " Edit the first item.
    exec 'edit ' . fnameescape(names[0])
    " Add any remaning items to the arg list/buffer list.
    for name in names[1:]
        exec 'argadd ' . fnameescape(name)
    endfor
    redraw!
endfunction
command! -bar RangerChooser call RangeChooser()
nnoremap <unique> <leader>F :<C-U>RangerChooser<CR>

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
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
function g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

let g:lasttab = 1
au TabLeave    * let g:lasttab = tabpagenr()
au WinEnter    * :AirlineRefresh
au WinEnter    * set cursorline
au WinEnter    * set cursorcolumn
au WinLeave    * set nocursorline
au WinLeave    * set nocursorcolumn
au InsertEnter * set nocursorline
au InsertLeave * set cursorline
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
autocmd BufWrite *.py :call DeleteTrailingWS()
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>
au FileType python map <buffer> -F :set nofoldmethod<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
