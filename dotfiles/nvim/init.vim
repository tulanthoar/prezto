"init on 2016-05-26
if &cp | se nocp | endif
let g:loaded_gzip = 1
let g:loaded_man = 1
let g:loaded_tarPlugin = "v29"
let g:loaded_2html_plugin = "vim7.4_v2"
let g:loaded_zipPlugin = "v27"
filet off
let g:mapleader="-"
se rtp+=$HOME/.config/nvim/bundle/Vundle.vim
cal vundle#begin("$HOME/.config/nvim/bundle")
" preamble&end

Plugin 'VundleVim/Vundle.vim'

let g:targets_pairs = "()b {}B []a <>A"
let g:targets_quotes = "\"Q 'q `"
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-textobj-user'
Plugin 'wellle/targets.vim'

Plugin 'tpope/vim-eunuch'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-abolish'

Plugin 'tpope/vim-unimpaired.git'

" XXX tabular
Plugin 'godlygeek/tabular'

" XXX asterisk
Plugin 'haya14busa/vim-asterisk'

Plugin 'nelstrom/vim-visual-star-search'

Plugin 'benmills/vimux'

" XXX sidesearch
Plugin 'ddrscott/vim-side-search'

" XXX swap
let g:swap_no_default_key_mappings = 1
Plugin 'machakann/vim-swap'

