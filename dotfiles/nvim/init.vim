"init on 2016-05-26
if &cp | set nocp | en
let g:loaded_gzip = 1
let g:loaded_man = 1
let g:loaded_tarPlugin = "v29"
let g:loaded_2html_plugin = "vim7.4_v2"
let g:loaded_zipPlugin = "v27"
filetype off
set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#begin("$HOME/.config/nvim/bundle")
Plugin 'VundleVim/Vundle.vim'

Plugin 'DoxygenToolkit.vim'
let g:DoxygenToolkit_blockFooter = "-----------------------------------------"
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_authorName = "Nathan Yonkee"
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_post = ": "
let g:DoxygenToolkit_briefTag_className = "yes"

augroup nerdtree
    autocmd!
    au StdinReadPre * let s:std_in=1
    au VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") |
                \ exe 'NERDTree' argv()[0] | wincmd p | enew | endif
augroup END
function! NERDTreeHighlightFile(ext, fg, bg)
 exe 'au filetype nerdtree hi '.a:ext.' ctermbg='.a:bg.' ctermfg='.a:fg
 exe 'au filetype nerdtree syn match '.a:ext.' #^\s\+.*'.a:ext.'$#'
endfunction
call NERDTreeHighlightFile('h', 'green', 'none')
call NERDTreeHighlightFile('ini', 'yellow', 'none')
call NERDTreeHighlightFile('md', 'blue', 'none')
call NERDTreeHighlightFile('yaml', 'yellow', 'none')
call NERDTreeHighlightFile('config', 'yellow', 'none')
call NERDTreeHighlightFile('conf', 'yellow', 'none')
call NERDTreeHighlightFile('vim', 'yellow', 'none')
call NERDTreeHighlightFile('html', 'yellow', 'none')
call NERDTreeHighlightFile('cpp', 'cyan', 'none')
call NERDTreeHighlightFile('css', 'cyan', 'none')
call NERDTreeHighlightFile('py', 'Red', 'none')
call NERDTreeHighlightFile('js', 'Red', 'none')
call NERDTreeHighlightFile('php', 'Magenta', 'none')
let g:NERDTreeShowIgnoredStatus = 1
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdtree'

let g:targets_pairs = "()b {}B []a <>A"
let g:targets_quotes = "\"Q 'q `"
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'kana/vim-operator-user'
Plugin 'kana/vim-textobj-user'
" XXX targets
Plugin 'wellle/targets.vim'

Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-commentary'
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
let g:side_search_split_pct = 0.5
Plugin 'ddrscott/vim-side-search'

" XXX swap
let g:swap_no_default_key_mappings = 1
Plugin 'machakann/vim-swap'

let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>",]
let g:list_of_visual_keys = ["gh", "gj", "gk", "gl",] + g:list_of_insert_keys
let g:list_of_normal_keys = g:list_of_visual_keys + ["x"]
let g:hardtime_maxcount = 2
let g:hardtime_default_on = 1
let g:hardtime_timeout = 2000
Plugin 'takac/vim-hardtime'

augroup manpages
    autocmd!
    au VimEnter * com! -nargs=+ -bar -complete=customlist,man#completion#run
                \ Man call man#get_page('tab', <f-args>)
augroup end
Plugin 'vim-utils/vim-man'

let g:highlightedyank_highlight_duration = -1
Plugin 'machakann/vim-highlightedyank'

let g:formatters_python = ["yapf"]
let g:autoformat_autoindent = 0 " don't use vims formatter for indentation
let g:formatdef_custom_cpp = '"astyle"'
let g:formatters_cpp = ['custom_cpp']
Plugin 'Chiel92/vim-autoformat'

augroup rainbowparen
    autocmd!
    au BufEnter * cal rainbow_parentheses#load(0)
    au BufEnter * cal rainbow_parentheses#load(1)
    au BufEnter * cal rainbow_parentheses#load(2)
    au BufEnter * cal rainbow_parentheses#activate()
