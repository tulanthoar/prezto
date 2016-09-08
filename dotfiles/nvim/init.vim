"init on 2016-05-26
if &compatible
  set nocompatible
endif
filetype off
let g:mapleader="\\"
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
set rtp+=$HOME/.config/nvim/rplugin/python
call vundle#begin('$HOME/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ascenator/L9'
Plugin 'tomtom/tlib_vim'
Plugin 'xolox/vim-misc'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-operator-user'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'WolfgangMehner/perl-support'
Plugin 'vim-perl/vim-perl'
Plugin 'davidhalter/jedi-vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/neoinclude.vim'
Plugin 'c9s/perlomni.vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/neco-vim'
let g:perl_fold = 1
let g:Perl_PerlTags = 'on'
let g:LatexBox_completion_close_braces = 1
let g:LatexBox_bibtex_wild_spaces = 1
let g:LatexBox_complete_inlineMath = 1
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_fold_automatic = 1
let g:LatexBox_viewer = 'evince'
let g:tex_flavor = "latex"
Plugin 'neovimhaskell/haskell-vim.git'
let g:haddock_browser = "/usr/bin/firefox"
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_enable_typeroles = 1
let g:deoplete#auto_complete_start_length = 2
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_delay = 10
let g:deoplete#sources#jedi#show_docstring = 1
let g:haskellmode_completion_ghc = 0
let g:CtrlSpaceGlobCommand = 'ag -i --hidden -l --nocolor -g ""'
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
let g:CtrlSpaceSearchTiming = 10
let g:CtrlSpaceCacheDir = expand('$HOME/.config/nvim/files/cache')
let g:CtrlSpaceUseTabline = 1
let g:CtrlSpaceUseUnicode = 0
Plugin 'klen/python-mode'
let g:pymode_doc = 1
let g:pymode_doc_bind = '\doc'
let g:pymode_folding = 1
let g:pymode_lint_message = 1
let g:pymode_lint_on_fly = 1
let g:pymode_motion = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 90
let g:pymode_rope_autoimport_bind = '\rfi'
let g:pymode_rope_completion = 0
let g:pymode_rope_goto_definition_bind = '\def'
let g:pymode_rope_organize_imports_bind = '\ri'
let g:pymode_rope_project_root = "code/pygit"
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_rename_bind = '\rn'
let g:pymode_rope_show_doc_bind = '<C-d>'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_slow_sync = 1
let g:python3_host_prog = '/usr/bin/python3'
let g:python_highlight_all = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_highlight_equal_operato = 1
let g:pymode_syntax_highlight_stars_operator = 1
let g:pymode_syntax_highlight_self = 1
let g:pymode_syntax_indent_errors = 1
let g:pymode_syntax_space_errors = 1
let g:pymode_syntax_string_formatting = 1
let g:pymode_syntax_string_format = 1
let g:pymode_syntax_string_templates = 1
let g:pymode_syntax_doctests = 1
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_builtin_types= 1
let g:pymode_syntax_highlight_exceptions = 1
let g:pymode_syntax_docstrings   = 1
"this