let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>",]
let g:list_of_visual_keys = ["h", "gj", "gk", "l", "-", "+", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>",]
let g:list_of_normal_keys = g:list_of_visual_keys
let g:hardtime_maxcount = 2
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
Plugin 'takac/vim-hardtime'

au VimEnter * com! -nargs=+ -bar -complete=customlist,man#completion#run
            \ Man call man#get_page('tab', <f-args>)
Plugin 'vim-utils/vim-man'

let g:highlightedyank_highlight_duration = -1
Plugin 'machakann/vim-highlightedyank'

let g:formatters_python = ["yapf"]
let g:autoformat_autoindent = 0 " don't use vims formatter for indentation
Plugin 'Chiel92/vim-autoformat'

let g:rbpt_colorpairs = [ ["1", "#4B5056"], ["4",  "#4B5056"],
            \ ["3", "#4B5056"], ["2", "#4B5056"], ["16", "#4B5056"], ]
au BufEnter * cal rainbow_parentheses#load(0)
au BufEnter * cal rainbow_parentheses#load(1)
au BufEnter * cal rainbow_parentheses#load(2)
au BufEnter * cal rainbow_parentheses#activate()
Plugin 'kien/rainbow_parentheses.vim'

let g:Tlist_Auto_Open = 1
let g:Tlist_Close_On_Select = 1
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Process_File_Always = 1
let g:Tlist_File_Fold_Auto_Close = 1
let g:Tlist_WinWidth = 30
let g:Tlist_Compact_Format = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Display_Prototype = 1
let g:Tlist_Auto_Update = 1
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Highlight_Tag_On_BufEnter = 1
let g:Tlist_Inc_Winwidth = 0
Plugin 'vim-scripts/taglist.vim'

au VimEnter * cal extend(g:volatile_ftypes, ["taglist", "rst",])
Plugin 'kopischke/vim-stay'

let g:echodoc_enable_at_startup = 1
Plugin 'Shougo/echodoc.vim'

let g:indentLine_setColors = 0
let g:indentLine_char = "┴"
let g:indentLine_indentLevel = 10
let g:indentLine_first_char = "╠"
let g:indentLine_showFirstIndentLevel = "1"
let g:indentLine_fileType = ["vim", "perl", "python",]
let g:indentLine_faster = 1
let g:indentLine_concealcursor="inc"
let g:indentLine_leadingSpaceChar = "◦"
let g:indentLine_leadingSpaceEnabled = 0
Plugin 'Yggdroot/indentLine'

let g:ctrlp_cmd = "CtrlPBufTagAll"
let g:ctrlp_match_window = "order:ttb"
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = "et"
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = "ag %s -l --nocolor -g \"\""
let g:ctrlp_types = ["fil", "mru"]
let g:ctrlp_tilde_homedir = 1
let g:ctrlp_brief_prompt = 1
let g:ctrlp_extensions = ["buffertag", "quickfix", "rtscript", ]
Plugin 'ctrlpvim/ctrlp.vim'

let g:easytags_async = 1
let g:easytags_by_filetype = expand("$HOME/.config/nvim/files/easy_tags")
let g:easytags_events = ["BufWritePost", "BufWinEnter",]
let g:easytags_include_members = 1
let g:easytags_resolve_links = 1
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

Plugin 'osyo-manga/unite-quickfix'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/denite.nvim'

let g:multi_cursor_next_key="\<C-h>"
let g:multi_cursor_prev_key="\<C-p>"
let g:multi_cursor_skip_key="\<C-x>"
let g:multi_cursor_quit_key="\<Esc>"
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_visual_maps = {"i":1,"a":1,"f":1,"t":1,}
function g:Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
endfunction
Plugin 'terryma/vim-multiple-cursors'

let g:NERDCreateDefaultMappings = 0
let g:NERDRemoveExtraSpaces = 1
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
Plugin 'scrooloose/nerdcommenter'

let g:startify_session_dir = "~/.config/nvim/files/session"
let g:startify_list_order = [ "files", "dir", "bookmarks", "commands", "sessions", ]
let g:startify_files_number = 6
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_sort = 1
Plugin 'mhinz/vim-startify'

let g:surround_indent = 1
Plugin 'tpope/vim-surround'

let g:tlWindowPosition = 1
Plugin 'vim-scripts/TaskList.vim'

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#expand_word_boundary = 1
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/neosnippet'

let g:tex_fold_enabled=1
let g:vimsyn_folding="af"
let g:perl_fold = 1
let g:fastfold_savehook = 1
let g:fastfold_skip_filetypes = [ "taglist", "gitcommit", "startify", "man", "rst", ]
Plugin 'Konfekt/FastFold'

let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1
Plugin 'christoomey/vim-tmux-navigator'

let g:SignatureDeleteConfirmation = 1
let g:SignatureForceMarkPlacement = 1
let g:SignatureForceMarkerPlacement = 1
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
Plugin 'kshenoy/vim-signature'

let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0
Plugin 'airblade/vim-gitgutter',

let g:move_map_keys = 0
Plugin 'matze/vim-move'

let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_keys = "ASDFGHJKLQWERUIO;"
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
Plugin 'easymotion/vim-easymotion'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#delimiters = ["/", "(",]
au FileType python let g:deoplete#delimiters = ["/", ".", "(",]
au FileType perl   let g:deoplete#delimiters = ["/", "->", "(", "::", "$", "@", "%",]
au FileType vim    let g:deoplete#delimiters = ["/", ":", "(", "'",]
let g:deoplete#auto_complete_delay = 25
let g:deoplete#auto_refresh_delay = 35
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#tag#cache_limit_size = 5000000
if !exists("g:deoplete#sources") | let g:deoplete#sources = {} | endif
let g:deoplete#sources._ = ["file", "around", "tag", "neosnippet", "member", "buffer", "syntax", "include",]
let g:deoplete#sources.python = g:deoplete#sources._ + [ "jedi", ]
let g:deoplete#sources.perl = g:deoplete#sources._ + [ "omni", ]
let g:deoplete#sources.vim = g:deoplete#sources._ + [ "vim", ]
let g:deoplete#sources.haskell = g:deoplete#sources._ + [ "ghc", ]
if !exists("g:deoplete#omni#input_patterns") | let g:deoplete#omni#input_patterns = {} | endif
let g:deoplete#omni#input_patterns.perl = ["[a-zA-Z_]\+->",]
if !exists("g:deoplete#omni#functions") | let g:deoplete#omni#functions = {} | endif
let g:deoplete#omni#functions.perl = "PerlComplete"
if !exists("g:neoinclude#reverse_exprs") | let g:neoinclude#reverse_exprs = {} | endif
let g:neoinclude#reverse_exprs.perl = "fnamemodify(substitute(v:fname, \"/\", \"::\", \"g\"), \":r\")"
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#worker_threads = 2
let g:deoplete#sources#jedi#python_path = "/usr/bin/python3"
au FileType * cal deoplete#custom#set("file", "rank", 159)
au FileType python  cal deoplete#custom#set("jedi", "rank", 99)
au FileType perl    cal deoplete#custom#set("omni", "rank", 99)
au FileType vim     cal deoplete#custom#set("vim", "rank", 99)
au FileType haskell cal deoplete#custom#set("ghc", "rank", 99)
au FileType * cal deoplete#custom#set("around", "rank", 89)
au FileType * cal deoplete#custom#set("tag", "rank", 85)
au FileType * cal deoplete#custom#set("neosnippet", "rank", 84)
au FileType * cal deoplete#custom#set("member", "rank", 83)
au FileType * cal deoplete#custom#set("buffer", "rank", 81)
au FileType * cal deoplete#custom#set("syntax", "rank", 80)
au FileType * cal deoplete#custom#set("include", "rank", 79)
au VimEnter * cal deoplete#custom#set("_", "matchers", ["matcher_fuzzy",])
Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'SevereOverfl0w/deoplete-github'
Plugin 'Shougo/context_filetype.vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'Shougo/deoplete.nvim'

let g:base16colorspace=256
Plugin 'chriskempson/base16-vim'

let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string="utf-8[unix]"
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#excludes = [ "pydir.log", "pyrun.log", "'__doc__'",]
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffers_label = "b"
let g:airline#extensions#tabline#tabs_label = "t"
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#checks = ["indent", "trailing", "long", "mixed-indent-file",]
let g:airline#extensions#whitespace#symbol = ""
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme = "kolor"
if !exists("g:airline_symbols") | let g:airline_symbols = {} | endif
let g:airline_symbols.maxlinenr = ""
function! AirlineInit()
    let g:airline_section_b = airline#section#create(["%{fnamemodify(getcwd(), \":p:~\")}"])
    let g:airline_section_c = airline#section#create(["%{bufname(\"%\")} (%{fnamemodify(bufname(winbufnr(g:lastwin)), \":p:t\")})"])
    if winwidth(0) > 80
        let g:airline_section_z = airline#section#create( [ "windowswap", "obsession", "linenr", "maxlinenr", ":%2v" ] )
    else
        let g:airline_section_z = airline#section#create([ "linenr", ":%3v"])
    endif
endfunction
au User AirlineAfterInit cal AirlineInit()
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mkitt/tabline.vim'
Plugin 'bling/vim-airline'

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
au FileType python let b:delimitMate_nesting_quotes = ["\"",]
au FileType python let b:delimitMate_expand_inside_quotes = 1
au FileType perl   let b:delimitmate_insert_eol_marker = 1
au FileType perl   let b:delimitMate_eol_marker = ";"
Plugin 'Raimondi/delimitMate'

let g:undotree_SplitWidth = 40
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_DiffpanelHeight = 15
Plugin 'mbbill/undotree'

let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1
let g:nrrw_rgn_wdth = 80
let g:nrrw_rgn_vert = 1
let b:nrrw_aucmd_written = ":update"
Plugin 'chrisbra/NrrwRgn'

let g:yankring_min_element_length = 2
let g:yankring_max_element_length = 0
let g:yankring_map_dot = 0
let g:yankring_history_dir = "$HOME/.config/nvim/files"
let g:yankring_manual_clipboard_check = 1
let g:yankring_n_keys = ""
let g:yankring_o_keys = ""
let g:yankring_v_key = ""
let g:yankring_del_v_key = ""
let g:yankring_zap_keys = ""
let g:yankring_replace_n_nkey = "\<C-o>"
let g:yankring_replace_n_pkey = "\<C-l>"
let g:yankring_window_height = 12
au TextYankPost * YRPush
function! YRRunAfterMaps()
    nun @
endfunction
Plugin 'vim-scripts/YankRing.vim'

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 0
let g:syntastic_python_checkers = ["pylint",]
Plugin 'scrooloose/syntastic'

let g:expand_region_text_objects = { "iw":0, "iW":0, "i\"":0, "a\"":0, "i'":0, "a'":0, "ib":1, "ab":1, "i]":1, "iB":1, "il":0, "ii":1, "ai":1, "ip":0, "ie":0, }
let g:expand_region_text_objects_python = { "iA":0, "iB":0, "ai":1, }
Plugin 'terryma/vim-expand-region'

" TODO configure LaTeXBox
let g:LatexBox_completion_close_braces = 1
let g:LatexBox_bibtex_wild_spaces = 1
let g:LatexBox_complete_inlineMath = 1
let g:LatexBox_latexmk_async = 1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 2
let g:LatexBox_fold_automatic = 1
let g:LatexBox_viewer = "evince"
let g:tex_flavor = "latex"
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" TODO configure perl templates
let g:tlist_perl_settings = "perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD;t:Keyword Comments"
let g:Templates_InternetBrowserExec = "chromium"
let g:Perl_CustomTemplateFile = expand("${ZDOTD}/nvim/bundle/perl-support/templates/perl.templates")
let g:Perl_LoadMenus = "no"
let g:Perl_Ctrl_j = "on"
let g:Perl_PerlTags = "on"
Plugin 'vim-perl/vim-perl'
Plugin 'c9s/perlomni.vim'
Plugin 'WolfgangMehner/perl-support'

let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_indent_if = 3
let g:haskell_indent_case = 2
let g:haskell_indent_let = 4
let g:haskell_indent_where = 6
let g:haskell_indent_do = 3
let g:haskell_indent_in = 1
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2
let g:haddock_browser = "/usr/bin/chromium"
let g:haskellmode_completion_ghc = 0
let g:necoghc_enable_detailed_browse = 1
Plugin 'eagletmt/neco-ghc'
Plugin 'neovimhaskell/haskell-vim.git'

let g:jedi#completions_command = ""
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "\<leader>g"
let g:jedi#goto_assignments_command = "\<leader>jf"
let g:jedi#documentation_command = "\<leader>d"
let g:jedi#rename_command = "\<leader>js"
let g:jedi#usages_command = "\<leader>8"
let g:jedi#auto_close_doc = 0
let g:jedi#use_splits_not_buffers = "winwidth"
let g:jedi#completions_enabled = 0
let g:jedi#force_py_version = 3
let g:pymode_options = 0
let g:pymode_options_max_line_length = 90
let g:pymode_python = "python3"
let g:pymode_folding = 0
let g:pymode_doc_bind = "\<leader>pd"
let g:pymode_virtualenv = 0
let g:pymode_run_bind = "\<leader>pr"
let g:pymode_breakpoint_bind = "\<leader>pb"
let g:pymode_lint = 0
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_show_doc_bind = "\<leader>rd"
let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_goto_definition_bind = "\<leader>o"
let g:pymode_rope_goto_definition_cmd = "vnew"
let g:pymode_rope_rename_bind = "\<leader>s"
let g:pymode_rope_rename_module_bind = "\<leader>rsm"
let g:pymode_rope_organize_imports_bind = "\<leader>roi"
let g:pymode_rope_autoimport_bind = "\<leader>rai"
let g:pymode_rope_module_to_package_bind = "\<leader>rmk"
let g:pymode_rope_extract_method_bind = "\<leader>rem"
let g:pymode_rope_extract_variable_bind = "\<leader>rev"
let g:pymode_rope_use_function_bind = "\<leader>rf"
let g:pymode_rope_move_bind = "\<leader>rm"
let g:pymode_rope_change_signature_bind = "\<leader>rss"
let g:pymode_syntax = 1
let g:pymode_syntax_slow_sync = 1
let g:pymode_syntax_all = 1
let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_docstring_level = 99
let g:impsort_relative_last = 1
let g:impsort_textwidth = g:pymode_options_max_line_length
let g:impsort_highlight_star_imports = 1
" nvim's builtin python.vim
let g:python3_host_prog = "/usr/bin/python3"
let g:python_no_builtin_highlight = 1
let g:python_no_exception_highlight = 1
let g:python_no_doctest_highlight = 1
let g:python_no_doctest_code_highlight = 1
au FileType python setl fde=SimpylFold(v:lnum) fdm=expr fdl=3 nonu
au FileType python setl def=^\s*\\(def\\\\|class\\) cms=#%s nowrap fo-=t cpt+=t
au FileType python let b:match_words = "def:return,if:elif:else,try:except,from:import"
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tweekmonster/impsort.vim'
Plugin 'klen/python-mode'

" keep this one last
Plugin 'ryanoasis/vim-devicons'

" Plugins&end
cal vundle#end()

filetype plugin indent on
syntax enable
colorscheme base16-seti-ui

set background=dark
set backupdir=${HOME}/.config/nvim/files/backup/
set cmdheight=2
set colorcolumn=+1
set completeopt=menuone,noselect,preview
set conceallevel=2
set concealcursor=inc
set cpoptions+=DEI$
set cursorcolumn
set directory=${HOME}/.config/nvim/files/swap/
set errorbells
set expandtab
set fileformats=unix
set foldclose=all
set foldlevelstart=2
set foldminlines=3
set foldopen+=insert
set gdefault
set hidden
set helpheight=30
set ignorecase
set isfname+={,}
set list
set listchars=tab:>┈,trail:┅,nbsp:+,extends:╡,precedes:╞,eol:┊,space:⋅
set matchpairs=(:),[:],{:},<:>
set matchtime=2
set previewheight=15
set scrolljump=4
set scrolloff=6
set shiftround
set shiftwidth=0
set showcmd
set showmatch
set noshowmode
set showtabline=0
set sidescroll=4
set sidescrolloff=2
set smartcase
set nostartofline
set softtabstop=4
set tabstop=4
set tagcase=match
set tags+=./perltags,${HOME}/.config/nvim/files/easy_tags/perl,${HOME}/.config/nvim/files/easy_tags/vim,${HOME}/.config/nvim/files/easy_tags/python
set timeoutlen=1000
set undodir=${HOME}/.config/nvim/files/.undo/
set undofile
set updatetime=2000
set viewoptions=cursor,folds,slash,unix
set virtualedit=block
set visualbell
set shada='100,h,s1000,n${HOME}/.config/nvim/files/info/viminfo
set whichwrap+=<,>,h,l
set wildignore=*.o,*~,*.pyc
set wildmode=list:longest,list:full
set nowrap

exe 'au FileType haskell,vim,perl,python sy match IndentLine /^ / contained conceal cchar='.g:indentLine_first_char
exe 'au FileType vim,perl,python sy match IndentLineSpace /^ \+/ containedin=TOP contained contains=IndentLine conceal cchar='.g:indentLine_leadingSpaceChar
exe 'au FileType haskell sy match IndentLineSpace /^ \+/ containedin=TOP contains=IndentLine conceal cchar='.g:indentLine_leadingSpaceChar

au WinLeave * se nocursorcolumn
au WinEnter * se cursorcolumn

au InsertEnter * setl timeoutlen=500
au InsertLeave * setl timeoutlen=1000

let g:lastwin = 1
au WinLeave /*/[^\[]*[^\]] let g:lastwin = winnr()

let g:startify_bookmarks = [ { 'n': '~/.config/nvim/init.vim' }, ]
let g:startify_commands = [
            \   { 'h':['help', 'Denite -cursor-wrap help'] },
            \   { 'f':['all files', 'Denite -cursor-wrap file_rec:~'] },
            \   { 'c':['cmds', 'Denite -cursor-wrap commands'] },
            \   { 'P':['Plugins Update', 'PluginUpdate'] }, ]

for [k, c] in items({ "\<C-J>" : "\<denite:move_to_next_line>",
            \ "\<C-K>" : "\<denite:move_to_previous_line>", })
    exe "au VimEnter * cal denite#custom#map('insert','".k."','".c."','noremap')"
endfor

if !exists("g:denite_menus") | let g:denite_menus = {} | endif
let g:denite_menus.git = {'description': 'git stuff'}
let g:denite_menus.git.command_candidates = [
            \['▷ preview hunk ', 'GitGutterPreviewHunk'],
            \['▷ undo hunk    ', 'GitGutterUndoHunk'],
            \['▷ stage hunk   ', 'GitGutterStageHunk'],
            \['▷ git status   ', 'Gstatus'],
            \['▷ git diff     ', 'Gdiff'],
            \['▷ git commit   ', 'Gcommit'],
            \['▷ git log      ', 'Glog'],
            \['▷ git blame    ', 'Gblame'],
            \['▷ git stage    ', 'Gwrite'],
            \['▷ git checkout ', 'Gread'],
            \['▷ git rm       ', 'Gremove'],
            \['▷ git push     ', 'Git! push'],
            \['▷ git pull     ', 'Git! pull'],
            \['▷ git cd       ', 'Gcd'],
            \]

au VimEnter * cal denite#custom#var('menu', 'menus', g:denite_menus)
au VimEnter * cal denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" settings&end

hi HighlightedyankRegion  ctermbg=28
hi pythonFunctionTag      ctermbg=23  cterm=bold ctermfg=9
hi pythonMethodTag        ctermbg=23  cterm=bold ctermfg=12
hi pythonClassTag         ctermbg=23  cterm=bold ctermfg=11
hi pythonImportedObject   ctermbg=22  cterm=bold ctermfg=10
hi pythonImportedFuncDef  ctermbg=22  cterm=bold ctermfg=9
hi pythonImportedClassDef ctermbg=22  cterm=bold ctermfg=11
hi SignColumn             ctermbg=25
hi FoldColumn             ctermbg=26
hi Visual                 ctermbg=233 cterm=inverse
hi WildMenu               ctermbg=236 cterm=bold
hi StatusLine             ctermbg=234
hi Search                 ctermbg=53  ctermfg=117
hi MatchParen             ctermbg=20  ctermfg=25
hi Conceal                            ctermfg=27
hi CursorColumn           ctermbg=29

hi link perlFunctionTag      pythonFunctionTag
hi link vimAutoGroupTag      pythonClassTag
hi link vimCommandTag        pythonFunctionTag
hi link vimFuncNameTag       pythonMethodTag
hi link vimScriptFuncNameTag pythonMethodTag

" colorscheme&end

cnoreabbrev T//  Tabularize //l1c1l0<left><left><left><left><left><left><left><c-h>
cnoreabbrev w!!  SudoWrite

for [k, c] in items({
            \ 'w': 'bd-wl',
            \ 'f': 'bd-fl',
            \ 't': 'bd-tl',
            \ 'j': 'bd-jk',
            \ 'k': 'bd-jk', })
    exe 'map <expr><unique>'.k.' v:count ? "'.k.'" : "\<Plug>(easymotion-'.c.')"'
endfor

for [k, c] in items({
            \ 'e': 'bd-el', })
    exe 'nm <expr><unique>'.k.' v:count ? "'.k.'" : "\<Plug>(easymotion-'.c.')"'
    exe 'xm <expr><unique>'.k.' v:count ? "'.k.'" : "\<Plug>(easymotion-'.c.')"'
    exe 'om <expr><unique>'.k.' v:count ? "'.k.'" : "v\<Plug>(easymotion-'.c.')"'
endfor

for [k, c] in items({
            \ 's': 'bd-f2',
            \ 'K': 'overwin-line', })
    exe 'map <unique>'.k.' <Plug>(easymotion-'.c.')'
endfor

for [k, c] in items({
            \ '*': 'z*',
            \ 'S': 'z*',
            \ '#': 'z#',
            \ 'g*': 'gz*',
            \ 'gS': 'gz*',
            \ 'g#': 'gz#', })
    exe 'nm <unique>'.k.' <Plug>(asterisk-'.c.')<Plug>(easymotion-bd-n)'
    exe 'om <unique>'.k.' <Plug>(asterisk-'.c.')<Plug>(easymotion-bd-n)'
endfor

for m in ['im', 'smap']
    exe m.' <expr><unique><CR> '.
                \ 'neosnippet#expandable_or_jumpable() ? "\<C-G>u\<Plug>(neosnippet_jump_or_expand)" :'.
                \ 'delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : '.
                \ '"\<CR>"'
endfor

inoremap <silent><expr><unique><C-K>   pumvisible() ? "\<C-P>" : "\<Del>"
inoremap <silent><expr><unique><C-J>   pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <silent><expr><unique><Space> pumvisible() ? "\<Left>\<Right>" : "\<Space>"
imap     <silent><expr><unique><Tab>   delimitMate#ShouldJump() ? "\<Plug>delimitMateS-Tab" : "\<C-t>"
inoremap               <unique><s-Tab> <C-d>

for m in ['nm', 'xm', 'om',]
    exe m.' <unique><tab> %'
endfor
snoremap <unique><Tab> <C-O>%
nn <silent><expr><unique><S-Tab> winnr() == g:lastwin ? "\<c-w>W" : ":exe g:lastwin.'wincmd w'\<CR>"

nm <unique><M-e> <Plug>MoveLineDown
nm <unique><M-s> <Plug>MoveLineUp
nm <unique><M-[> yil<Plug>unimpairedPutBelowgk
nm <unique><M-]> yil<Plug>unimpairedPutBelow
nm <unique>[c    <Plug>NERDCommenterYank<Plug>unimpairedPutAbove
nm <unique>]c    <Plug>NERDCommenterYank<Plug>unimpairedPutBelow
nm <unique>[g    <Plug>GitGutterPrevHunk
nm <unique>]g    <Plug>GitGutterNextHunk
om <unique>ig    <Plug>GitGutterTextObjectInnerPending
om <unique>ag    <Plug>GitGutterTextObjectOuterPending
xm <unique>ig    <Plug>GitGutterTextObjectInnerVisual
xm <unique>ag    <Plug>GitGutterTextObjectOuterVisual

nnoremap <unique>'[ `[
nnoremap <unique>'] `]
nnoremap <unique>'< `<
nnoremap <unique>'> `>
nnoremap <unique>`[ '[
nnoremap <unique>`] ']
nnoremap <unique>`< '<
nnoremap <unique>`> '>

nnoremap <unique>F     :SideSearch <C-r><C-w><CR> | wincmd p
nnoremap <unique>Q    :Autoformat<CR>
xmap     <unique>v     <Plug>(expand_region_expand)
xmap <unique><CR> <Plug>NrrwrgnDo
xmap <unique>gc   <Plug>NERDCommenterInvert
xmap <unique>gC   <Plug>NERDCommenterComment
nm <unique>g<   <Plug>(swap-prev)
nm <unique>g>   <Plug>(swap-next)
no <unique>gs   ^
no <unique>gl   $

for [k, c] in items({
            \ 'c' : 'Invert',
            \ 'l' : 'Append',
            \ 'y' : 'Yank',
            \ 'L' : 'ToEOL', })
    exe 'nmap <unique>gc'.k.' <Plug>NERDCommenter'.c
endfor

nnoremap <unique>P  gP
nnoremap <unique>v     viw
nnoremap <unique><C-S> 5<C-Y>
inoremap <unique><C-S> <C-Y>
nnoremap <unique><C-E> 5<C-E>
nnoremap <unique>D     <c-d>
nnoremap <unique>U     <c-u>
nnoremap <unique>B     <c-b>
xnoremap <unique>J     <esc>
inoremap <unique>jf    <esc>
inoremap <unique>fj    <esc>

xn <unique>S<Space>  c<Space><C-R>"<Space><C-C>
nn <unique><c-Space> <C-I>
ino <unique><c-Space> <C-@>
nn <unique><Space>   <C-O>
nn <unique><c-t>     g<C-]>
nn <unique><C-K>     :w<CR>
nn <unique><M-n>     :ta<CR>
nn <unique><M-b>     :po<CR>

let g:mapleader=","
nm         <unique><leader>h       <Plug>AirlineSelectPrevTab
nm         <unique><leader>l       <Plug>AirlineSelectNextTab
nm <silent><unique><leader><CR>    :NW<CR>
nn         <unique><leader>/       /
nn         <unique><leader>z       zjzo
nn <silent><unique><leader>r       :noh<CR>:dif<CR>:syn sync fromstart<CR><C-L>
nm         <unique><leader><Space> <Plug>(easymotion-bd-n)
nn         <unique><leader>v       <C-V>
nn         <unique><leader>,       qj
nn         <unique><leader>.       :HardTimeOff<CR>@j:HardTimeOn<CR>
no         <unique><leader>q       :qall<CR>
no         <unique><leader>d       :hide<CR>
nn         <unique><leader>sv      :vs<CR>
nn         <unique><leader>sh      :sp<CR>
nn         <unique><leader>cd      :cd %:p:h<CR>

for [k, d] in items({
            \ 'h': 'Left',
            \ 'j': 'Down',
            \ 'k': 'Up',
            \ 'l': 'Right' })
    exe 'nn <silent><unique><M-'.k.'> :TmuxNavigate'.d.'<CR>'
endfor

for n in range(1,9)
    exe 'nm <unique>'.g:mapleader.n.' <Plug>AirlineSelectTab'.n
endfor

let g:mapleader=';'
nn <unique><Leader>s        :SideSearch ""<left>
nm <unique><leader><CR>     <Plug>NrrwrgnWinIncr
nn <unique><leader><leader> :exe "buffer ".g:lastwin<CR>
nn <unique><leader><Space>  :Startify<CR>
nn <unique><leader>y        :YRShow<CR>
nn <unique><leader>t        :TlistOpen<CR>
nn <unique><leader>F        :CtrlP<CR>
nn <unique><leader>p        :CtrlPRTS<CR>
nn <unique><leader>m        :CtrlPMRUFiles<CR>
nn <unique><leader>u        :UndotreeToggle<CR>
nm <unique><leader>x        <Plug>TaskList<Down><Down>
nn <unique><leader>'        :SignatureListBufferMarks 1<CR>:lclose<CR>:Denite -cursor-wrap unite:location_list<CR>

nn <silent><unique><leader>n :cal VimuxRanger()<CR>

for [k,c] in items({
            \ 'l' : 'unite:location_list',
            \ 'q' : 'unite:quickfix',
            \ 'h' : 'help',
            \ 'b' : 'buffer',
            \ 'g' : 'menu:git',
            \ ':' : 'command', })
    exe 'nn <unique>'.g:mapleader.k.' :Denite -cursor-wrap '.c.'<CR>'
endfor

for [k,c] in items({
            \ 'f' : 'file_rec',
            \ 'o' : 'outline', })
    exe 'nn <unique>'.g:mapleader.k.' :Denite -vertical-preview -auto-preview -cursor-wrap '.c.'<CR>'
endfor

nn <silent><unique>/  :Denite -cursor-wrap line<CR>

let g:mapleader='-'
function g:Undotree_CustomMap()
    nm <buffer>K <plug>UndotreeGoNextState
    nm <buffer>J <plug>UndotreeGoPreviousState
    nm <buffer>N <plug>UndotreeGoNextSaved
    nm <buffer>P <plug>UndotreeGoPreviousSaved
    nm <buffer>q <Plug>UndotreeToggle
endfunc

au FileType tex,plaintex im <buffer><leader>]  <Plug>LatexCloseCurEnv
au FileType tex,plaintex nm <buffer><leader>*  <Plug>LatexToggleStarEnv
au FileType tex,plaintex nm <buffer><leader>ce <Plug>LatexChangeEnv
au FileType tex,plaintex vm <buffer><leader>}  <Plug>LatexWrapSelection
au FileType tex,plaintex vm <buffer><leader>se <Plug>LatexEnvWrapSelection

au FileType python nm <buffer><leader>f :cal pymode#rope#find_it()<CR>

au FileType haskell,perl,vim,python nm <buffer><CR> <Plug>unimpairedBlankDown
au FileType help nn <buffer><CR> <C-]>
au FileType help nn <buffer><BS> <C-T>
au FileType help nn <buffer>q    :q<CR>

function! VimuxRanger() abort
    if exists("s:vimux_ranger")
        cal _VimuxTmux("break-pane")
        unl s:vimux_ranger
    else
        cal _VimuxTmux("join-pane -b -p 80 -t:0")
        TmuxNavigateDown
        cal VimuxSendText(":")
        cal VimuxSendText("cd ".getcwd())
        let s:vimux_ranger = 1
    endif
endfunc
au VimEnter * cal VimuxRunCommand("ranger")
au VimEnter * cal _VimuxTmux("break-pane -d -t:0 -s {bottom}")
au VimLeave * cal _VimuxTmux("kill-window -t:0")
