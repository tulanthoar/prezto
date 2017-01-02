"init on 2016-05-26
if &compatible | set nocompatible | endif
filetype off
let g:mapleader="\\"
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#begin('$HOME/.config/nvim/bundle')
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ascenator/L9'
Plugin 'tomtom/tlib_vim'
Plugin 'xolox/vim-misc'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/matchit'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'godlygeek/tabular'
Plugin 'haya14busa/vim-asterisk'

Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'osyo-manga/unite-quickfix'
" TODO configure tabline
Plugin 'mkitt/tabline.vim'

let g:startify_bookmarks = [ {'n':'~/.config/nvim/init.vim'}, {'r':'~/.zprezto/runcoms'}, {'z':'~/.zshrc'}, {'p':'~/code/pyrep'}, {'l':'~/code/perl'} ]
let g:startify_session_dir = '~/.config/nvim/files/session'
let g:startify_list_order = [['Sess'], 'sessions',['MRU'], 'files',['MRU in CWD'], 'dir',['Marks'], 'bookmarks',['CMD'], 'commands']
let g:startify_commands = [ {'m': ['Unite MRU','Denite unite:file_mru']}, {'h':['help','Denite -auto-highlight -cursor-wrap -vertical-preview help']}, {'g':['grep','Denite -auto-highlight -cursor-wrap -vertical-preview grep']}, {'d':['dir search','Denite -auto-highlight -cursor-wrap -vertical-preview directory_rec']}, {'f':['all files','Denite -auto-highlight -cursor-wrap -vertical-preview file_rec']}, {'c':['cmd search','Denite -auto-highlight -cursor-wrap -vertical-preview commands']}, {'P': ['Plugins Update', 'PluginUpdate']}]
let g:startify_files_number = 4
let g:startify_session_before_save = [ 'silent! TagbarClose' ]
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_sort = 1
Plugin 'mhinz/vim-startify'

let g:surround_indent = 1
Plugin 'tpope/vim-surround'

let g:tlWindowPosition = 1
Plugin 'vim-scripts/TaskList.vim'

Plugin 'vim-utils/vim-man'
au VimEnter * command! -nargs=* -bar -complete=customlist,man#completion#run
      \ Man call man#get_page('tab', <f-args>)

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_conceal_markers = 1
let g:neosnippet#expand_word_boundary = 1
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

let g:tagbar_compact = 1
let g:tagbar_autofocus = 0
let g:tagbar_zoomwidth = 0
let g:tagbar_width = 25
let g:tagbar_indent = 0
let g:tagbar_foldlevel = 0
let g:tagbar_sort = 0
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1
let g:tagbar_autopreview = 0
let g:tagbar_silent = 0
let g:tagbar_map_zoomwin = '<Tab>'
Plugin 'majutsushi/tagbar'

let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:perl_fold = 1
let g:fastfold_savehook = 1
let g:fastfold_skip_filetypes = [ 'taglist', 'gitcommit', 'nerdtree', 'tagbar', 'startify', 'man' ]
Plugin 'Konfekt/FastFold'

let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1
Plugin 'christoomey/vim-tmux-navigator'

let g:SignatureForceMarkPlacement = 1
let g:SignatureForceMarkerPlacement = 1
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
Plugin 'kshenoy/vim-signature'

let g:gitgutter_highlight_lines = 0
Plugin 'airblade/vim-gitgutter'

let g:move_key_modifier = 'M'
Plugin 'matze/vim-move'

let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_keys = 'ASDFGHJKLQWERUIO;'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
Plugin 'easymotion/vim-easymotion'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'

let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_refresh_delay = 5
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_delay = 5
let g:deoplete#auto_refresh_delay = 5
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#tag#cache_limit_size = 5000000
let g:deoplete#delimiters = ['/', '.', '::', ':', '#', '->']
if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#same_filetypes = {}
endif
if !exists('g:neoinclude#reverse_exprs')
    let g:neoinclude#reverse_exprs = {}
