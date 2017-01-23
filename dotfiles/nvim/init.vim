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

Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-textobj-user'

Plugin 'tpope/vim-eunuch'

Plugin 'tpope/vim-repeat'

Plugin 'tpope/vim-fugitive'

Plugin 'tpope/vim-abolish'

Plugin 'tpope/vim-unimpaired.git'

Plugin 'godlygeek/tabular'

Plugin 'haya14busa/vim-asterisk'

Plugin 'mkitt/tabline.vim'

au VimEnter * com! -nargs=+ -bar -complete=customlist,man#completion#run Man call man#get_page('tab', <f-args>)
Plugin 'vim-utils/vim-man'

let g:highlightedyank_highlight_duration = -1
Plugin 'machakann/vim-highlightedyank'

let g:formatters_python = ["yapf"]
let g:autoformat_autoindent = 0 " don't use vims formatter for indentation
Plugin 'Chiel92/vim-autoformat'

let g:rbpt_colorpairs = [ ["1", "SeaGreen3"], ["4", "DarkOrchid3"], ["3", "firebrick3"], ["2", "RoyalBlue3"], ["16", "RoyalBlue3"] ]
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

au VimEnter * cal extend(g:volatile_ftypes, ["taglist", "'__doc__'"])
Plugin 'kopischke/vim-stay'

let g:echodoc_enable_at_startup = 1
Plugin 'Shougo/echodoc.vim'

let g:indentLine_setColors = 0
let g:indentLine_char = "┴"
let g:indentLine_indentLevel = 10
let g:indentLine_first_char = "╠"
let g:indentLine_showFirstIndentLevel = "1"
let g:indentLine_fileType = ["vim", "perl", "python"]
let g:indentLine_faster=1
let g:indentLine_concealcursor="nc"
let g:indentLine_leadingSpaceChar = "◦"
let g:indentLine_leadingSpaceEnabled = 0
Plugin 'Yggdroot/indentLine'

let g:neomru#filename_format = ":p:s?^/usr/lib?/u/l?:s?^/etc/?/e/?:~"
let g:neomru#update_interval = 60
let g:neomru#file_mru_path = expand("$HOME/.config/nvim/files/neo_mru")
let g:neomru#directory_mru_path = expand("$HOME/.config/nvim/files/neo_dir_mru")
let g:neomru#follow_links = 1
let g:rg_opts = ['-SL', '--hidden', '-g', '!.git', '-g', '!.gitignore', '-g', '!.gitsubmodules', '-g', '!.cache']
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'osyo-manga/unite-quickfix'
Plugin 'Shougo/denite.nvim'

let g:multi_cursor_next_key="\<C-H>"
let g:multi_cursor_prev_key="\<C-p>"
let g:multi_cursor_skip_key="\<C-x>"
let g:multi_cursor_quit_key="\<Esc>"
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_visual_maps = {"i":1,"a":1,"f":1,"F":1,"t":1,"T":1,"K":1,"S":1}
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
let g:startify_list_order = [ "files", "dir", "bookmarks", "commands", "sessions" ]
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
let g:fastfold_skip_filetypes = [ "taglist", "gitcommit", "startify", "man", "rst" ]
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
Plugin 'airblade/vim-gitgutter'

let g:move_map_keys = 0
Plugin 'matze/vim-move'