Plugin 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_save_on_switch = 1
Plugin 'brettanomyces/nvim-terminus'
Plugin 'vim-utils/vim-man'
Plugin 'kassio/neoterm'
Plugin 'eugen0329/vim-esearch'
"here
Plugin 'kshenoy/vim-signature'
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'haya14busa/vim-operator-flashy'
let g:operator#flashy#flash_time = 1000
let g:move_key_modifier = 'M'
Plugin 'matze/vim-move'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/vim-asterisk'
Plugin 'rhysd/clever-f.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
"this
Plugin 'vim-ctrlspace/vim-ctrlspace'
Plugin 'Shougo/deoplete.nvim'
let g:vimsyn_folding = 'af'
Plugin 'terryma/vim-multiple-cursors'
let g:multi_cursor_next_key = "<F2>"
let g:multi_cursor_visual_maps = {'i':1, 'a':1, 'f':1, 'F':1, 't':1, 'T':1, 'S':1}
Plugin 'vim-scripts/YankRing.vim'
let g:yankring_min_element_length = 2
let g:yankring_replace_n_nkey = '<C-n>'
let g:yankring_replace_n_pkey = '<C-b>'
let g:yankring_window_height = 12
let g:yankring_history_dir = '$HOME/.config/nvim/files'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'
let g:airline_exclude_preview = 1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#quickfix#location_text = 'loc'
let g:airline#extensions#quickfix#quickfix_text = 'qfix'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffers_label = 'buf'
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#tabline#tabs_label = 'ts'
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#whitespace#checks = ['indent', 'trailing', 'long', 'mixed-indent-file']
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#wordcount#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_b = '%{getcwd()}'
let g:airline_section_y = ''
let g:airline_theme = 'kolor'
Plugin 'ervandew/supertab'
let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
let g:SuperTabContextDefaultCompletionType = "<C-p>"
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabCrMapping = 1
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
Plugin 'bling/vim-bufferline'
let g:bufferline_active_buffer_left = '_'
let g:bufferline_active_buffer_right = '_'
let g:bufferline_echo = 0
let g:bufferline_modified = '**'
Plugin 'fholgado/minibufexpl.vim'
let g:miniBufExplCloseOnSelect = 1
let g:miniBufExplCycleArround = 1
let g:miniBufExplorerAutoStart = 0
let g:miniBufExplShowBufNumbers = 0
let g:miniBufExplStatusLineText = 0
Plugin 'Raimondi/delimitMate'
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 0
let g:delimitMate_jump_expansion = 1
Plugin 'mbbill/undotree'
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
Plugin 'edsono/vim-matchit'
Plugin 'Konfekt/FastFold'
let g:fastfold_skip_filetypes=['plaintex', 'tex']
Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_by_filename = 0
let g:ctrlp_cache_dir = '$HOME/.config/nvim/files/cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_extensions = ['tag', 'buffertag', 'line']
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_lazy_update = 10
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:35'
let g:ctrlp_mruf_max = 2500
let g:ctrlp_open_single_match = ['mru']
let g:ctrlp_prompt_mappings = {'ToggleType(1)': ['<c-l>', '<c-up>'],
                             \ 'ToggleType(-1)':['<c-h>', '<c-down>'],
                             \ 'PrtCurLeft()':  ['<left>', '<c-^>'],
                             \ 'PrtCurRight()': ['<right>']}
let g:ctrlp_regexp = 1
let g:ctrlp_tilde_homedir = 1
let g:ctrlp_types = ['fil', 'mru', 'lns']
let g:ctrlp_user_command  = 'ag -i --hidden -l --nocolor -g "" %s'
let g:ctrlp_working_path_mode = 'a'
Plugin 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1
Plugin 'chrisbra/NrrwRgn'
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_rgn_incr = 50
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_nohl = 1
let b:nrrw_aucmd_written = ':update'
Plugin 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'ASDFGHJKLQWERUIO;'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
Plugin 'nathanaelkane/vim-indent-guides'
let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help','nerdtree']
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 4
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdtree'
let g:NERDTreeIgnore = ['\pyc$', '\~$[[file]]', '\swp$', '\git$', '\pyc$', '\pycache__$[[dir]]]']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeQuitOnOpen = 0
let g:NERDTreeShowFiles = 0
let g:NERDTreeShowHidden = 1
let g:NERDTreeShowLineNumbers = 0
let g:NERDTreeWinSize = 40
Plugin 'scrooloose/syntastic'
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
Plugin 'zeis/vim-kolor'
let g:kolor_underline = 1
let g:kolor_italic = 1
let g:kolor_bold = 1
let g:kolor_alternative_matchparen = 1
Plugin 'terryma/vim-expand-region'
let g:expand_region_text_objects = {'iw':0, 'iW':0, 'i"':0, 'i''':0, 'i]':1, 'ib':1, 'iB':1, 'il':0, 'ii':1, 'ip':0, 'ie':0}
Plugin 'xolox/vim-easytags'
let g:easytags_async=1
let g:easytags_file = '$HOME/.config/nvim/files/.easytags'
let g:easytags_resolve_links = 1
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kopischke/vim-stay'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'vim-scripts/TaskList.vim'
call vundle#end()
filetype plugin indent on
syntax enable

colorscheme kolor
set background=dark
hi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected PMenuSel
hi link CtrlSpaceSearch   Search
hi link CtrlSpaceStatus   StatusLine
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
set showtabline=0
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