augroup end
let g:rbpt_colorpairs = [ ["1"],["4"],["3"],["2"],["16"],]
cal map(g:rbpt_colorpairs,'v:val+["#4B5056"]')
Plugin 'kien/rainbow_parentheses.vim'

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

augroup vimstay
    autocmd!
    au VimEnter * cal extend(g:volatile_ftypes, ["taglist", "rst",])
augroup end
Plugin 'kopischke/vim-stay'

let g:echodoc_enable_at_startup = 1
Plugin 'Shougo/echodoc.vim'

let g:indentLine_char = "⁅"
" let g:indentLine_char = "├"
let g:indentLine_setColors = 0
let g:indentLine_first_char = "╠"
let g:indentLine_indentLevel = 10
let g:indentLine_showFirstIndentLevel = "1"
let g:indentLine_fileType = ["vim", "perl", "python", "cpp",]
let g:indentLine_faster = 0
let g:indentLine_concealcursor="inc"
    let g:indentLine_leadingSpaceChar = "⥎"
let g:indentLine_leadingSpaceEnabled = 1
Plugin 'Yggdroot/indentLine'

let g:ctrlp_cmd = "CtrlPBufTagAll"
let g:ctrlp_match_window = "order:ttb"
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = "et"
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = "ag %s -l --hidden --ignore \"\.undo\" --ignore \"\.local\" --nocolor -g \"\""
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

for [k, c] in items({
            \ "\<C-J>" : "\<denite:move_to_next_line>",
            \ "\<C-K>" : "\<denite:move_to_previous_line>",
            \ })
    exe "au VimEnter * cal
                \ denite#custom#map('insert','".k."','".c."','noremap')"
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
augroup denitesettings
    autocmd!
    au VimEnter * cal denite#custom#var('menu', 'menus', g:denite_menus)
augroup END
Plugin 'osyo-manga/unite-quickfix'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/denite.nvim'

function g:Multiple_cursors_before()
    let g:deoplete#disable_auto_complete = 1
endfunction
function g:Multiple_cursors_after()
    let g:deoplete#disable_auto_complete = 0
endfunction
let g:multi_cursor_next_key="\<C-h>"
let g:multi_cursor_prev_key="\<C-p>"
let g:multi_cursor_skip_key="\<C-n>"
let g:multi_cursor_quit_key="\<Esc>"
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_visual_maps = {"i":1,"a":1,"f":1,"t":1,}
Plugin 'terryma/vim-multiple-cursors'

let g:startify_bookmarks = [ { 'n': '~/.config/nvim/init.vim' }, ]
let g:startify_commands = [
            \   { 'h':['help', 'Denite -cursor-wrap help'] },
            \   { 'f':['all files', 'CtrlP'] },
            \   { 'm':['MRU', 'CtrlPMRUFiles'] },
            \   { 'c':['cmds', 'Denite -cursor-wrap commands'] },
            \   { 'P':['Plugins Update', 'PluginUpdate'] }, ]
let g:startify_session_dir = "~/.config/nvim/files/session"
let g:startify_list_order =
            \ [ "files", "dir", "bookmarks", "commands", "sessions", ]
let g:startify_files_number = 10
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
let g:fastfold_skip_filetypes =
            \ [ "taglist", "gitcommit", "startify", "man", "rst", ]
Plugin 'Konfekt/FastFold'

let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1
Plugin 'christoomey/vim-tmux-navigator'

let g:SignatureDeleteConfirmation = 1
let g:SignatureForceMarkPlacement = 1
let g:SignatureForceMarkerPlacement = 1
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
let g:SignatureMarkLineHL = "TermCursorNC"
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
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_refresh_delay = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#tag#cache_limit_size = 5000000
if !exists("g:deoplete#sources") | let g:deoplete#sources = {} | endif
let g:deoplete#sources._ = ["file",
            \ "around",
            \ "tag",
            \ "neosnippet",
            \ "member",
            \ "buffer",
            \ "syntax",
            \ "include",
            \ ]