let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_keys = "ASDFGHJKLQWERUIO;"
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'easymotion/vim-easymotion'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#delimiters = ["/", "("]
au FileType python let g:deoplete#delimiters = ["/", ".", "("]
au FileType perl   let g:deoplete#delimiters = ["/", "->", "(", "::", "$", "@", "%"]
au FileType vim    let g:deoplete#delimiters = ["/", ":", "(", "'"]
let g:deoplete#auto_complete_delay = 25
let g:deoplete#auto_refresh_delay = 35
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#tag#cache_limit_size = 5000000
let g:deoplete#sources = {}
let g:deoplete#sources._ = ["file", "around", "tag", "neosnippet", "member", "buffer", "syntax", "include"]
let g:deoplete#sources.python = g:deoplete#sources._ + [ "jedi" ]
let g:deoplete#sources.perl = g:deoplete#sources._ + [ "omni" ]
let g:deoplete#sources.vim = g:deoplete#sources._ + [ "vim" ]
let g:deoplete#sources.haskell = g:deoplete#sources._ + [ "ghc" ]
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.perl = ["[a-zA-Z_]\+->"]
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.perl = "PerlComplete"
au FileType * cal deoplete#custom#set("file", "rank", 159)
au FileType python                  cal deoplete#custom#set("jedi", "rank", 99)
au FileType perl                    cal deoplete#custom#set("omni", "rank", 99)
au FileType vim                     cal deoplete#custom#set("vim", "rank", 99)
au FileType haskell                 cal deoplete#custom#set("ghc", "rank", 99)
au FileType * cal deoplete#custom#set("around", "rank", 89)
au FileType * cal deoplete#custom#set("tag", "rank", 85)
au FileType * cal deoplete#custom#set("neosnippet", "rank", 84)
au FileType * cal deoplete#custom#set("member", "rank", 83)
au FileType * cal deoplete#custom#set("buffer", "rank", 81)
au FileType * cal deoplete#custom#set("syntax", "rank", 80)
au FileType * cal deoplete#custom#set("include", "rank", 79)
au VimEnter * cal deoplete#custom#set("_", "matchers", ["matcher_fuzzy"])
if !exists("g:neoinclude#reverse_exprs") | let g:neoinclude#reverse_exprs = {} | endif
let g:neoinclude#reverse_exprs.perl = "fnamemodify(substitute(v:fname, \"/\", \"::\", \"g\"), \":r\")"
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#worker_threads = 2
let g:deoplete#sources#jedi#python_path = "/usr/bin/python3"
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
let g:airline#extensions#tabline#excludes = ["denite", "pydir.log", "pyrun.log"]
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffers_label = "b"
let g:airline#extensions#tabline#tabs_label = "t"
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#checks = ["indent", "trailing", "long", "mixed-indent-file"]
let g:airline#extensions#whitespace#symbol = ""
let g:airline#extensions#wordcount#enabled = 0
function! AirlineInit()
    let g:airline_section_b = airline#section#create(["%{getcwd()}"])
    let g:airline_section_c = airline#section#create(["ffenc"])
    if winwidth(0) > 80
        let g:airline_section_z = airline#section#create( [ "windowswap", "obsession", "linenr", "maxlinenr", ":%2v" ] )
    else
        let g:airline_section_z = airline#section#create([ "linenr", ":%3v"])
    endif
endfunction
au User AirlineAfterInit cal AirlineInit()
let g:airline_theme = "kolor"
if !exists("g:airline_symbols") | let g:airline_symbols = {} | endif
let g:airline_symbols.maxlinenr = ""
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-airline'

let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
au FileType python      let b:delimitMate_nesting_quotes = ["\""]
au FileType python      let b:delimitMate_expand_inside_quotes = 1
au FileType python,perl let b:delimitMate_excluded_regions = ""
au FileType perl        let b:delimitmate_insert_eol_marker = 1
au FileType perl        let b:delimitMate_eol_marker = ";"
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
let g:yankring_replace_n_nkey = "\<C-n>"
let g:yankring_replace_n_pkey = "\<C-b>"
let g:yankring_window_height = 12
au TextYankPost * YRPush
au InsertLeave * cal setreg("",getreg("."))
au InsertLeave * YRPush
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
let g:syntastic_python_checkers = ["pylint"]
Plugin 'scrooloose/syntastic'

let g:expand_region_text_objects = { "iw":0, "iW":0, "i\"":0, "a\"":0, "i\'":0, "a\'":0, "ib":1, "ab":1, "i]":1, "iB":1, "il":0, "ii":1, "ai":1, "ip":0, "ie":0, }
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

" may improve performance significantly - UNTESTED
" set regexpengine=1
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
let g:pymode_options_max_line_length = 90 " it gets highlighting
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
au FileType python let b:match_words = "\<def\>:\<return\>,\<if\>:\<elif\>:\<else\>,\<try\>:\<except\>,\<from\>:\<import\>"
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tweekmonster/impsort.vim'
Plugin 'klen/python-mode'

" Plugins&end
cal vundle#end()
filet plugin indent on
sy enable
colo base16-seti-ui

