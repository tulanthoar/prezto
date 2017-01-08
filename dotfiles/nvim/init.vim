"init on 2016-05-26
if &compatible | set nocompatible | endif
filetype off
let g:mapleader='-'
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
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-unimpaired.git'
Plugin 'tmhedberg/matchit'
Plugin 'godlygeek/tabular'
Plugin 'haya14busa/vim-asterisk'
Plugin 'mkitt/tabline.vim'
Plugin 'vim-utils/vim-man'

let g:neomru#filename_format = ":p:s?^/usr/lib?/u/l?:s?^/etc/?/e/?:~"
let g:neomru#update_interval = 60
let g:neomru#file_mru_path = expand("$HOME/.config/nvim/files/neo_mru")
let g:neomru#directory_mru_path = expand("$HOME/.config/nvim/files/neo_dir_mru")
let g:neomru#follow_links = 1
Plugin 'Shougo/denite.nvim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'osyo-manga/unite-quickfix'

let g:multi_cursor_next_key='<C-H>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_visual_maps = {'i':1,'a':1,'f':1,'F':1,'t':1,'T':1,'K':1,'S':1}
Plugin 'terryma/vim-multiple-cursors'

let g:NERDCreateDefaultMappings = 0
let g:NERDRemoveExtraSpaces = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
Plugin 'scrooloose/nerdcommenter'

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
let g:gitgutter_map_keys = 0
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
if !exists('g:neoinclude#reverse_exprs')
    let g:neoinclude#reverse_exprs = {}
endif
let g:neoinclude#reverse_exprs.perl =
            \ 'fnamemodify(substitute(v:fname, "/", "::", "g"), ":r")'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'SevereOverfl0w/deoplete-github'
Plugin 'Shougo/context_filetype.vim'

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

let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#tagbar#flags = 's'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#excludes = ['denite']
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#checks =
            \ ['indent', 'trailing', 'long', 'mixed-indent-file']
let g:airline#extensions#whitespace#symbol = ''
let g:airline#extensions#wordcount#enabled = 0
function! AirlineInit()
    let g:airline_section_b = airline#section#create(['%{getcwd()}'])
    let g:airline_section_c = airline#section#create(['ffenc'])
    if winwidth(0) > 80
        let g:airline_section_z =
                    \ airline#section#create(['windowswap', 'obsession', 'linenr', 'maxlinenr', ':%2v'])
    else
        let g:airline_section_z = airline#section#create([ 'linenr', ':%3v'])
    endif
endfunction
au User AirlineAfterInit call AirlineInit()
let g:airline_theme = 'kolor'
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_symbols.maxlinenr = ''
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
Plugin 'Raimondi/delimitMate'

let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 15
Plugin 'mbbill/undotree'

let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_rgn_vert = 1
let b:nrrw_aucmd_written = ':update'
Plugin 'chrisbra/NrrwRgn'

let g:yankring_min_element_length = 2
let g:yankring_max_element_length = 0
let g:yankring_map_dot = 0
let g:yankring_record_insert = 1
let g:yankring_history_dir = '$HOME/.config/nvim/files'
let g:yankring_zap_keys = 'j gS w * S # g* g# f s K g/ t ,/ ?'
let g:yankring_replace_n_nkey = '<C-n>'
let g:yankring_replace_n_pkey = '<C-b>'
let g:yankring_window_height = 12
Plugin 'vim-scripts/YankRing.vim'

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 0
let g:syntastic_python_checkers = ["pylint"]
Plugin 'scrooloose/syntastic'

let g:expand_region_text_objects = {'iw':0, 'iW':0, 'i"':0, 'a"':0, 'i''':0, 'a''':0, 'ib':1, 'ab':1, 'i]':1,
            \  'iB':1, 'il':0, 'ii':1, 'ai':1, 'ip':0, 'ie':0}
Plugin 'terryma/vim-expand-region'

let g:easytags_async=1
let g:easytags_syntax_keyword = 'auto'
let g:easytags_file = '$HOME/.config/nvim/files/.easytags'
let g:easytags_include_members = 1
let g:easytags_always_enabled = 1
let g:easytags_resolve_links = 1
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