let g:deoplete#sources.python = g:deoplete#sources._ + [ "jedi", ]
let g:deoplete#sources.perl = g:deoplete#sources._ + [ "omni", ]
let g:deoplete#sources.vim = g:deoplete#sources._ + [ "vim", ]
let g:deoplete#sources.haskell = g:deoplete#sources._ + [ "ghc", ]
let g:deoplete#sources.cpp = g:deoplete#sources._ + [ "clang2", ]
if !exists("g:deoplete#omni#input_patterns")
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.perl = ["[a-zA-Z_]\+->",]
if !exists("g:deoplete#omni#functions")
    let g:deoplete#omni#functions = {}
endif
let g:deoplete#omni#functions.perl = "PerlComplete"
if !exists("g:neoinclude#reverse_exprs")
    let g:neoinclude#reverse_exprs = {}
endif
let g:neoinclude#reverse_exprs.perl =
            \ "fnamemodify(substitute(v:fname, \"/\", \"::\", \"g\"), \":r\")"
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#worker_threads = 2
let g:deoplete#sources#jedi#python_path = expand("$VIRTUAL_ENV/bin/python3")
augroup deopletecommands
    autocmd!
    au FileType python let g:deoplete#delimiters = ["/", ".", "(",]
    au FileType perl   let g:deoplete#delimiters =
                \ ["/", "->", "(", "::", "$", "@", "%",]
    au FileType vim    let g:deoplete#delimiters = ["/", ":", "(", "'",]
    au FileType cpp    let g:deoplete#delimiters = ["/", ":", "(", ".",]
    au FileType * cal deoplete#custom#set("file", "rank", 159)
    au FileType python  cal deoplete#custom#set("jedi", "rank", 99)
    au FileType perl    cal deoplete#custom#set("omni", "rank", 99)
    au FileType vim     cal deoplete#custom#set("vim", "rank", 99)
    au FileType haskell cal deoplete#custom#set("ghc", "rank", 99)
    au FileType cpp cal deoplete#custom#set("clang2", "rank", 99)
    au FileType * cal deoplete#custom#set("member", "rank", 90)
    au FileType * cal deoplete#custom#set("around", "rank", 89)
    au FileType * cal deoplete#custom#set("neosnippet", "rank", 84)
    au FileType * cal deoplete#custom#set("buffer", "rank", 81)
    au FileType * cal deoplete#custom#set("tag", "rank", 80)
    au FileType * cal deoplete#custom#set("syntax", "rank", 79)
    au FileType * cal deoplete#custom#set("include", "rank", 78)
    au VimEnter * cal deoplete#custom#set("_", "matchers", ["matcher_fuzzy",])
augroup end
Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'SevereOverfl0w/deoplete-github'
Plugin 'Shougo/context_filetype.vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'tweekmonster/deoplete-clang2'
Plugin 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}

let g:base16colorspace=256
Plugin 'chriskempson/base16-vim'

let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string="utf-8[unix]"
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#excludes =
            \ [ "pydir.log", "pyrun.log", "'__doc__'",]
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffers_label = "b"
let g:airline#extensions#tabline#tabs_label = "t"
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = "unique_tail"
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#checks =
            \ ["indent", "trailing", "long", "mixed-indent-file",]
let g:airline#extensions#whitespace#symbol = ""
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme = "kolor"
if !exists("g:airline_symbols") | let g:airline_symbols = {} | endif
let g:airline_symbols.maxlinenr = ""
function! AirlineInit()
    let g:airline_section_b =
                \ airline#section#create(["%{fnamemodify(getcwd(), \":p:~\")}"])
    let g:airline_section_c =
                \ airline#section#create(["%{bufname(\"%\")}".
                \ "(%{fnamemodify(bufname(winbufnr(g:lastwin)), \":p:t\")})"])
    let g:airline_section_z =
                \ airline#section#create( [ "linenr", "maxlinenr", ":%2v" ] )
endfunction
au User AirlineAfterInit cal AirlineInit()
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mkitt/tabline.vim'
Plugin 'bling/vim-airline'