endif
let g:neoinclude#reverse_exprs.perl =
            \ 'fnamemodify(substitute(v:fname, "/", "::", "g"), ":r")'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'SevereOverfl0w/deoplete-github'
Plugin 'Shougo/context_filetype.vim'

" TODO configure supertab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1
Plugin 'ervandew/supertab'

let g:indent_guides_default_mapping = 0
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['text', 'help', 'startify', 'nerdtree', 'man', 'tagbar']
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level =1
let g:indent_guides_tab_guides = 1
Plugin 'nathanaelkane/vim-indent-guides'

let g:base16colorspace=256
Plugin 'chriskempson/base16-vim'

" TODO configure airline
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#nrrwrgn#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks =
            \ ['indent', 'trailing', 'long', 'mixed-indent-file']
let g:airline#extensions#whitespace#symbol = ''
let g:airline#extensions#wordcount#enabled = 1
function! AirlineInit()
    let g:airline_section_c = airline#section#create(['ffenc'])
    let g:airline_section_b = airline#section#create(['%{getcwd()}'])
    if winwidth(0) > 80
        let g:airline_section_z =
                    \ airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', ':%2v'])
    else
        let g:airline_section_z = airline#section#create([ 'linenr', ':%3v'])
    endif
endfunction
autocmd User AirlineAfterInit call AirlineInit()
let g:airline_theme = 'kolor'
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_symbols.maxlinenr = ''
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" TODO configure delimitMate
let g:delimitMate_balance_matchpairs = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 0
let g:delimitMate_jump_expansion = 1
Plugin 'Raimondi/delimitMate'

" TODO configure undotree
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_WindowLayout = 2
Plugin 'mbbill/undotree'

" TODO configure NrrwRgn
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_rgn_incr = 50
let g:nrrw_rgn_vert = 1
let g:nrrw_rgn_nohl = 1
let b:nrrw_aucmd_written = ':update'
Plugin 'chrisbra/NrrwRgn'

" TODO configure syntastic
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
Plugin 'scrooloose/syntastic'

" TODO configure text objects
let g:expand_region_text_objects = {'iw':0, 'iW':0, 'i"':0, 'i''':0, 'i]':1,
            \ 'ib':1, 'iB':1, 'il':0, 'ii':1, 'ip':0, 'ie':0}
Plugin 'terryma/vim-expand-region'

" TODO configure easytags
let g:easytags_include_members = 1
let g:easytags_async=1
let g:easytags_file = '$HOME/.config/nvim/files/.easytags'
let g:easytags_by_filetype = 1
let g:easytags_always_enabled = 1
let g:easytags_resolve_links = 1
let g:easytags_autorecurse = 1
Plugin 'xolox/vim-easytags'

" TODO configure LaTeXBox
let g:LatexBox_completion_close_braces = 1
let g:LatexBox_bibtex_wild_spaces = 1
let g:LatexBox_complete_inlineMath = 1
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_fold_automatic = 1
let g:LatexBox_viewer = 'evince'
let g:tex_flavor = "latex"
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" TODO configure perl-support
let g:Perl_CustomTemplateFile = '$ZDOTD/nvim/bundle/perl-support/templates/perl.templates'
let g:Perl_PerlTags = 'on'
let g:Perl_Ctrl_j = 'off'
Plugin 'WolfgangMehner/perl-support'
Plugin 'vim-perl/vim-perl'
Plugin 'c9s/perlomni.vim'

" TODO configure haskell-vim
let g:haddock_browser = "/usr/bin/firefox"
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_enable_typeroles = 1
let g:haskellmode_completion_ghc = 0
Plugin 'neovimhaskell/haskell-vim.git'
Plugin 'eagletmt/neco-ghc'