let g:jedi#goto_command = '<leader>g'
let g:jedi#goto_assignments_command = '<leader>jf'
let g:jedi#documentation_command = '<leader>d'
let g:jedi#rename_command = '<leader>js'
let g:jedi#usages_command = '<leader>8'
let g:jedi#auto_close_doc = 0
let g:jedi#show_call_signatures = 2 " show signatures in cmd line
let g:jedi#show_call_signatures_delay = 100
let g:jedi#use_splits_not_buffers = 'right'
let g:jedi#force_py_version = 3
let g:pymode_options = 0
let g:pymode_options_max_line_length = 90 " it gets highlighting
let g:pymode_python = 'python3'
let g:pymode_folding = 0
let g:pymode_doc_bind = '<leader>pd'
let g:pymode_virtualenv = 0
let g:pymode_run_bind = '<leader>pr'
let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_lint = 0
let g:pymode_rope_lookup_project = 1
let g:pymode_rope_show_doc_bind = '<leader>rd'
let g:pymode_rope_completion = 0
let g:pymode_rope_goto_definition_bind = '<leader>o'
let g:pymode_rope_goto_definition_cmd = 'vnew'
let g:pymode_rope_rename_bind = '<leader>s'
let g:pymode_rope_rename_module_bind = '<leader>rsm'
let g:pymode_rope_organize_imports_bind = '<leader>roi'
let g:pymode_rope_autoimport_bind = '<leader>rai'
let g:pymode_rope_module_to_package_bind = '<leader>rmk'
let g:pymode_rope_extract_method_bind = '<leader>rem'
let g:pymode_rope_extract_variable_bind = '<leader>rev'
let g:pymode_rope_use_function_bind = '<leader>rf'
let g:pymode_rope_move_bind = '<leader>rm'
let g:pymode_rope_change_signature_bind = '<leader>rss'
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_docstring_level = 99
let g:impsort_relative_last = 1
" nvim's builtin python.vim
let g:python3_host_prog = '/usr/bin/python3'
let python_no_builtin_highlight = 1
let python_no_exception_highlight = 1
let python_no_doctest_highlight = 1
let python_no_doctest_code_highlight = 1
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tweekmonster/impsort.vim'

" TODO configure neco-vim
Plugin 'Shougo/neco-vim'

call vundle#end()
filetype plugin indent on
syntax enable

colorscheme base16-seti-ui
set background=dark
au VimEnter,Colorscheme * :hi pythonFunctionTag ctermfg=9 ctermbg=23
au VimEnter,Colorscheme * :hi pythonMethodTag ctermfg=12 ctermbg=23
au VimEnter,Colorscheme * :hi pythonClassTag ctermfg=11 ctermbg=23
au VimEnter,Colorscheme * :hi pythonImportedObject ctermfg=10 ctermbg=22
au VimEnter,Colorscheme * :hi pythonImportedFuncDef ctermfg=9 ctermbg=22
au VimEnter,Colorscheme * :hi pythonImportedClassDef ctermfg=11 ctermbg=22
au VimEnter,Colorscheme * :hi link perlFunctionTag pythonFunctionTag
au VimEnter,Colorscheme * :hi link vimAutoGroupTag pythonClassTag
au VimEnter,Colorscheme * :hi link vimCommandTag pythonFunctionTag
au VimEnter,Colorscheme * :hi link vimFuncNameTag pythonMethodTag
au VimEnter,Colorscheme * :hi link vimScriptFuncNameTag pythonMethodTag
au VimEnter,Colorscheme * :hi SignColumn ctermbg=25
au VimEnter,Colorscheme * :hi FoldColumn ctermbg=26
au VimEnter,Colorscheme * :hi Visual cterm=inverse ctermbg=233
au VimEnter,Colorscheme * :hi WildMenu cterm=bold ctermbg=236
au VimEnter,Colorscheme * :hi StatusLine ctermbg=234
au VimEnter,Colorscheme * :hi Search ctermbg=53 ctermfg=117
au VimEnter,Colorscheme * :hi MatchParen cterm=bold ctermbg=24 ctermfg=17
au VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=142
au VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=166
au VimEnter,Colorscheme * :hi CursorColumn ctermbg=235
au VimEnter,Colorscheme * :hi CursorLine cterm=bold ctermbg=237
au InsertLeave * :hi CursorLine cterm=bold ctermbg=237
au InsertEnter * :hi CursorLine cterm=NONE ctermbg=232

