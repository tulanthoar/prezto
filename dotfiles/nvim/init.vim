"init on 2016-05-26
let mapleader=","
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
filetype off
call vundle#begin('$HOME/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ascenator/L9'
Plugin 'tomtom/tlib_vim'
Plugin 'xolox/vim-misc'
Plugin 'kana/vim-textobj-user'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'ervandew/supertab'
Plugin 'bling/vim-bufferline'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'edsono/vim-matchit'
Plugin 'vim-scripts/twilight256.vim'
Plugin 'mbbill/undotree'
Plugin 'Konfekt/FastFold'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tmhedberg/SimpylFold'
"this
Plugin 'davidhalter/jedi-vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/neco-vim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'c9s/perlomni.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-scripts/YankRing.vim'
"this
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'easymotion/vim-easymotion'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'morhetz/gruvbox'
Plugin 'zeis/vim-kolor'
Plugin 'terryma/vim-expand-region'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'xolox/vim-easytags'
Plugin 'kopischke/vim-stay'
"here
Plugin 'neovimhaskell/haskell-vim.git'
Plugin 'WolfgangMehner/perl-support'
Plugin 'klen/python-mode'
call vundle#end()
filetype plugin indent on
syntax enable
set background=dark
set backupdir=$HOME/.config/nvim/files/backup/
set cmdheight=2
set completeopt="menu,preview,longest"
set cursorcolumn
set cursorline
set directory=$HOME/.config/nvim/files/swap/
set encoding=utf8
set expandtab
set ffs=unix,dos,mac
set hidden
set ignorecase
set linebreak
set list
set listchars+=extends:&,precedes:&
set mouse=v
set noshowmode
set scrolljump=2
set scrolloff=5 "ensure 5 lines are above/below cursor when scrolling
set showcmd
set showmatch
set showtabline=0
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitright
set shiftwidth=2
set tildeop
set tabstop=2
set timeoutlen=2000
set undodir=$HOME/.config/nvim/files/undo/
set undofile
set viminfo='100,n$HOME/.config/nvim/files/info/viminfo
set viminfo+=% " Remember info about open buffers on close
set whichwrap+=<,>,h,l
set wildignorecase
set wildignore=*.o,*~,*.pyc
set writebackup
let g:kolor_underline = 1
let g:kolor_italic = 1
let g:kolor_bold = 1
let g:kolor_alternative_matchparen = 1
colorscheme kolor
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = ['indent', 'trailing', 'long', 'mixed-indent-file']
let g:airline#extensions#quickfix#location_text = 'loc'
let g:airline#extensions#quickfix#quickfix_text = 'qfix'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#buffers_label = 'buf'
let g:airline#extensions#tabline#tabs_label = 'ts'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_y = ''
let g:airline_theme = 'molokai'
let g:airline_exclude_preview = 1
let g:bufferline_active_buffer_left = '_'
let g:bufferline_active_buffer_right = '_'
let g:bufferline_echo = 0
let g:bufferline_modified = '**'
let g:ctrlp_by_filename = 0
let g:ctrlp_cache_dir = '$HOME/.config/nvim/files/cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_lazy_update = 10
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:25,results:25'
let g:ctrlp_mruf_max = 2500
let g:ctrlp_regexp = 1
let g:ctrlp_user_command  = 'ag -i --hidden -l --nocolor -g "" %s'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_open_single_match = ['mru']
let g:CtrlSpaceGlobCommand = 'ag -i --hidden -l --nocolor -g ""'
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
let g:CtrlSpaceSymbols = { "File": "◯", "CTab": "▣", "Tabs": "▢" }
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 0
let g:delimitMate_jump_expansion = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:EasyMotion_keys = 'ASDFGHJKLQWERUIO;'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
let g:easytags_async=1
let g:easytags_file = '$HOME/.config/nvim/files/.easytags'
let g:easytags_resolve_links = 1
let g:expand_region_text_objects = {'iw':0, 'iW':0, 'i"':0, 'i''':0, 'i]':1, 'ib':1, 'iB':1, 'il':0, 'ii':1, 'ip':0, 'ie':0}
let g:haddock_browser = "/usr/bin/qutebrowser"
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_enable_typeroles = 1
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help']
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 4
let g:jedi#use_tabs_not_buffers = 1
let g:miniBufExplStatusLineText = 0
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplShowBufNumbers = 0
let g:multi_cursor_next_key = "<F2>"
let g:multi_cursor_visual_maps = {'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1, 'S':1}
let g:NERDTreeIgnore = ['\pyc$', '\~$[[file]]', '\swp$', '\git$', '\pyc$', '\pycache__$[[dir]]]']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowFiles = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeWinSize = 40
let g:nrrw_rgn_wdth = 50
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
let g:perl_fold = 1
let g:Perl_PerlTags = 'on'
let g:pymode_doc_bind = '\doc'
let g:pymode_folding = 1
let g:pymode_rope_autoimport_bind = '\rfi'
let g:pymode_rope_completion = 0
let g:pymode_rope_goto_definition_bind = '\def'
let g:pymode_rope_organize_imports_bind = '\ri'
let g:pymode_rope_project_root = "code/pygit"
let g:pymode_rope_rename_bind = '\rn'
let g:pymode_rope_show_doc_bind = '\rdoc'
let g:python_highlight_all = 1
let g:python3_host_prog = '/usr/bin/python3'
let g:SimpylFold_docstring_preview = 1
let g:snips_author = 'Nathan Yonkee'
let g:SuperTabCrMapping = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<C-p>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabLongestHighlight = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:undotree_SetFocusWhenToggle = 1
let g:vimsyn_folding = 'af'
let g:yankring_min_element_length = 2
let g:yankring_replace_n_nkey = '<C-n>'
let g:yankring_replace_n_pkey = '<C-b>'
let g:yankring_window_height = 12


inoremap <unique> <F1>    <Delete>
inoremap <unique> <F4>    <esc>:w<cr>
nnoremap <unique> <F4>    :w<cr>
noremap  <unique> <F5>    <esc>:cd %:p:h<cr>:pwd<cr>
inoremap <unique> <F5>    <esc>:cd %:p:h<cr>:pwd<cr>
nnoremap <unique> <F6>    :CtrlPMRU<cr>
nnoremap <unique> <F7>    :TagbarOpenAutoClose<cr>
nnoremap <unique> <F8>    :Errors<cr>
nnoremap <unique> <F10>   <esc>:x<cr>
inoremap <unique> <F10>   <esc>:x<cr>
vnoremap <unique> <M-j>   :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <unique> <M-k>   :m'<-2<cr>`>my`<mzgv`yo`z
nnoremap <unique> <M-j>   :m+<cr>jk
nnoremap <unique> <M-k>   :m-2<cr>kj
cnoremap <unique> w!!     w !sudo tee > /dev/null %
vmap     <unique> v       <Plug>(expand_region_expand)
vmap     <unique> C       gc
nmap     <unique> css     yss
nnoremap <unique> H       Hzz
nnoremap <unique> L       Lzz
nmap     <unique> <space> <Plug>(easymotion-bd-f2)
vnoremap <unique> J       <esc>
inoremap <unique> jf      <esc>
inoremap <unique> fj      <esc>
noremap  <unique> ^       0
noremap  <unique> 0       ^
nnoremap <unique> <Down>  :vnew<cr>
nnoremap <unique> <Up>    :NarrowWindow!<cr>
xmap     <unique> <Up>    <Plug>NrrwrgnDo
nmap     <unique> <Left>  <Plug>AirlineSelectPrevTab
nmap     <unique> <Right> <Plug>AirlineSelectNextTab
nnoremap <unique> <C-H>   <C-W><C-H>
nnoremap <unique> <C-J>   <C-W><C-J>
nnoremap <unique> <C-K>   <C-W><C-K>
nnoremap <unique> <C-L>   <C-W><C-L>
nnoremap <unique> \\n     i<CR><Esc>
nmap     <unique> [P      ]<space>yil:m+<cr>kp
nmap     <unique> ]P      ]<space>yil:m+<cr>kpj
nmap     <unique> [C      ]<space>yil:m+<cr>gcckp
nmap     <unique> ]C      ]<space>yil:m+<cr>kpgccj