augroup delimitemate
    autocmd!
    au FileType python let b:delimitMate_nesting_quotes = ["\"",]
    au FileType python let b:delimitMate_expand_inside_quotes = 1
    au FileType perl,cpp   let b:delimitmate_insert_eol_marker = 1
    au FileType perl,cpp   let b:delimitMate_eol_marker = ";"
augroup end
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_jump_expansion = 1
let g:delimitMate_balance_matchpairs = 1
Plugin 'Raimondi/delimitMate'

function g:Undotree_CustomMap()
    augroup undotree_bindings
        autocmd!
        nmap <buffer>K <plug>UndotreeGoNextState
        nmap <buffer>J <plug>UndotreeGoPreviousState
        nmap <buffer>N <plug>UndotreeGoNextSaved
        nmap <buffer>P <plug>UndotreeGoPreviousSaved
        nmap <buffer>q <Plug>UndotreeToggle
    augroup END
endfunc
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

augroup yankring
    autocmd!
    au TextYankPost * YRPush
augroup end
function! YRRunAfterMaps()
    nun @
endfunction
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
Plugin 'vim-scripts/YankRing.vim'

let g:syntastic_aggregate_errors = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_check_on_open = 0
let g:syntastic_enable_signs = 0
let g:syntastic_python_checkers = ["pylint",]
let g:syntastic_cpp_compiler_options = "-std=gnu++11 -fno-rtti -Wvla -c -Wall
            \ -Wextra -Wno-unused-parameter -Wno-missing-field-initializers
            \ -fmessage-length=0 -fno-exceptions -fno-builtin -ffunction-sections
            \ -fdata-sections -funsigned-char -MMD -fno-delete-null-pointer-checks
            \ -fomit-frame-pointer -Os -mcpu=cortex-m7 -mthumb -mfpu=fpv5-d16
            \ -mfloat-abi=softfp -DDEVICE_SPI=1 -DFEATURE_LWIP=1
            \ -DMBED_BUILD_TIMESTAMP=1490469159.34 -DDEVICE_I2CSLAVE=1
            \ -D__FPU_PRESENT=1 -DDEVICE_PORTOUT=1 -DTARGET_STM32F767ZI
            \ -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_LOWPOWERTIMER=1
            \ -DTARGET_STM32F7 -DTOOLCHAIN_object -DDEVICE_SERIAL_ASYNCH=1
            \ -D__CMSIS_RTOS -DTOOLCHAIN_GCC -DDEVICE_I2C_ASYNCH=1 -DARM_MATH_CM7
            \ -DTARGET_CORTEX_M -DDEVICE_SERIAL=1 -DTARGET_LIKE_CORTEX_M7
            \ -DDEVICE_ANALOGOUT=1 -DTARGET_NUCLEO_F767ZI -DTARGET_UVISOR_UNSUPPORTED
            \ -DTARGET_M7 -DDEVICE_SPI_ASYNCH=1 -DDEVICE_PWMOUT=1 -D__MBED__=1
            \ -DDEVICE_I2C=1 -DTRANSACTION_QUEUE_SIZE_SPI=2 -DDEVICE_STDIO_MESSAGES=1
            \ -D__CORTEX_M7 -DTARGET_LIKE_MBED -DTARGET_FF_ARDUINO -DDEVICE_PORTIN=1
            \ -DTARGET_STM32F767 -DTARGET_STM -DUSBHOST_OTHER -DTARGET_RELEASE
            \ -DDEVICE_TRNG=1 -D__MBED_CMSIS_RTOS_CM -DDEVICE_SLEEP=1
            \ -DTOOLCHAIN_GCC_ARM -DDEVICE_CAN=1 -DDEVICE_INTERRUPTIN=1
            \ -DDEVICE_SPISLAVE=1 -DDEVICE_ANALOGIN=1 -DTARGET_STM32F767xI
            \ -DDEVICE_RTC=1
            \ @./BUILD/NUCLEO_F767ZI/GCC_ARM/.includes_0b36ecdf2da6b2a7b60fd80e803f0e74.txt"
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
let g:python3_host_prog = expand("$VIRTUAL_ENV/bin/python3")
let g:python_no_builtin_highlight = 1
let g:python_no_exception_highlight = 1
let g:python_no_doctest_highlight = 1
let g:python_no_doctest_code_highlight = 1
augroup pythonmode
    autocmd!
    au FileType python setl fde=SimpylFold(v:lnum) fdm=expr fdl=3 nonu
    au FileType python setl def=^\s*\\(def\\\\|class\\) cms=#%s nowrap fo-=t cpt+=t
    au FileType python let b:match_words = "def:return,if:elif:else,try:except,from:import"