set autoindent
set backupdir=$HOME/.config/nvim/files/backup/
set cmdheight=2
set completeopt="menu,preview,longest"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
set nocursorcolumn
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
set matchpairs=(:),[:],{:},<:>
set mouse=a
set mousemodel=popup_setpos
set nonumber
set noshowmode
set scrolljump=2
set scrolloff=6
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
let g:denite_menus.git = {'description': 'git stuff'}
let g:denite_menus.git.command_candidates = [
    \['▷ git status       (Fugitive)    ', 'Gstatus'],
    \['▷ git diff         (Fugitive)    ', 'Gdiff'],
    \['▷ git commit       (Fugitive)    ', 'Gcommit'],
    \['▷ git log          (Fugitive)    ', 'Glog'],
    \['▷ git blame        (Fugitive)    ', 'Gblame'],
    \['▷ git stage        (Fugitive)    ', 'Gwrite'],
    \['▷ git checkout     (Fugitive)    ', 'Gread'],
    \['▷ git rm           (Fugitive)    ', 'Gremove'],
    \['▷ git push         (Fugitive)    ', 'Git! push'],
    \['▷ git pull         (Fugitive)    ', 'Git! pull'],
    \['▷ git cd           (Fugitive)    ', 'Gcd'],
    \['▷ preview hunk     (GitGutter)   ', 'GitGutterPreviewHunk'],
    \['▷ undo hunk        (GitGutter)   ', 'GitGutterUndoHunk'],
    \['▷ stage hunk       (GitGutter)   ', 'GitGutterStageHunk'],
    \]

let g:denite_menus.sh = {'description': 'shell cmds'}
let g:denite_menus.sh.command_candidates = [
            \['▷ Executable Permissions   ', 'Chmod 700'],
            \['▷ Readonly Permissions   ', 'Chmod 500'],
            \['▷ CD File:head   ', 'cd %:p:h'],
            \['▷ CD HOME   ', 'cd ~'],
            \['▷ Write File   ', 'w'],
            \['▷ Write and Exit   ', 'x'],
            \['▷ Sudo Write   ', 'SudoWrite'],
            \]


" Set shortcut keys.
"for [key, com] in items({
"            \   '<Leader>x' : '>:',
"            \   '<Leader>p' : '>!',
"            \   '<Leader>w' : '>',
"            \   '<Leader>q' : '>>',
"            \ })
"    execute 'nnoremap <silent>' key ':QuickRun' com '-mode n<CR>'
"    execute 'vnoremap <silent>' key ':QuickRun' com '-mode v<CR>'
"endfor
function! YRRunAfterMaps()
    au VimEnter * map     <silent><expr>j  v:count ? "j" : "\<Plug>(easymotion-j)"
    au VimEnter * map     <silent><expr>k  v:count ? "k" : "\<Plug>(easymotion-k)"
    au VimEnter * map     <silent><expr>f  v:count ? "f" : "\<Plug>(easymotion-bd-fl)"
    au VimEnter * map     <silent><expr>t  v:count ? "t" : "\<Plug>(easymotion-bd-tl)"
    au VimEnter * map     <silent><expr>w  v:count ? "w" : "\<Plug>(easymotion-bd-wl)"
    au VimEnter * map     <silent><expr>e  v:count ? "e" : "\<Plug>(easymotion-bd-el)"
    au VimEnter * map                   *  <Plug>(asterisk-z*)<Plug>(easymotion-bd-n)
    au VimEnter * map           <silent>s  <Plug>(easymotion-bd-f2)
    au VimEnter * map           <silent>K  <Plug>(easymotion-sol-bd-jk)
    au VimEnter * noremap <silent><expr>g/ incsearch#go(<SID>config_easyfuzzymotion())
    au VimEnter * nmap                  ?  <Plug>(incsearch-fuzzy-stay)
    au VimEnter * map                   S  <Plug>(asterisk-z*)<Plug>(easymotion-bd-n)
    au VimEnter * map                   #  <Plug>(asterisk-z#)<Plug>(easymotion-bd-n)
    au VimEnter * map                   g* <Plug>(asterisk-gz*)<Plug>(easymotion-bd-n)
    au VimEnter * map                   gS <Plug>(asterisk-gz*)<Plug>(easymotion-bd-n)
    au VimEnter * map                   g# <Plug>(asterisk-gz#)<Plug>(easymotion-bd-n)
    au VimEnter * nnoremap      <silent>/  :<C-U>Denite -cursor-wrap -vertical-preview line<CR>
    au VimEnter * nnoremap      <silent>F  :<C-U>Denite -cursor-wrap -vertical-preview grep<CR>