nnoremap <unique> <Leader>H       H
nnoremap <unique> <Leader>L       L
inoremap <unique> <leader>r       <esc>:nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>i
nnoremap <unique> <leader>r       :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
map      <unique> <leader>0       <Plug>(easymotion-sol-bd-jk)
map      <unique> <leader>e       <Plug>(easymotion-bd-el)
map      <unique> <leader>f       <Plug>(easymotion-bd-fl)
map      <unique> <leader>j       <Plug>(easymotion-sol-j)
map      <unique> <leader>k       <Plug>(easymotion-sol-k)
map      <unique> <leader>n       <Plug>(easymotion-bd-n)
map      <unique> <leader>$       <Plug>(easymotion-eol-bd-jk)
map      <unique> <leader>t       <Plug>(easymotion-bd-tl)
map      <unique> <leader>w       <Plug>(easymotion-bd-wl)
map      <unique> <leader><space> <Plug>(easymotion-overwin-f2)

let mapleader="-"
nnoremap <unique> <leader><leader> :exe "tabn ".g:lasttab<cr>
nmap     <unique> <leader><F1>    <Plug>AirlineSelectTab1
nmap     <unique> <leader><F2>    <Plug>AirlineSelectTab2
nmap     <unique> <leader><F3>    <Plug>AirlineSelectTab3
nmap     <unique> <leader><F4>    <Plug>AirlineSelectTab4
nmap     <unique> <leader><F5>    <Plug>AirlineSelectTab5
nmap     <unique> <leader><F6>    <Plug>AirlineSelectTab6
nmap     <unique> <leader><F7>    <Plug>AirlineSelectTab7
nmap     <unique> <leader><F8>    <Plug>AirlineSelectTab8
nmap     <unique> <leader><F9>    <Plug>AirlineSelectTab9
nnoremap <unique> <leader>sp      :setlocal spell!<cr>
nnoremap <unique> <leader>b       :CtrlPBuffer<cr>
nnoremap <unique> <leader>f       :CtrlP<cr>
nnoremap <unique> <leader>L       :CtrlPLine<cr>
nnoremap <unique> <leader>p       :YRShow<cr>
nnoremap <unique> <leader>u       :UndotreeToggle<cr>
nnoremap <unique> <leader>n       :NERDTreeFind<cr>
nnoremap <unique> <leader>t       :TlistToggle<cr>
nmap     <unique> <leader>T       <Plug>TaskList
noremap  <unique> <leader>k       :MBEbf<CR>
noremap  <unique> <leader>j       :MBEbb<CR>
noremap  <unique> <leader>h       :MBEbp<CR>
noremap  <unique> <leader>l       :MBEbn<CR>
noremap  <unique> <leader>q       :q<cr>
noremap  <unique> <leader>w       :MBEbun<cr>
noremap  <unique> <leader>x       :w<cr>
noremap  <unique> <leader>0       <esc>:MBEOpen<cr>:MBEFocus<cr>
noremap  <unique> <leader>1       :b1<cr>
noremap  <unique> <leader>2       :b2<cr>
noremap  <unique> <leader>3       :b3<cr>
noremap  <unique> <leader>4       :b4<cr>
noremap  <unique> <leader>5       :b5<cr>
noremap  <unique> <leader>6       :b6<cr>
noremap  <unique> <leader>7       :b7<cr>
noremap  <unique> <leader>8       :b8<cr>
noremap  <unique> <leader>9       :b9<cr>
nnoremap <unique> <leader><Tab>   :exe "b".g:lastbuff<cr>
noremap  <unique> <leader><space> :tabnew<cr>
let mapleader=","

let g:lasttab = 1
let g:lastbuff = 1
autocmd TabLeave    * let g:lasttab = tabpagenr()
autocmd BufLeave    * let g:lastbuff = bufnr("%")
autocmd WinEnter    * :AirlineRefresh
autocmd WinEnter    * set cursorline
autocmd WinEnter    * set cursorcolumn
autocmd WinLeave    * set nocursorline
autocmd WinLeave    * set nocursorcolumn
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline
" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd FileType python let b:match_words = '\<def\>:\<return\>,\<if\>:\<elif\>:\<else\>,\<try\>:\<except\>,\<from\>:\<import\>'
autocmd FileType c,perl let b:delimitMate_insert_eol_marker = 2
autocmd FileType c,perl let b:delimitMate_eol_marker = ";"
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=33
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe ":CtrlPMRU" | endif
autocmd VimEnter,Colorscheme * :hi CursorColumn ctermbg=52
autocmd VimEnter,Colorscheme * :hi CursorLine ctermbg=17