augroup end
Plugin 'davidhalter/jedi-vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tweekmonster/impsort.vim'
Plugin 'klen/python-mode'

" keep this one last
Plugin 'ryanoasis/vim-devicons'

" Plugins&end
call vundle#end()

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
set cpoptions+=Dt$
set cursorcolumn
set cursorline
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
set matchpairs=(:),[:],{:}
set matchtime=2
set path+=/usr/local/include,mbed-os
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
set tags=./tags,./perltags,${HOME}/.vimtags
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

augroup autooptions
    autocmd!
    au WinEnter * se cursorline
    au WinEnter * se cursorcolumn
    au WinLeave * se nocursorcolumn
    au WinLeave * se nocursorline
    au InsertEnter * setl timeoutlen=500
    au InsertLeave * setl timeoutlen=1000
    au FileType vim setl matchpairs=(:),[:],{:},<:>
augroup END

" exe 'au FileType haskell,vim,perl,python sy match IndentLine /^ / contained conceal cchar='.g:indentLine_first_char
" exe 'au FileType vim,perl,python sy match IndentLineSpace /^ \+/  contained contains=IndentLine conceal cchar=o'
" exe 'au FileType vim,perl,python sy match IndentLineSpace /^ \+/  contained contains=IndentLine conceal cchar='.g:indentLine_leadingSpaceChar
" exe 'au FileType haskell sy match IndentLineSpace /^ \+/ containedin=TOP contains=IndentLine conceal cchar='.g:indentLine_leadingSpaceChar

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
hi Search                 ctermbg=30  ctermfg=14 cterm=bold
hi MatchParen             ctermbg=20  ctermfg=25
hi Conceal                            ctermfg=27
hi CursorColumn           cterm=inverse,bold
hi CursorLine             cterm=standout
hi HighlightedyankRegion  ctermbg=28  ctermfg=none cterm=bold
hi TermCursorNC           ctermbg=236 ctermfg=none

hi link perlFunctionTag      pythonFunctionTag
hi link vimAutoGroupTag      pythonClassTag
hi link vimCommandTag        pythonFunctionTag
hi link vimFuncNameTag       pythonMethodTag
hi link vimScriptFuncNameTag pythonMethodTag

cnoreabbrev T/  Tabularize //l1c1l0<left><left><left><left><left><left><left><c-h>
cnoreabbrev w!!  SudoWrite


for [k, c] in items({
            \ 'w': 'bd-wl',
            \ 'f': 'bd-fl',
            \ 't': 'bd-tl',
            \ 'j': 'bd-jk',
            \ 'k': 'bd-jk',
          \ })
    exe 'map <expr><unique>'.k.' v:count ? "'.k.'" : "\<Plug>(easymotion-'.c.')"'
endfor

nmap <expr><unique> e v:count ? e : "\<Plug>(easymotion-bd-el)"
xmap <expr><unique> e v:count ? e : "\<Plug>(easymotion-bd-el)"
omap <expr><unique> e v:count ? e : "v\<Plug>(easymotion-bd-el)"