inoremap <unique> <F1>    <Delete>
inoremap <unique> <F4>    <esc>:w<cr>
nnoremap <unique> <F4>    <esc>:w<cr>
nnoremap <unique> <F5>    <esc>:cd %:p:h<cr>:pwd<cr>
inoremap <unique> <F5>    <esc>:cd %:p:h<cr>:pwd<cr>
nnoremap <unique> <F6>    <esc>:CtrlSpace O<CR>
inoremap <unique> <F6>    <esc>:CtrlSpace O<CR>
nnoremap <unique> <F7>    <esc>:TagbarOpenAutoClose<cr>
inoremap <unique> <F7>    <esc>:TagbarOpenAutoClose<cr>
nnoremap <unique> <F8>    <esc>:Errors<cr>
inoremap <unique> <F8>    <esc>:Errors<cr>
nnoremap <unique> <F9>    <esc>:YRShow<CR>
inoremap <unique> <F9>    <esc>:YRShow<CR>
nnoremap <unique> <F10>   <esc>:x<cr>
inoremap <unique> <F10>   <esc>:x<cr>
noremap      <unique> Q       <Esc>:q<CR>
cnoremap <unique> w!!     SudoWrite
vmap     <unique> v       <Plug>(expand_region_expand)
vmap     <unique> C       gc
nmap     <unique> css     yss
nnoremap <unique> H       Hzz
nnoremap <unique> L       Lzz

nmap s         <Plug>(easymotion-bd-fl)
xmap s         <Plug>(easymotion-bd-fl)
omap z         <Plug>(easymotion-bd-fl)
nmap gs         <Plug>(easymotion-bd-f2)
xmap gs         <Plug>(easymotion-bd-f2)
omap gz         <Plug>(easymotion-bd-f2)
nmap gj <Plug>(easymotion-sol-bd-jk)
xmap gj <Plug>(easymotion-sol-bd-jk)
omap gj <Plug>(easymotion-sol-bd-jk)
nmap gk <Plug>(easymotion-sol-bd-jk)
xmap gk <Plug>(easymotion-sol-bd-jk)
omap gk <Plug>(easymotion-sol-bd-jk)
nmap g<Tab> <Plug>(easymotion-overwin-line)

vnoremap <unique> J       <esc>
inoremap <unique> jf      <esc>
inoremap <unique> fj      <esc>
nnoremap <unique> ^       0
nnoremap <unique> 0       ^
nnoremap <unique> <Down>  :vs<cr>
nnoremap <unique> <Up>    :sp<cr>
xmap     <unique> <CR>    <Plug>NrrwrgnDo
nmap     <unique> <Leader><CR> <Plug>NrrwrgnWinIncr
nnoremap <unique> <Left>  <esc>:CtrlSpace l[[]<CR>
nnoremap <unique> <Right> <esc>:CtrlSpace l]][<CR>
noremap  <unique> <C-H>   <C-W><C-H>
noremap  <unique> <C-J>   <C-W><C-J>
noremap  <unique> <C-K>   <C-W><C-K>
noremap  <unique> <C-L>   <C-W><C-L>
imap     <expr><C-F>
\ neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<C-n>"
nnoremap <unique> \\n        i<CR><Esc>
nmap     <unique> [g         <Plug>GitGutterPrevHunk
nmap     <unique> ]g         <Plug>GitGutterNextHunk
nmap     <unique> ggu        <Plug>GitGutterUndoHunk
nmap     <unique> gg<CR>     <Plug>GitGutterPreviewHunk
omap     <unique> ig         <Plug>GitGutterTextObjectInnerPending
omap     <unique> ag         <Plug>GitGutterTextObjectOuterPending
xmap     <unique> ig         <Plug>GitGutterTextObjectInnerVisual
xmap     <unique> ag         <Plug>GitGutterTextObjectOuterVisual
nmap     <unique> <M-[>      ]<space>yil:m+<cr>kp
nmap     <unique> <M-]>      ]<space>yil:m+<cr>kpj
nmap     <unique> [c         ]<space>yil:m+<cr>gcckp
nmap     <unique> ]c         ]<space>yil:m+<cr>kpgccj
map      <unique> ;          <Plug>(easymotion-prefix)
nmap     <unique> <Space>       <Plug>(easymotion-repeat)

let g:mapleader=","
nmap <Leader>s <Plug>(easymotion-bd-fn)
xmap <Leader>s <Plug>(easymotion-bd-fn)
omap <Leader>z <Plug>(easymotion-bd-fn)
nmap     <unique> <leader><CR>    MVz^ozzz+zb<cr>
nnoremap <unique> <leader>z       zjza
nnoremap <unique> <leader>r       :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nnoremap <unique> <Leader>l       :CtrlPLine<CR>
nnoremap <unique> <leader>t       :CtrlPBufTag<CR>
nnoremap <unique> <leader>T       :CtrlPBufTagAll<CR>
nmap     <unique> <leader><Space>       <Plug>(easymotion-bd-n)
nnoremap <unique> <Leader>v       <C-V>
nnoremap <unique> <leader>sp      :setlocal spell!<cr>
nnoremap <unique> <Leader>,       qj
nnoremap <unique> <Leader>.       @j