se bg=dark
se bdir=${HOME}/.config/nvim/files/backup/
se ch=2
se cot=menuone,noselect,preview
se cole=2
se cocu=nc
se cpo+=D cpo+=E cpo+=I cpo+=$
se dir=${HOME}/.config/nvim/files/swap/
se eb
se et
se ffs=unix
se fcl=all
se fdls=2
se fml=3
se fdo="all"
se gd
se hid
se hh=40
se ic
se isf+={,}
se list
se lcs=tab:>┈,trail:┅,nbsp:+,extends:╡,precedes:╞,eol:┊,space:⋅
se mps=(:),[:],{:},<:>
se mat=1
se pvh=15
se sj=4
se so=6
se sr
se sc
se sm
se nosmd
se stal=0
se ss=4
se siso=2
se scs
se si
se sts=4
se sw=0
se ts=4
se tc=match
se tags+=./perltags
se udir=${HOME}/.config/nvim/files/undo/
se udf
se ut=2000
se vop=cursor,folds,slash,unix
se ve=block
se vb
se sd='100,h,s1000,n${HOME}/.config/nvim/files/info/viminfo
se ww+=<,>,h,l
se wig=*.o,*~,*.pyc
se wim=list:full
se nowrap

exe 'au FileType haskell,vim,perl,python sy match IndentLine /^ / contained conceal cchar='.g:indentLine_first_char
exe 'au FileType vim,perl,python sy match IndentLineSpace /^ \+/ containedin=TOP contained contains=IndentLine conceal cchar='.g:indentLine_leadingSpaceChar
exe 'au FileType haskell sy match IndentLineSpace /^ \+/ containedin=TOP contains=IndentLine conceal cchar='.g:indentLine_leadingSpaceChar

au InsertEnter * setl tm=500
au InsertLeave * setl tm=1000

au VimEnter * let g:lasttab = tabpagenr()
au TabLeave * let g:lasttab = tabpagenr()

let g:startify_bookmarks = [ { 'n': '~/.config/nvim/init.vim' }, { 'r': '~/.zprezto/runcoms' }, { 'z': '~/.zshrc' }, { 'p': '~/code/pyrep' }, { 'l': '~/code/perl' }, ]
let g:startify_commands = [ { 'm': ['Unite MRU', 'Denite unite:file_mru'] },
            \   { 'h':['help', 'Denite -cursor-wrap help'] },
            \   { 'g':['grep', 'Denite -cursor-wrap grep'] },
            \   { 'd':['dir search', 'Denite -cursor-wrap directory_rec'] },
            \   { 'f':['all files', 'Denite -cursor-wrap file_rec'] },
            \   { 'c':['cmd search', 'Denite -cursor-wrap commands'] },
            \   { 'P':['Plugins Update', 'PluginUpdate'] }, ]

function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
                \   'converters': [ incsearch#config#fuzzy#converter() ],
                \   'modules': [ incsearch#config#easymotion#module() ],
                \   'keymap': { "\<CR>": '<Over>(easymotion)' },
                \   'is_expr': 0,
                \   'is_stay': 1
                \ }), get(a:, 1, {}))
endfunction

for [o, v] in items({ 'command' : [ 'rg' ],
            \ 'recursive_opts' : [],
            \ 'pattern_opt' : [ '--regexp' ],
            \ 'separator' : [ '--' ],
            \ 'final_opts' : [],
            \ 'default_ops': ['--vimgrep'] + g:rg_opts })
    au VimEnter * cal denite#custom#var('grep', o, v)
endfor

for [k, c] in items({ "\<C-J>" : "\<denite:move_to_next_line>",
            \ "\<C-K>" : "\<denite:move_to_previous_line>", })
    exe "au VimEnter * cal denite#custom#map('insert','".k."','".c."','noremap')"
endfor

let g:denite_menus = {}
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

let g:denite_menus.sh = {'description': 'shell cmds'}
let g:denite_menus.sh.command_candidates = [
            \['▷ Executable Permissions ', 'Chmod 700'],
            \['▷ Readonly Permissions   ', 'Chmod 500'],
            \['▷ Write and Exit         ', 'x'],
            \['▷ Sudo Write             ', 'SudoWrite'],
            \]

au VimEnter * cal denite#custom#var('menu', 'menus', g:denite_menus)
au VimEnter * cal denite#custom#var('file_rec', 'command', ['rg', '--files'] + g:rg_opts)

" settings&end

hi HighlightedyankRegion  ctermbg=28
hi pythonFunctionTag      ctermbg=23  ctermfg=9
hi pythonMethodTag        ctermbg=23  ctermfg=12
hi pythonClassTag         ctermbg=23  ctermfg=11
hi pythonImportedObject   ctermbg=22  ctermfg=10
hi pythonImportedFuncDef  ctermbg=22  ctermfg=9
hi pythonImportedClassDef ctermbg=22  ctermfg=11
hi SignColumn             ctermbg=25
hi FoldColumn             ctermbg=26
hi Visual                 ctermbg=233 cterm=inverse
hi WildMenu               ctermbg=236 cterm=bold
hi StatusLine             ctermbg=234
hi Search                 ctermbg=53  ctermfg=117
hi MatchParen             ctermbg=20  ctermfg=25
hi Conceal                            ctermfg=27