" TODO configure pymode
let g:pymode_doc = 1
let g:pymode_doc_bind = '<C-o>'
let g:pymode_lint_message = 1
let g:pymode_lint_on_fly = 1
let g:pymode_motion = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 90
let g:pymode_rope = 1
let g:pymode_rope_project_root = ""
let g:pymode_rope_regenerate_on_write = 1
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_autoimport = 1
let g:pymode_rope_autoimport_import_after_complete = 1
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_rope_completion_bind = '<C-X><C-U>'
let g:pymode_rope_autoimport_bind = '\i'
let g:pymode_rope_goto_definition_bind = '\o'
let g:pymode_rope_rename_bind = '\*'
let g:pymode_rope_show_doc_bind = '<C-d>'
let g:pymode_rope_extract_method_bind = '<C-c>rm'
let g:pymode_rope_extract_variable_bind = '<C-c>rl'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_slow_sync = 1
let g:python3_host_prog = '/usr/bin/python3'
let g:python_highlight_all = 1
let g:pymode_syntax_print_as_function = 1
let g:SimpylFold_docstring_preview = 1
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'tmhedberg/SimpylFold'

" TODO configure neco-vim
Plugin 'Shougo/neco-vim'

let g:multi_cursor_next_key='<C-M>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_visual_maps = {'i':1,'a':1,'f':1,'F':1,'t':1,'T':1,'K':1,'S':1}
Plugin 'terryma/vim-multiple-cursors'

" TODO configure YankRing
let g:yankring_zap_keys = 'F t T / ?'
let g:yankring_min_element_length = 2
let g:yankring_replace_n_nkey = '<C-n>'
let g:yankring_replace_n_pkey = '<C-b>'
let g:yankring_window_height = 12
let g:yankring_history_dir = '$HOME/.config/nvim/files'
Plugin 'vim-scripts/YankRing.vim'

" TODO configure ctrlp
let g:ctrlp_by_filename = 0
let g:ctrlp_cache_dir = '$HOME/.config/nvim/files/cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cmd = 'CtrlPBufTag'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix']
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_lazy_update = 10
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:35'
let g:ctrlp_mruf_max = 2500
let g:ctrlp_open_single_match = ['mru']
let g:ctrlp_prompt_mappings = {'ToggleType(1)': ['<M-n>', '<C-up>'],
                             \ 'ToggleType(-1)':['<M-b>', '<C-down>'],
                             \ 'PrtCurLeft()':  ['<left>', '<C-^>'],
                             \ 'PrtCurRight()': ['<right>']}
let g:ctrlp_regexp = 1
let g:ctrlp_tilde_homedir = 1
let g:ctrlp_types = []
let g:ctrlp_user_command  = 'ag -i --hidden -l --nocolor -g "" %s'
let g:ctrlp_working_path_mode = 'a'
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on
syntax enable

colorscheme base16-google-dark
set background=dark
au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=22
au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=166
au VimEnter,Colorscheme * :hi CursorColumn ctermbg=238
au VimEnter,Colorscheme * :hi CursorLine cterm=underline ctermbg=237
au InsertLeave * :hi CursorLine cterm=underline ctermbg=237
au InsertEnter * :hi CursorLine cterm=bold ctermbg=232