endfunction

nmap <unique><M-l> <Plug>MoveLineHalfPageDownzz
nmap <unique><M-h> <Plug>MoveLineHalfPageUpzz
vmap <unique><M-l> <Plug>MoveBlockHalfPageDownzz
vmap <unique><M-h> <Plug>MoveBlockHalfPageUpzz
nmap <unique><M-[> yil<Plug>unimpairedPutBelowk
nmap <unique><M-]> yil<Plug>unimpairedPutBelow
nmap <unique>[c    <Plug>NERDCommenterYank<Plug>unimpairedPutAbove
nmap <unique>]c    <Plug>NERDCommenterYank<Plug>unimpairedPutBelow
nmap <unique>[g    <Plug>GitGutterPrevHunk
nmap <unique>]g    <Plug>GitGutterNextHunk

nmap <unique>gcc  <Plug>NERDCommenterInvert
nmap <unique>gcl  <Plug>NERDCommenterAppend
nmap <unique>gcL  <Plug>NERDCommenterToEOL
nmap <unique>gcy  <Plug>NERDCommenterYank
xmap     <unique>gc        <Plug>NERDCommenterInvert
xmap     <unique>gC        <Plug>NERDCommenterComment
xmap     <unique>v         <Plug>(expand_region_expand)
cnoremap <unique>t/        Tabularize /./l1c1l0
omap <unique>ig    <Plug>GitGutterTextObjectInnerPending
omap <unique>ag    <Plug>GitGutterTextObjectOuterPending
xmap <unique>ig    <Plug>GitGutterTextObjectInnerVisual
xmap <unique>ag    <Plug>GitGutterTextObjectOuterVisual


smap <expr><unique><CR>
                    \ delimitMate#ShouldJump()            ? "\<Plug>delimitMateS-Tab" :
                    \ pumvisible()                        ? "\<Right>" :
                    \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_jump_or_expand)" :
                    \ delimitMate#WithinEmptyPair()       ? "\<Plug>delimitMateCR" :
                    \ "\<C-C>"

imap <expr><unique><CR>
                      \ delimitMate#ShouldJump()            ? "\<Plug>delimitMateS-Tab" :
                      \ pumvisible()                        ? "\<Right>" :
                      \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_jump_or_expand)" :
                      \ delimitMate#WithinEmptyPair()       ? "\<Plug>delimitMateCR" :
                      \ "\<C-C>"

noremap  <unique>gs      ^
noremap  <unique>gl      $
nnoremap <unique><C-S>   5<C-Y>
nnoremap <unique><C-E>   5<C-E>
xnoremap <unique>J       <esc>
inoremap <unique>jf      <esc>
inoremap <unique>fj      <esc>
inoremap <unique><C-C>   <esc>
nnoremap  <silent><unique><C-W>h    :<C-U>TmuxNavigateLeft<CR>
nnoremap  <silent><unique><C-W>j    :<C-U>TmuxNavigateDown<CR>
nnoremap  <silent><unique><C-W>k    :<C-U>TmuxNavigateUp<CR>
nnoremap  <silent><unique><C-W>l    :<C-U>TmuxNavigateRight<CR>