hi link perlFunctionTag      pythonFunctionTag
hi link vimAutoGroupTag      pythonClassTag
hi link vimCommandTag        pythonFunctionTag
hi link vimFuncNameTag       pythonMethodTag
hi link vimScriptFuncNameTag pythonMethodTag

" colorscheme&end

for [k, d] in items({'h': 'Left', 'j': 'Down', 'k': 'Up', 'l': 'Right'})
    exe 'nn  <silent><unique><M-'.k.'> :TmuxNavigate'.d.'<CR>'
endfor

no <silent><expr><unique>g/ incsearch#go(<SID>config_easyfuzzymotion())
nm  <unique>    ?  <Plug>(incsearch-fuzzy-stay)

for [k, c] in items(
            \ { 'j': 'j',
            \ 'k': 'k',
            \ 'f': 'bd-fl',
            \ 't': 'bd-tl',
            \ 'w': 'bd-wl',
            \ 'e': 'bd-el', } )
    exe 'map <expr><unique>'.k.' v:count ? "'.k.'" : "\<Plug>(easymotion-'.c.')"'
endfor

for [k, c] in items(
            \ { '*': 'z*',
            \ 'S': 'z*',
            \ '#': 'z#',
            \ 'g*': 'gz*',
            \ 'gS': 'gz*',
            \ 'g#': 'gz#', } )
    exe 'nm <unique>'.k.' <Plug>(asterisk-'.c.')<Plug>(easymotion-bd-n)'
    exe 'om <unique>'.k.' <Plug>(asterisk-'.c.')<Plug>(easymotion-bd-n)'
endfor

for [k, c] in items(
            \ { 's': 'bd-f2', 'K': 'sol-bd-jk', } )
    exe 'map <unique>'.k.' <Plug>(easymotion-'.c.')'
endfor

for [k, c] in items(
            \ { '/': 'line', 'F': 'grep', } )
    exe 'nn <unique>'.k.' :Denite -cursor-wrap '.c.'<CR>'
endfor

for m in ['im', 'smap']
    exe m.' <expr><unique><CR> '.
                \   'pumvisible() ? "\<Left>\<Right>" : '.
                \   'delimitMate#WithinEmptyPair() ? "\<Plug>delimitMateCR" : '.
                \   '"\<CR>"'
    exe m.' <expr><unique><Tab> pumvisible() ? "\<C-N>" :'.
                \ 'neosnippet#expandable_or_jumpable() ? "\<C-G>u\<Plug>(neosnippet_jump_or_expand)" :'.
                \ '"\<C-O>%"'
endfor

im  <expr><unique><S-Tab> pumvisible() ? "\<C-P>" :
            \ delimitMate#ShouldJump() ? "\<Plug>delimitMateS-Tab" :
            \ "\<C-C>:TmuxNavigatePrevious\<CR>"

nn  <unique><S-Tab> :TmuxNavigatePrevious<CR>
nn  <unique><Tab>   %
xn  <unique><Tab>   %
ono <unique><Tab>   %

nm <unique><M-e> <Plug>MoveLineDown
nm <unique><M-s> <Plug>MoveLineUp
vm <unique><M-e> <Plug>MoveBlockDown
vm <unique><M-s> <Plug>MoveBlockUp
nm <unique><M-d> <Plug>MoveLineHalfPageDownzz
nm <unique><M-u> <Plug>MoveLineHalfPageUpzz
vm <unique><M-d> <Plug>MoveBlockHalfPageDownzz
vm <unique><M-u> <Plug>MoveBlockHalfPageUpzz
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

for [k, c] in items({
            \ 'c' : 'Invert',
            \ 'l' : 'Append',
            \ 'y' : 'Yank',
            \ 'L' : 'ToEOL', })
    exe 'nm <unique>gc'.k.' <Plug>NERDCommenter'.c
endfor

nn  <unique>gq   :Autoformat<CR>
xm  <unique>gc   <Plug>NERDCommenterInvert
xm  <unique>gC   <Plug>NERDCommenterComment
xm  <unique>v    <Plug>(expand_region_expand)
cno <unique>t/   Tabularize /./l1c1l0
xm  <unique><CR> <Plug>NrrwrgnDo