set autoindent
set backupdir=$HOME/.config/nvim/files/backup/
set cmdheight=2
set completeopt="menu,preview,longest"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
set cursorcolumn
set cursorline
set directory=$HOME/.config/nvim/files/swap/
set encoding=utf8
set expandtab
set ffs=unix,dos,mac
set foldclose=all
set foldcolumn=2
set foldlevel=2
set foldminlines=2
set hidden
set helpheight=40
set ignorecase
set linebreak
set list
set listchars+=extends:&,precedes:&
set mouse=a
set mousemodel=popup_setpos
set noshowmode
set scrolljump=2
set scrolloff=3 "ensure 3 lines are above/below cursor when scrolling
set shiftwidth=4
set showcmd
set showmatch
set showtabline=0
set smartcase
set smartindent
set smarttab
set softtabstop=4
set splitright
set tabstop=4
set tagcase=match
set tags+=./perltags
set textwidth=90
set tildeop
set timeoutlen=2000
set undodir=$HOME/.config/nvim/files/undo/
set undofile
set updatetime=900
set viewoptions=cursor,folds,slash,unix
set viminfo='100,n$HOME/.config/nvim/files/info/viminfo
set viminfo+=% " Remember info about open buffers on close
set visualbell
set whichwrap+=<,>,h,l
set wildchar=<Tab>
set wildignore=*.o,*~,*.pyc
set wildmenu
set wildmode=list:full
set writebackup

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [incsearch#config#fuzzy#converter()],
                \   'modules': [incsearch#config#easymotion#module()],
                \   'keymap': {"\<CR>": '<Over>(easymotion)'},
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

let g:denite_menus = {}
let g:denite_menus.git = {'description': 'gestionar repositorios git'}
let g:denite_menus.git.command_candidates = [
    \['▷ git status       (Fugitive)                      ', 'Gstatus'],
    \['▷ git diff         (Fugitive)                      ', 'Gdiff'],
    \['▷ git commit       (Fugitive)                      ', 'Gcommit'],
    \['▷ git log          (Fugitive)                      ', 'Glog'],
    \['▷ git blame        (Fugitive)                      ', 'Gblame'],
    \['▷ git stage        (Fugitive)                      ', 'Gwrite'],
    \['▷ git checkout     (Fugitive)                      ', 'Gread'],
    \['▷ git rm           (Fugitive)                      ', 'Gremove'],
    \['▷ git push         (Fugitive, salida por buffer)   ', 'Git! push'],
    \['▷ git pull         (Fugitive, salida por buffer)   ', 'Git! pull'],
    \['▷ git cd           (Fugitive)                      ', 'Gcd'],
\['▷ preview hunk           (GitGutter)                      ', 'GitGutterPreviewHunk'],
\['▷ undo hunk           (GitGutter)                      ', 'GitGutterUndoHunk'],
    \]

noremap  <unique><silent><expr> ;<Space> incsearch#go(<SID>config_easyfuzzymotion())
noremap  <unique><silent><expr> j        (v:count1 == 1 ? 'gj' : 'j')
noremap  <unique><silent><expr> k        (v:count1 == 1 ? 'gk' : 'k')
nmap     <unique>g/                      <Plug>(incsearch-fuzzy-/)
nmap     <unique>?                       <Plug>(incsearch-fuzzy-stay)
map      <unique>;                       <Plug>(easymotion-prefix)
nmap     <unique><M-l>                   <Plug>MoveLineHalfPageDownzz
nmap     <unique><M-h>                   <Plug>MoveLineHalfPageUpzz
xmap     <unique><M-l>                   <Plug>MoveBlockHalfPageDownzz
xmap     <unique><M-h>                   <Plug>MoveBlockHalfPageUpzz
xmap     <unique>v                       <Plug>(expand_region_expand)
map      <unique>*                       <Plug>(asterisk-z*)<Plug>(easymotion-bd-n)
map      <unique>#                       <Plug>(asterisk-z#)<Plug>(easymotion-bd-n)
map      <unique>g*                      <Plug>(asterisk-gz*)<Plug>(easymotion-bd-n)
map      <unique>g#                      <Plug>(asterisk-gz#)<Plug>(easymotion-bd-n)
nnoremap <unique><silent><C-]>           :ta<CR>
nnoremap <unique><silent><C-[>           :po<CR>
nnoremap <unique><silent><C-T>           g<C-]>


inoremap <unique><F1>  <Delete>
inoremap <unique><F4>  <esc>:w<cr>
noremap  <unique><F4>  <esc>:w<cr>
noremap  <unique><F5>  <esc>:cd %:p:h<cr>:pwd<cr>
inoremap <unique><F5>  <esc>:cd %:p:h<cr>:pwd<cr>
nnoremap <unique><F10> <esc>:x<cr>
inoremap <unique><F10> <esc>:x<cr>
cnoremap <unique>w!!   SudoWrite
cnoremap <unique>t!!   Tabularize /./l1c1l0
nmap     <unique>css   yss
nnoremap <unique>H     Hzz
nnoremap <unique>L     Lzz

call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_ops', ['--hidden', '-SL', '--glob', '!.git', '--glob', '!.gitignore', '--glob', '!.gitsubmodules', '--glob', '!.cache'])
nnoremap <unique>F       :Denite -auto-highlight -cursor-wrap -vertical-preview grep<CR>
nmap     <unique>f       <Plug>(easymotion-bd-fl)
xmap     <unique>f       <Plug>(easymotion-bd-fl)
omap     <unique>f       <Plug>(easymotion-bd-fl)
nmap     <unique>s       <Plug>(easymotion-bd-f2)
xmap     <unique>s       <Plug>(easymotion-bd-f2)
omap     <unique>s       <Plug>(easymotion-bd-f2)
nmap     <unique>K       <Plug>(easymotion-sol-bd-jk)
xmap     <unique>K       <Plug>(easymotion-sol-bd-jk)
omap     <unique>K       <Plug>(easymotion-sol-bd-jk)
nnoremap <unique><Space> <C-O>

nnoremap <unique>\\n    i<CR><Esc>
vnoremap <unique>J      <esc>
inoremap <unique>jf     <esc>
inoremap <unique>fj     <esc>
nnoremap <unique>^      0
nnoremap <unique>0      ^
nnoremap <unique>gs     ^
nnoremap <unique>gl     $
xnoremap <unique>^      0
xnoremap <unique>0      ^
xnoremap <unique>gs     ^
xnoremap <unique>gl     $
onoremap <unique>^      0
onoremap <unique>0      ^
onoremap <unique>gs     ^
onoremap <unique>gl     $
nnoremap <unique><Down> :vs<cr>
nnoremap <unique><Up>   :sp<cr>
xmap     <unique><CR>   <Plug>NrrwrgnDo
smap <expr><CR>
 \ pumvisible() ? deoplete#close_popup() :
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
imap <expr><CR>
 \ pumvisible() ? deoplete#close_popup() :
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_jump_or_expand)" : "\<CR>"
noremap  <unique><C-H>   :<C-U>TmuxNavigateLeft<cr>
noremap  <unique><C-J>   :<C-U>TmuxNavigateDown<cr>
noremap  <unique><C-K>   :<C-U>TmuxNavigateUp<cr>
noremap  <unique><C-L>   :<C-U>TmuxNavigateRight<cr>
noremap  <unique>g<Space>   :<C-U>TmuxNavigatePrevious<cr>
nmap <unique>[g      <Plug>GitGutterPrevHunk
nmap <unique>]g      <Plug>GitGutterNextHunk
omap <unique>ig      <Plug>GitGutterTextObjectInnerPending
omap <unique>ag      <Plug>GitGutterTextObjectOuterPending
xmap <unique>ig      <Plug>GitGutterTextObjectInnerVisual
xmap <unique>ag      <Plug>GitGutterTextObjectOuterVisual
nmap <unique><M-[>   ]<space>yil:m+<cr>kp
nmap <unique><M-]>   ]<space>yil:m+<cr>kpj
nmap <unique>[c      ]<space>yil:m+<cr>gcckp
nmap <unique>]c      ]<space>yil:m+<cr>kpgccj