xmap     <unique><CR>      <Plug>NrrwrgnDo
imap     <unique><C-L>     <Plug>delimitMateS-Tab
nnoremap  <silent><unique><C-L>     :<C-U>TmuxNavigatePrevious<CR>
nmap <unique><CR> <Plug>unimpairedBlankDown
nnoremap <unique><Space> <C-O>
nnoremap  <silent><unique><C-T>    g<C-]>
inoremap  <silent><unique><F4>     <esc>:<C-U>w<CR>
nnoremap  <silent><unique><F4>     :<C-U>w<CR>
nnoremap  <silent><unique><C-J>     :<C-U>w<CR>
nnoremap  <silent><unique><C-]>    :<C-U>ta<CR>
nnoremap  <silent><unique><C-[>    :<C-U>po<CR>

let g:mapleader=","
nmap             <unique><leader>1       <Plug>AirlineSelectTab1
nmap             <unique><leader>2       <Plug>AirlineSelectTab2
nmap             <unique><leader>3       <Plug>AirlineSelectTab3
nmap             <unique><leader>4       <Plug>AirlineSelectTab4
nmap             <unique><leader>5       <Plug>AirlineSelectTab5
nmap             <unique><leader>6       <Plug>AirlineSelectTab6
nmap             <unique><leader>7       <Plug>AirlineSelectTab7
nmap             <unique><leader>8       <Plug>AirlineSelectTab8
nmap             <unique><leader>9       <Plug>AirlineSelectTab9
nmap             <unique><leader>h       <Plug>AirlineSelectPrevTab
nmap             <unique><leader>l       <Plug>AirlineSelectNextTab
nmap     <silent><unique><leader><CR>    :<C-U>NW<CR>
nnoremap         <unique><leader>/       /
nnoremap         <unique><leader>z       zjzA
nnoremap <silent><unique><leader>r       :<C-U>nohlsearch<CR>:<C-U>diffupdate<CR>: syntax sync fromstart<CR><c-l>
nmap             <unique><leader><Space> <Plug>(easymotion-bd-n)
nnoremap         <unique><leader>v       <C-V>
nnoremap         <unique><Leader><leader>       qj
nnoremap         <unique><leader>.       @j
noremap  <silent><unique><leader>q       :<C-U>q<CR>
noremap  <silent><unique><leader>d       :<C-U>hide<CR>
nnoremap <silent><unique><leader>sv      :<C-U>vs<CR>
nnoremap <silent><unique><leader>sh      :<C-U>sp<CR>


let g:mapleader=';'
nmap              <unique><leader><CR>     <Plug>NrrwrgnWinIncr
nnoremap  <silent><unique><leader><leader> :exe "tabn ".g:lasttab<CR>
nnoremap  <silent><unique><leader><Space>  :Startify<CR>
nnoremap  <silent><unique><leader>q        :Denite -cursor-wrap -vertical-preview unite:quickfix<CR>
nnoremap  <silent><unique><leader>f        :Denite -cursor-wrap -vertical-preview file_rec<CR>
nnoremap  <silent><unique><leader>F        :Denite -cursor-wrap -vertical-preview file_rec:~<CR>
nnoremap  <silent><unique><leader>o        :Denite -cursor-wrap -vertical-preview outline<CR>
nnoremap  <silent><unique><leader>l        :Denite -cursor-wrap -vertical-preview unite:location_list<CR>
nnoremap  <silent><unique><leader>d        :Denite -cursor-wrap -vertical-preview directory_rec<CR>
nnoremap  <silent><unique><leader>D        :Denite -cursor-wrap -vertical-preview directory_rec:~<CR>
nnoremap  <silent><unique><leader>b        :Denite -cursor-wrap -vertical-preview buffer<CR>
nnoremap  <silent><unique><leader>h        :Denite -cursor-wrap -vertical-preview help<CR>
nnoremap  <silent><unique><leader>g        :Denite -cursor-wrap -vertical-preview menu:git<CR>
nnoremap  <silent><unique><leader>s        :Denite -cursor-wrap -vertical-preview menu:sh<CR>
nnoremap  <silent><unique><leader>m        :Denite -cursor-wrap -vertical-preview unite:file_mru<CR>
noremap   <silent><unique><leader>:        :Denite -cursor-wrap -vertical-preview command<CR>
nnoremap  <silent><unique><leader>y        :YRShow<CR>
nnoremap  <silent><unique><leader>u        :UndotreeToggle<CR>
nnoremap  <silent><unique><leader>n        :<C-U>echo(system("tmux if -F '#{s/1/0/:window_panes}' 'join-pane -d -s:2.{top} -t:+' 'join-pane -vb -p 40 -t:2 -s:+.{bottom}'"))<CR>
nmap              <unique><leader>t        <Plug>TaskListjj

let g:mapleader='-'
function g:Undotree_CustomMap()
    nmap <buffer>K <plug>UndotreeGoNextState
    nmap <buffer>J <plug>UndotreeGoPreviousState
    nmap <buffer>N <plug>UndotreeGoNextSaved
    nmap <buffer>P <plug>UndotreeGoPreviousSaved
endfunc

au FileType    tex,plaintex       imap <buffer><Leader>]  <Plug>LatexCloseCurEnv
au FileType    tex,plaintex       nmap <buffer><Leader>*  <Plug>LatexToggleStarEnv
au FileType    tex,plaintex       nmap <buffer><Leader>ce <Plug>LatexChangeEnv
au FileType    tex,plaintex       vmap <buffer><Leader>}  <Plug>LatexWrapSelection
au FileType    tex,plaintex       vmap <buffer><Leader>se <Plug>LatexEnvWrapSelection
au FileType    python             nmap <buffer><leader>f  :call pymode#rope#find_it()<CR>