inoremap <silent><expr><unique> <C-K>   pumvisible() ? "\<C-P>" : "\<Del>"
inoremap <silent><expr><unique> <C-J>   pumvisible() ? "\<C-n>" : "\<C-J>"
imap     <silent>      <unique> <Tab>   <Plug>delimitMateS-Tab
imap                   <unique> <s-Tab> <Plug>(neosnippet_jump_or_expand)
smap                   <unique> <s-Tab> <Plug>(neosnippet_jump_or_expand)
snoremap <unique><Tab> <C-O>%
inoremap <unique> <C-S> <C-Y>
inoremap <unique><C-A> <C-@>
inoremap <unique><C-G><C-A> <C-A>
" inoremap <unique><C-B>
" inoremap <unique><C-L>
" inoremap <unique><C-Z>
inoremap <unique><C-V>     <C-R>*
inoremap <unique><C-Q>     <C-V>

map <unique>s <Plug>(easymotion-bd-f2)
noremap <unique>gs s

for [k, c] in items({
            \ '*': 'z*',
            \ 'S': 'z*',
            \ '#': 'z#',
            \ 'g*': 'gz*',
            \ 'gS': 'gz*',
            \ 'g#': 'gz#',
          \ })
    exe 'nmap <unique>'.k.' <Plug>(asterisk-'.c.')<Plug>(easymotion-bd-n)'
    exe 'omap <unique>'.k.' <Plug>(asterisk-'.c.')<Plug>(easymotion-bd-n)'
endfor

for m in ['nmap', 'omap', 'xmap',]
    exe m.' <unique><tab> %'
endfor