let g:mapleader=","
nmap     <unique><leader><CR>    MVz^ozzz+zb<cr>
nnoremap <unique><leader>z       zjza
nnoremap <unique><leader>r       :nohlsearch<cr>:diffupdate<cr>:syntax sync fromstart<cr><c-l>
nmap     <unique><leader><Space> <Plug>(easymotion-bd-n)
nnoremap <unique><Leader>v       <C-V>
nnoremap <unique><leader>sp      :setlocal spell!<cr>
nnoremap <unique><Leader>,       qj
nnoremap <unique><Leader>.       @j
noremap  <unique><leader>q       :q<CR>
noremap  <unique><leader>d       :bd<CR>

let g:mapleader="-"
nmap     <unique><Leader><CR>     <Plug>NrrwrgnWinIncr
nnoremap <unique><leader><leader> :exe "tabn ".g:lasttab<cr>
nnoremap <unique><leader><Space>  :Startify<CR>
nnoremap <unique><leader>b        :Denite -auto-highlight -cursor-wrap -vertical-preview buffer<CR>
nnoremap <unique><leader>q        :Denite -auto-highlight -cursor-wrap -vertical-preview unite:quickfix<CR>
nnoremap <unique><leader>c        :Denite -auto-highlight -cursor-wrap -vertical-preview unite:location_list<CR>
noremap  <unique><leader>h        :Denite -auto-highlight -cursor-wrap -vertical-preview help<CR>
noremap  <unique><leader>l        :Denite -auto-highlight -cursor-wrap -vertical-preview line<CR>
noremap  <unique><leader>d        :Denite -auto-highlight -cursor-wrap -vertical-preview directory_rec<CR>
call denite#custom#var('file_rec', 'command', ['rg', '--files', '--follow', '--hidden', '--glob', '!.git', '--glob', '!.gitignore', '--glob', '!.gitsubmodules', '--glob', '!.cache'])
call denite#custom#var('menu', 'menus', g:denite_menus)
noremap  <unique><leader>f        :Denite -auto-highlight -cursor-wrap -vertical-preview file_rec<CR>
nnoremap <unique><Leader>g        :Denite menu:git<CR>
nnoremap <unique><Leader>m        :Denite -vertical-preview unite:file_mru<CR>
noremap  <unique><leader>:        :Denite -auto-highlight -cursor-wrap -vertical-preview command<CR>
noremap  <unique><leader>o        :Denite -auto-highlight -cursor-wrap -vertical-preview outline<CR>
nnoremap <unique><leader>p        :YRShow<cr>
nnoremap <unique><leader>u        :UndotreeToggle<cr>
noremap  <unique><leader>n        :<C-U>echo(system("tmux if -F '#{s/1/0/:window_panes}' 'join-pane -d -s:1.{top} -t:+' 'join-pane -vb -p 40 -t:1 -s:+.{bottom}'"))<CR>
nmap     <unique><leader>t        <Plug>TaskListjj