no  <unique>gs    ^
no  <unique>gl    $
nn  <unique><C-S> 5<C-Y>
nn  <unique><C-E> 5<C-E>
xn  <unique>J     <esc>
ino <unique>jf    <esc>
ino <unique>fj    <esc>
ino <unique><C-C> <esc>
nm  <unique>''    '[

xn  <unique>S<Space>  c<Space><C-R>"<Space><C-C>
nn  <unique><M-Space> <C-I>
nn  <unique><Space>   <C-O>
nn  <unique><M-t>     g<C-]>
nn  <unique><C-K>     :w<CR>
ino <unique><C-K>     <C-O>:w<CR>
nn  <unique><M-n>     :ta<CR>
nn  <unique><M-b>     :po<CR>

let g:mapleader=","
nm         <unique><leader>h       <Plug>AirlineSelectPrevTab
nm         <unique><leader>l       <Plug>AirlineSelectNextTab
nm <silent><unique><leader><CR>    :NW<CR>
nn         <unique><leader>/       /
nn         <unique><leader>z       zjza
nn <silent><unique><leader>r       :noh<CR>:dif<CR>:syn sync fromstart<CR><C-L>
nm         <unique><leader><Space> <Plug>(easymotion-bd-n)
nn         <unique><leader>v       <C-V>
nn         <unique><leader>,       qj
nn         <unique><leader>.       @j
no         <unique><leader>q       :q<CR>
no         <unique><leader>d       :hide<CR>
nn         <unique><leader>sv      :vs<CR>
nn         <unique><leader>sh      :sp<CR>
nn         <unique><leader>cd      :cd %:p:h<CR>

for n in range(1,9)
    exe 'nm <unique>'.g:mapleader.n.' <Plug>AirlineSelectTab'.n
endfor

let g:mapleader=';'
nm <unique><leader><CR>     <Plug>NrrwrgnWinIncr
nn <unique><leader><leader> :exe "tabn ".g:lasttab<CR>
nn <unique><leader><Space>  :Startify<CR>
nn <unique><leader>y        :YRShow<CR>
nn <unique><leader>p        :TlistOpen<CR>
nn <unique><leader>u        :UndotreeToggle<CR>
nm <unique><leader>t        <Plug>TaskList<Down><Down>
nn <unique><leader>'        :SignatureListBufferMarks 1<CR>:lopen 5<CR>:Denite line<CR>

nn <silent><unique><leader>n
        \ :echo(system("tmux if -F '#{s/1/0/:window_panes}'
        \ 'join-pane -d -s:2.{top} -t:+' 'join-pane -vb -p 30 -t:2 -s:+.{bottom}'"))<CR>

nn  <unique><leader>l :Denite -cursor-wrap unite:location_list<CR>
nn  <unique><leader>m :Denite -cursor-wrap unite:file_mru<CR>
for [k,c] in items({
            \ 'q' : 'unite:quickfix',
            \ 'f' : 'file_rec',
            \ 'o' : 'outline',
            \ 'd' : 'directory_rec',
            \ 'D' : 'directory_rec:~',
            \ 'b' : 'buffer',
            \ 'h' : 'help',
            \ 'g' : 'menu:git',
            \ 's' : 'menu:sh',
            \ ':' : 'command',
            \ 'F' : 'file_rec:~' })
    exe 'nn <unique>'.g:mapleader.k.' :Denite -vertical-preview -auto-preview -cursor-wrap '.c.'<CR>'
endfor

let g:mapleader='-'
function g:Undotree_CustomMap()
    nm <buffer>K <plug>UndotreeGoNextState
    nm <buffer>J <plug>UndotreeGoPreviousState
    nm <buffer>N <plug>UndotreeGoNextSaved
    nm <buffer>P <plug>UndotreeGoPreviousSaved
endfunc

au FileType tex,plaintex im <buffer><leader>]  <Plug>LatexCloseCurEnv
au FileType tex,plaintex nm <buffer><leader>*  <Plug>LatexToggleStarEnv
au FileType tex,plaintex nm <buffer><leader>ce <Plug>LatexChangeEnv
au FileType tex,plaintex vm <buffer><leader>}  <Plug>LatexWrapSelection
au FileType tex,plaintex vm <buffer><leader>se <Plug>LatexEnvWrapSelection

au FileType python nm <buffer><leader>f :cal pymode#rope#find_it()<CR>

au FileType haskell,perl,vim,python nm <buffer><CR> <Plug>unimpairedBlankDown
au CursorHold * norm! zz