au VimEnter    *                  :call denite#custom#var('grep', 'command', ['rg'])
au VimEnter    *                  :call denite#custom#var('grep', 'default_ops', ['--vimgrep', '--no-heading', '--hidden', '-SL', '--glob', '!.git', '--glob', '!.gitignore', '--glob', '!.gitsubmodules', '--glob', '!.cache'])
au VimEnter    *                  :call denite#custom#var('grep', 'recursive_opts', [])
au VimEnter    *                  :call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
au VimEnter    *                  :call denite#custom#var('grep', 'separator', ['--'])
au VimEnter    *                  :call denite#custom#var('grep', 'final_opts', [])
au VimEnter    *                  :call denite#custom#map( 'insert', '<C-j>', '<denite:move_to_next_line>', 'noremap' )
au VimEnter    *                  :call denite#custom#map( 'insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
au VimEnter    *                  :call denite#custom#var('file_rec', 'command', ['rg', '--files', '--follow', '--hidden', '--glob', '!.git', '--glob', '!.gitignore', '--glob', '!.gitsubmodules', '--glob', '!.cache'])
au VimEnter    *                  :call denite#custom#var('menu', 'menus', g:denite_menus)
au VimEnter    *                  :call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
au VimEnter    *                  :call deoplete#custom#set('_', 'converters', ['converter_auto_paren', 'converter_remove_overlap', 'converter_truncate_abbr', 'converter_truncate_menu'])

au WinEnter    *                  set   cursorline
au WinLeave    *                  set   nocursorline
au InsertEnter *                  setlocal timeoutlen=300
au InsertLeave *                  setlocal timeoutlen=2000
au VimEnter    *                  let   g:lasttab = tabpagenr()
au TabLeave    *                  let   g:lasttab = tabpagenr()
au VimEnter    *                  command! -nargs=* -bar -complete=customlist,man#completion#run Man call man#get_page('tab', <f-args>)
au WinEnter    *                  AirlineRefresh
au BufEnter    *                  filetype detect
au BufWinEnter *                  if &previewwindow | setlocal nonumber | endif
au BufReadPost *                  if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
au FileType    python             let b:delimitMate_nesting_quotes = ['"']
au FileType    python             let b:delimitMate_expand_inside_quotes = 1
au FileType    python,perl        let b:delimitMate_excluded_regions = ""
au FileType    perl               let b:delimitmate_insert_eol_marker = 1
au FileType    perl               let b:delimitMate_eol_marker = ";"
au VimEnter    perl,python nested :call tagbar#autoopen(1)
au BufWinEnter perl,python nested :call tagbar#autoopen(1)
au FileType    python             let b:match_words = '\<def\>:\<return\>,\<if\>:\<elif\>:\<else\>,\<try\>:\<except\>,\<from\>:\<import\>'
au FileType    python             setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr foldlevel=3 nonumber
au FileType    python             setlocal define=^\s*\\(def\\\\|class\\) commentstring=#%s nowrap formatoptions-=t complete+=t
au FileType    vim,man            if &foldmethod == "manual" | setlocal foldmethod=syntax | endif
au FileType    man                setlocal nocursorline