let g:mapleader="-"
nnoremap <unique> <leader><leader> :exe "tabn ".g:lasttab<cr>
nnoremap <unique> <leader>b        :CtrlSpace A<CR>
nnoremap <unique> <leader>p        :YRShow<cr>
nnoremap <unique> <leader>u        :UndotreeToggle<cr>
map      <unique> <leader>n        <plug>NERDTreeMirrorToggle<CR>
nmap     <unique> <leader>t        <Plug>TaskList
noremap  <unique> <leader>k        :MBEbf<CR>
noremap  <unique> <leader>j        :MBEbb<CR>
noremap  <unique> <leader>h        :MBEbp<CR>
noremap  <unique> <leader>l        :MBEbn<CR>
noremap  <unique> <leader>q        :CtrlSpace Q<cr>
noremap  <unique> <leader>w        :CtrlSpaceSaveWorkspace<CR>
noremap  <unique> <leader>0        :CtrlSpace L<CR>
nnoremap <unique> <leader><Tab>    :exe "b".g:lastbuff<cr>
noremap  <unique> <leader><space>  :CtrlSpace<CR>
let g:mapleader="\\"

au FileType tex,plaintex imap <buffer> <Leader>]  <Plug>LatexCloseCurEnv
au FileType tex,plaintex nmap <buffer> <Leader>*  <Plug>LatexToggleStarEnv
au FileType tex,plaintex nmap <buffer> <Leader>ce <Plug>LatexChangeEnv
au FileType tex,plaintex vmap <buffer> <Leader>}  <Plug>LatexWrapSelection
au FileType tex,plaintex vmap <buffer> <Leader>se <Plug>LatexEnvWrapSelection
au FileType tex,plaintex nmap <buffer> <Leader>ae ]<Space>ji\begin{}<CR><CR>\end{}jfk
au FileType nerdtree      map <buffer> s <Plug>(easymotion-bd-f2)
au FileType nerdtree      map <buffer> . <Plug>(easymotion-repeat)
au FileType nerdtree      map <buffer> l :call nerdtree#ui_glue#invokeKeyMap("C")<CR>
au FileType nerdtree      map <buffer> l :call nerdtree#ui_glue#invokeKeyMap("C")<CR>
au FileType nerdtree      map <buffer> L :call nerdtree#ui_glue#invokeKeyMap("o")<CR>
au FileType nerdtree      map <buffer> h :call nerdtree#ui_glue#invokeKeyMap("u")<CR>
au FileType nerdtree      map <buffer> H :call nerdtree#ui_glue#invokeKeyMap("U")<CR>
function g:Undotree_CustomMap()
      nmap <buffer> J <plug>UndotreeGoNextState
      nmap <buffer> K <plug>UndotreeGoPreviousState
endfunc
let g:lasttab = 1
let g:lastbuff = 1
autocmd InsertEnter    * setlocal timeoutlen=300
autocmd InsertLeave    * setlocal timeoutlen=2000
autocmd TabLeave       * let   g:lasttab = tabpagenr()
autocmd BufLeave       * let   g:lastbuff = bufnr("%")
autocmd WinEnter       * AirlineRefresh

autocmd WinEnter       * set   cursorline
autocmd WinEnter       * set   cursorcolumn
autocmd WinLeave       * set   nocursorline
autocmd WinLeave       * set   nocursorcolumn
autocmd InsertEnter    * set   nocursorline
autocmd InsertLeave    * set   cursorline
autocmd VimEnter       * call  deoplete#initialize()
autocmd Insertenter    * call  deoplete#enable()
autocmd bufreadpost    * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
autocmd filetype haskell setlocal omnifunc=necoghc#omnifunc
autocmd filetype  python let b:match_words = '\<def\>:\<return\>,\<if\>:\<elif\>:\<else\>,\<try\>:\<except\>,\<from\>:\<import\>'
autocmd filetype  c,perl let b:delimitmate_insert_eol_marker = 2
autocmd filetype  c,perl let b:delimitmate_eol_marker = ";"
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=darkgray
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=33
autocmd VimEnter,Colorscheme * :hi CursorColumn ctermbg=52
autocmd VimEnter,Colorscheme * :hi CursorLine ctermbg=17
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe ":CtrlSpace b" | endif