let g:mapleader="\\"
function g:Undotree_CustomMap()
    nmap <buffer> J <plug>UndotreeGoNextState
    nmap <buffer> K <plug>UndotreeGoPreviousState
endfunc
au FileType tex,plaintex imap <buffer> <Leader>]  <Plug>LatexCloseCurEnv
au FileType tex,plaintex nmap <buffer> <Leader>*  <Plug>LatexToggleStarEnv
au FileType tex,plaintex nmap <buffer> <Leader>ce <Plug>LatexChangeEnv
au FileType tex,plaintex vmap <buffer> <Leader>}  <Plug>LatexWrapSelection
au FileType tex,plaintex vmap <buffer> <Leader>se <Plug>LatexEnvWrapSelection
au FileType  c,perl let b:delimitmate_insert_eol_marker = 2
au FileType  c,perl let b:delimitmate_eol_marker = ";"
au FileType  python let b:match_words =
            \ '\<def\>:\<return\>,\<if\>:\<elif\>:\<else\>,\<try\>:\<except\>,\<from\>:\<import\>'
au FileType  python setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
au FileType  vim,man if &foldmethod == "manual" | setlocal foldmethod=syntax | endif
au FileType man setlocal nocursorcolumn
au FileType man setlocal nocursorline
au WinEnter    * set   cursorline
au WinEnter    * set   cursorcolumn
au WinLeave    * set   nocursorline
au WinLeave    * set   nocursorcolumn
au InsertEnter * setlocal timeoutlen=300
au InsertLeave * setlocal timeoutlen=2000
au VimEnter    * let   g:lasttab = tabpagenr()
au TabLeave    * let   g:lasttab = tabpagenr()
au VimEnter    * nested :call tagbar#autoopen(1)
au BufWinEnter * nested :call tagbar#autoopen(1)
au VimEnter    * :call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
au VimEnter    * :call deoplete#custom#set('_', 'converters', ['converter_auto_paren', 'converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu'])
au WinEnter    * AirlineRefresh
au BufEnter    * filetype detect
au BufWinEnter * if &previewwindow | setlocal number | endif
au BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