let g:lastwin = 1
au WinLeave /*/[^\[]*[^\]] let g:lastwin = winnr()
nnoremap <silent><expr><unique><S-Tab> winnr() == g:lastwin ? "\<c-w>W" : winnr('$') > g:lastwin ? "\<c-w>W" : ":exe g:lastwin.'wincmd w'\<CR>"

nmap <unique> ], <Plug>(swap-next)
nmap <unique> [, <Plug>(swap-prev)
nmap <unique> [g <Plug>GitGutterPrevHunk
nmap <unique> ]g <Plug>GitGutterNextHunk
omap <unique> ig <Plug>GitGutterTextObjectInnerPending
omap <unique> ag <Plug>GitGutterTextObjectOuterPending
xmap <unique> ig <Plug>GitGutterTextObjectInnerVisual
xmap <unique> ag <Plug>GitGutterTextObjectOuterVisual

nnoremap <unique>'[ `[
nnoremap <unique>'] `]
nnoremap <unique>'< `<
nnoremap <unique>'> `>
nnoremap <unique>`[ '[
nnoremap <unique>`] ']
nnoremap <unique>`< '<
nnoremap <unique>`> '>

nnoremap <unique> Q     :Autoformat<CR>
nnoremap <unique> gq    :Autoformat<CR>
xmap     <unique> v     <Plug>(expand_region_expand)
xmap     <unique> <CR>  <Plug>NrrwrgnDo
noremap  <unique> h     ^
noremap  <unique> gh    h
noremap  <unique> l     $
noremap  <unique> gl    l
nnoremap <unique> gf    :cd %:p:h<CR>:normal! gf<CR>
nnoremap <unique> v     viw
nnoremap <unique> <C-S> 5<C-Y>
nnoremap <unique> <C-E> 5<C-E>
nnoremap <unique> D     <c-d>
nnoremap <unique> U     <c-u>
nnoremap <unique> B     <c-b>

xnoremap <unique> J     <esc>
inoremap <unique> jf    <esc>
inoremap <unique> fj    <esc>

xnoremap <unique>S<Space>  c<Space><C-R>"<Space><C-C>
nnoremap <unique><c-Space> <C-I>
nnoremap <unique><Space>   <C-O>
nnoremap <unique><c-t>     g<C-]>
nnoremap <unique><BS> <C-T>
nnoremap <unique><C-K>     :w<CR>

nnoremap <unique><F10> <esc>:xa<cr>

let g:mapleader=","
nnoremap          <unique><leader>z    zjzo
nnoremap  <silent><unique><leader>r    :noh<CR>:dif<CR>:syn sync fromstart<CR><C-L>
nmap              <unique><leader>n    <Plug>(easymotion-bd-n)
nnoremap          <unique><leader>v    <C-V>
nnoremap          <unique><leader>,    qj
nnoremap          <unique><leader>.    :HardTimeOff<CR>@j:HardTimeOn<CR>
noremap           <unique><leader>q    :qall<CR>
noremap           <unique><leader>d    :hide<CR>
nnoremap          <unique><leader>sv   :vs<CR>
nnoremap          <unique><leader>sh   :sp<CR>
nnoremap          <unique><leader>cd   :cd %:p:h<CR>
nmap <unique><leader>b <Plug>AirlineSelectPrevTab
nmap <unique><leader>f <Plug>AirlineSelectNextTab

for n in range(1,9)
    exe 'nmap <unique>'.g:mapleader.n.' <Plug>AirlineSelectTab'.n
endfor

for [k, d] in items({
            \ 'h': 'Left',
            \ 'j': 'Down',
            \ 'k': 'Up',
            \ 'l': 'Right',
          \ })
    exe 'nnoremap <silent><unique><leader>'.k.' :TmuxNavigate'.d.'<CR>'
endfor

let g:mapleader=';'
nmap      <silent><unique><leader><CR> :NW<CR>
nnoremap <unique><leader><Space> :Startify<CR>
nnoremap <unique><leader>y       :YRShow<CR>
nnoremap <unique><leader>t       :TlistOpen<CR>
nnoremap <unique><leader>f       :CtrlP<CR>
nnoremap <unique><leader>F       :cd ~<CR>:CtrlP<CR>
nnoremap <unique><leader>p       :CtrlPRTS<CR>
nnoremap <unique><leader>m       :CtrlPMRUFiles<CR>
nnoremap <unique><leader>u       :UndotreeToggle<CR>
nmap     <unique><leader>x       <Plug>TaskList<Down><Down>
nnoremap <unique><leader>'       :SignatureListBufferMarks 1<CR>:lclose<CR>:Denite -cursor-wrap unite:location_list<CR>
nnoremap <unique><leader>gf      :cd %:p:h<CR>:NERDTreeCWD<CR>
nnoremap <silent><unique><leader>n :NERDTreeToggle<CR>
nnoremap <unique><leader>o :Denite -vertical-preview -auto-preview -cursor-wrap outline<CR>
nnoremap <unique><leader>ag    :SideSearch ""<Left>
xnoremap <unique><leader>ag    y:SideSearch <C-r><C-r>"<CR> | wincmd p

for [k,c] in items({
            \ 'l' : 'unite:location_list',
            \ 'q' : 'unite:quickfix',
            \ 'h' : 'help',
            \ 'b' : 'buffer',
            \ 'G' : 'menu:git',
            \ ':' : 'command',
          \ '/' : 'line',
          \ })
    exe 'nnoremap <unique>'.g:mapleader.k.' :Denite -cursor-wrap '.c.'<CR>'
endfor

let g:mapleader='-'

augroup mapsFiletype
    autocmd!
    au FileType tex,plaintex im <buffer><leader>]  <Plug>LatexCloseCurEnv
    au FileType tex,plaintex nm <buffer><leader>*  <Plug>LatexToggleStarEnv
    au FileType tex,plaintex nm <buffer><leader>ce <Plug>LatexChangeEnv
    au FileType tex,plaintex vm <buffer><leader>}  <Plug>LatexWrapSelection
    au FileType tex,plaintex vm <buffer><leader>se <Plug>LatexEnvWrapSelection
    au FileType python nm <buffer><leader>f :cal pymode#rope#find_it()<CR>
    au FileType cpp,haskell,perl,vim,python nm <buffer><CR> <Plug>unimpairedBlankDown
    au FileType help nn <buffer><CR> <C-]>
    au FileType help nn <buffer><BS> <C-T>
    au FileType help nn <buffer>q    :q<CR>
augroup END

augroup cppFiletype
    autocmd!
    au BufRead,BufNewFile *.h,*.c set filetype=cpp.doxygen
    au FileType cpp set filetype=cpp.doxygen
augroup END

