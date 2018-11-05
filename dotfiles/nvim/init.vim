set encoding=utf-8
scriptencoding utf-8
" init on 2016-05-26
let s:iCanHazVundle=1
let s:vundle_path=expand('$HOME/.config/nvim/bundle/Vundle.vim')
if !isdirectory(s:vundle_path)
    echo 'Making Vundle Path - ' . s:vundle_path
    echo ''
    silent !mkdir -p s:vundle_path
endif
let s:vundle_readme=s:vundle_path . '/README.md'
if !filereadable(s:vundle_readme)
    echo 'Installing Vundle..'
    echo ''
    silent !git clone --depth=1 --branch=master https://github.com/VundleVim/Vundle.vim ~/.config/nvim/bundle/Vundle.vim
    let s:iCanHazVundle=0
endif
let g:loaded_gzip = 1
let g:loaded_man = 1
let g:loaded_tarPlugin = 'v29'
let g:loaded_2html_plugin = 'vim7.4_v2'
let g:loaded_zipPlugin = 'v27'
filetype off
set runtimepath+=~/.config/nvim/bundle/Vundle.vim
let s:bundle_path = substitute(s:vundle_path, '/Vundle\.vim$', '', '')
call vundle#begin(s:bundle_path)
Plugin 'VundleVim/Vundle.vim'

Plugin 'tommcdo/vim-exchange'
" Plugin 'w0rp/ale'

" Plugin 'DoxygenToolkit.vim'
" let g:DoxygenToolkit_blockFooter = "-----------------------------------------"
" let g:DoxygenToolkit_compactDoc = "yes"
" let g:DoxygenToolkit_authorName = "Nathan Yonkee"
" let g:DoxygenToolkit_briefTag_funcName = "yes"
" let g:DoxygenToolkit_briefTag_post = ": "
" let g:DoxygenToolkit_briefTag_className = "yes"

Plugin 'lambdalisue/suda.vim'
Plugin 'kurkale6ka/vim-swap'
let g:blockinsert_commands = 1
Plugin 'kurkale6ka/vim-blockinsert'

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

let g:targets_pairs = '()b {}B []a <>A'
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

" Plugin 'benmills/vimux'

" XXX sidesearch
let g:side_search_split_pct = 0.5
Plugin 'ddrscott/vim-side-search'

" XXX swap
" let g:swap_no_default_key_mappings = 1
" Plugin 'machakann/vim-swap'

let g:list_of_insert_keys = ['<UP>', '<DOWN>', '<LEFT>', '<RIGHT>',]
let g:list_of_visual_keys = ['gh', 'gj', 'gk', 'gl',] + g:list_of_insert_keys
let g:list_of_normal_keys = g:list_of_visual_keys + ['x']
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

let g:formatters_python = ['yapf']
let g:formatters_zsh = ['shfmt']
let g:autoformat_autoindent = 0 " don't use vims formatter for indentation
let g:autoformat_remove_trailing_spaces = 1
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
let g:rbpt_colorpairs = [ ['1'],['4'],['3'],['2'],['16'],]
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
    au VimEnter * cal extend(g:volatile_ftypes, ['taglist', 'rst',])
augroup end
Plugin 'kopischke/vim-stay'

let g:echodoc_enable_at_startup = 1
Plugin 'Shougo/echodoc.vim'

let g:indentLine_char = 'ǁ'
" let g:indentLine_char = '├'
"let g:indentLine_setColors = 0
let g:indentLine_color_term = 135
let g:indentLine_bgcolor_term = 233
let g:indentLine_first_char = '╠'
let g:indentLine_indentLevel = 10
let g:indentLine_showFirstIndentLevel = '1'
let g:indentLine_fileType = ['vim', 'perl', 'python', 'cpp',]
let g:indentLine_faster = 1
let g:indentLine_concealcursor='inc'
let g:indentLine_leadingSpaceChar = '˔'
let g:indentLine_leadingSpaceEnabled = 1
Plugin 'Yggdroot/indentLine'

let g:ctrlp_cmd = 'CtrlPMRUFiles'
let g:ctrlp_match_window = 'order:ttb'
let g:ctrlp_by_filename = 1
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = "ag %s -l --hidden --ignore \"\.undo\" --ignore \"\.local\" --nocolor -g \"\""
let g:ctrlp_types = ['fil', 'mru']
let g:ctrlp_tilde_homedir = 1
let g:ctrlp_brief_prompt = 1
let g:ctrlp_extensions = ['buffertag', 'quickfix', 'rtscript', ]
Plugin 'ctrlpvim/ctrlp.vim'

" let g:easytags_async = 1
" let g:easytags_by_filetype = expand("$HOME/.config/nvim/files/easy_tags")
" let g:easytags_events = ["BufWritePost", "BufWinEnter",]
" let g:easytags_include_members = 1
" let g:easytags_resolve_links = 1
" Plugin 'xolox/vim-misc'
" Plugin 'xolox/vim-easytags'

augroup denitecmds
    autocmd!
for [s:k, s:c] in items({
            \ "\<C-J>" : "\<denite:move_to_next_line>",
            \ "\<C-K>" : "\<denite:move_to_previous_line>",
            \ })
    exe "au VimEnter * cal denite#custom#map('insert','".s:k."','".s:c."','noremap')"
endfor
    au VimEnter * cal denite#custom#var('menu', 'menus', g:denite_menus)
augroup end
if !exists('g:denite_menus') | let g:denite_menus = {} | endif
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
Plugin 'osyo-manga/unite-quickfix'
Plugin 'rhysd/unite-redpen.vim'
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
let g:multi_cursor_visual_maps = {'i':1,'a':1,'f':1,'t':1,}
Plugin 'terryma/vim-multiple-cursors'

let g:startify_bookmarks = [ { 'n': '~/.config/nvim/init.vim' }, ]
let g:startify_commands = [
            \   { 'h':['help', 'Denite -cursor-wrap help'] },
            \   { 'f':['all files', 'CtrlP'] },
            \   { 'm':['MRU', 'CtrlPMRUFiles'] },
            \   { 'c':['cmds', 'Denite -cursor-wrap commands'] },
            \   { 'P':['Plugins Update', 'PluginUpdate'] }, ]
let g:startify_session_dir = expand('$HOME/.config/nvim/files/session')
let g:startify_list_order =
            \ [ 'files', 'dir', 'bookmarks', 'commands', 'sessions', ]
let g:startify_files_number = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_session_sort = 1
Plugin 'mhinz/vim-startify'

let g:surround_indent = 1
Plugin 'tpope/vim-surround'

" let g:tlWindowPosition = 1
" Plugin 'vim-scripts/TaskList.vim'

let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<s-tab>'
let g:UltiSnipsJumpBackwardTrigger='<CR>'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:perl_fold = 1
let g:fastfold_savehook = 1
let g:fastfold_skip_filetypes =
            \ [ 'taglist', 'gitcommit', 'startify', 'man', 'rst', ]
Plugin 'Konfekt/FastFold'

" let g:tmux_navigator_save_on_switch = 1
" let g:tmux_navigator_no_mappings = 1
" Plugin 'christoomey/vim-tmux-navigator'

let g:SignatureDeleteConfirmation = 1
let g:SignatureForceMarkPlacement = 1
let g:SignatureForceMarkerPlacement = 1
let g:SignatureMarkTextHLDynamic = 1
let g:SignatureMarkerTextHLDynamic = 1
let g:SignatureMarkLineHL = 'TermCursorNC'
Plugin 'kshenoy/vim-signature'

let g:gitgutter_highlight_lines = 0
let g:gitgutter_map_keys = 0
Plugin 'airblade/vim-gitgutter',

let g:move_map_keys = 0
Plugin 'matze/vim-move'

let g:EasyMotion_space_jump_first = 1
let g:EasyMotion_use_smartsign_us = 1
let g:EasyMotion_keys = 'ASDFGHJKLQWERUIO;'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_startofline = 0
let g:EasyMotion_use_upper = 1
Plugin 'easymotion/vim-easymotion'

Plugin 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#delimiters = ['/', '(',]
let g:deoplete#auto_complete_delay = 1
let g:deoplete#auto_refresh_delay = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#tag#cache_limit_size = 5000000
if !exists('g:deoplete#sources') | let g:deoplete#sources = {} | endif
let g:deoplete#sources._ = ['file',
            \ 'around',
            \ 'tag',
            \ 'neosnippet',
            \ 'member',
            \ 'buffer',
            \ 'syntax',
            \ 'include',
            \ 'ultisnips'
            \ ]
let g:deoplete#sources.python = g:deoplete#sources._ + [ 'jedi', ]
let g:deoplete#sources.perl = g:deoplete#sources._ + [ 'omni', ]
let g:deoplete#sources.vim = g:deoplete#sources._ + [ 'vim', ]
let g:deoplete#sources.haskell = g:deoplete#sources._ + [ 'ghc', ]
let g:deoplete#sources.cpp = g:deoplete#sources._ + [ 'clang2', ]
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
let g:deoplete#omni#input_patterns.perl = ['[a-zA-Z_]\+->',]
if !exists('g:deoplete#omni#functions')
    let g:deoplete#omni#functions = {}
endif
let g:deoplete#omni#functions.perl = 'PerlComplete'
if !exists('g:neoinclude#reverse_exprs')
    let g:neoinclude#reverse_exprs = {}
endif
let g:neoinclude#reverse_exprs.perl =
            \ "fnamemodify(substitute(v:fname, \"/\", \"::\", \"g\"), \":r\")"
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#sources#jedi#worker_threads = 2
let g:deoplete#sources#jedi#python_path = expand('$VIRTUAL_ENV/bin/python3')
augroup deopletecommands
    autocmd!
au VimEnter cal deoplete#enable()
au VimEnter cal deoplete#custom#option('deoplete-options-auto_complete_delay', 2000)
    au FileType python let g:deoplete#delimiters = ["/", ".", "(",]
    au FileType perl   let g:deoplete#delimiters =
                \ ["/", "->", "(", "::", "$", "@", "%",]
    au FileType vim    let g:deoplete#delimiters = ["/", ":", "(", "'",]
    au FileType cpp    let g:deoplete#delimiters = ["/", ":", "(", ".",]
    " au FileType * cal deoplete#custom#set("file", "rank", 159)
    " au FileType python  cal deoplete#custom#set("jedi", "rank", 99)
    " au FileType perl    cal deoplete#custom#set("omni", "rank", 99)
    " au FileType vim     cal deoplete#custom#set("vim", "rank", 99)
    " au FileType haskell cal deoplete#custom#set("ghc", "rank", 99)
    " au FileType cpp cal deoplete#custom#set("clang2", "rank", 99)
    " au FileType * cal deoplete#custom#set("member", "rank", 90)
    " au FileType * cal deoplete#custom#set("around", "rank", 89)
    " au FileType * cal deoplete#custom#set("neosnippet", "rank", 84)
    " au FileType * cal deoplete#custom#set("ultisnips", "rank", 83)
    " au FileType * cal deoplete#custom#set("buffer", "rank", 81)
    " au FileType * cal deoplete#custom#set("tag", "rank", 80)
    " au FileType * cal deoplete#custom#set("syntax", "rank", 79)
    " au FileType * cal deoplete#custom#set("include", "rank", 78)
    " au VimEnter * cal deoplete#custom#set("_", "matchers", ["matcher_fuzzy",])
augroup end
Plugin 'Shougo/neco-syntax'
Plugin 'Shougo/neco-vim'
Plugin 'Shougo/neoinclude.vim'
Plugin 'SevereOverfl0w/deoplete-github'
Plugin 'Shougo/context_filetype.vim'
Plugin 'zchee/deoplete-jedi'
Plugin 'tweekmonster/deoplete-clang2'

let g:base16colorspace=256
Plugin 'chriskempson/base16-vim'

let g:airline_exclude_preview = 1
let g:airline_exclude_filenames = ['__doc__']
let g:airline_powerline_fonts = 1
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#excludes =
            \ [ 'pydir.log', 'pyrun.log', "'__doc__'",]
let g:airline#extensions#tabline#exclude_preview = 1
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#whitespace#checks =
            \ ['indent', 'trailing', 'long', 'mixed-indent-file',]
let g:airline#extensions#whitespace#symbol = ''
let g:airline#extensions#wordcount#enabled = 0
let g:airline_theme = 'kolor'
if !exists('g:airline_symbols') | let g:airline_symbols = {} | endif
let g:airline_symbols.maxlinenr = ''
function! AirlineInit()
    let g:airline_section_b =
                \ airline#section#create(["%{fnamemodify(getcwd(), \":p:~\")}"])
    let g:airline_section_c =
                \ airline#section#create(["%{bufname(\"%\")}".
                \ "(%{fnamemodify(bufname(winbufnr(g:lastwin)), \":p:t\")})"])
    let g:airline_section_z =
                \ airline#section#create( [ 'linenr', 'maxlinenr', ':%2v' ] )
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

" let g:nrrw_rgn_nomap_nr = 1
" let g:nrrw_rgn_nomap_Nr = 1
" let g:nrrw_rgn_wdth = 80
" let g:nrrw_rgn_vert = 1
" let b:nrrw_aucmd_written = ":update"
" Plugin 'chrisbra/NrrwRgn'

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
let g:yankring_history_dir = '$HOME/.config/nvim/files'
let g:yankring_manual_clipboard_check = 1
let g:yankring_n_keys = ''
let g:yankring_o_keys = ''
let g:yankring_v_key = ''
let g:yankring_del_v_key = ''
let g:yankring_zap_keys = ''
let g:yankring_replace_n_nkey = "\<C-o>"
let g:yankring_replace_n_pkey = "\<C-l>"
let g:yankring_window_height = 12
Plugin 'vim-scripts/YankRing.vim'

" let g:syntastic_aggregate_errors = 1
" let g:syntastic_check_on_wq = 0
" let g:syntastic_cursor_column = 0
" let g:syntastic_error_symbol = "E>"
" let g:syntastic_warning_symbol = "W>"
" let g:syntastic_enable_balloons = 0
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_loc_list_height = 8
" let g:syntastic_exit_checks=0
" let g:syntastic_check_on_open = 1
" let g:syntastic_enable_signs = 1
" let g:syntastic_asm_checkers = ["gcc",]
" let g:syntastic_asm_compiler = "arm-none-eabi-gcc"
" let g:syntastic_asm_remove_include_errors = 1
" let g:syntastic_asm_compiler_options = "-mcpu=cortex-m4 -mthumb -mfloat-abi=softfp"
" let g:syntastic_cpp_checkers = ["clang_check","clang_tidy","cppcheck","cppclean","cpplint","flawfinder","gcc","oclint"]
" let g:syntastic_cpp_cpplint_exec = "cpplint"
" let g:syntastic_cpp_remove_include_errors=1
" let g:syntastic_cpp_include_dirs = ["mbed", "../Inc"]
" let g:syntastic_cpp_auto_refresh_includes = 1
" let g:syntastic_cpp_check_header = 1
" let g:syntastic_cmake_checkers = ["cmakelint",]
" let g:syntastic_json_checkers = ["jsonlint","jsonvalue"]
" let g:syntastic_perl_checkers = ["perl","perlcritic"]
" let g:syntastic_perl_interpreter="perl"
" let g:syntastic_enable_perl_checker = 1
" let g:syntastic_perl_lib_path=[]
" let g:pymode_lint_on_write = 0
" let g:syntastic_python_checkers = ["pylint",]
" let g:syntastic_sh_checkers = ["bashate","checkbashisms"]
" let g:syntastic_tex_checkers = ["ChkTex","lacheck","proselint", "text/language_check"]
" let g:syntastic_zshcheckers = ["zsh",]
" let g:syntastic_cpp_compiler_options = " -Wno-unused-parameter -Wno-missing-field-initializers
" \ -fmessage-length=0 -fno-exceptions -fno-builtin -ffunction-sections -fdata-sections -funsigned-char
" \ -MMD -fno-delete-null-pointer-checks -fomit-frame-pointer -Os -mcpu=cortex-m4 -mthumb
" \ -mfpu=fpv4-sp-d16 -mfloat-abi=softfp "
" let g:syntastic_cpp_compiler_options = "-std=gnu++11  -Wvla -c
"             \ -include -DTARGET_NUCLEO_L432KC -DARM_MATH_CM4  -DDEVICE_ANALOGIN=1 -DDEVICE_PWMOUT=1
"             \ -DDEVICE_CAN=1 -DDEVICE_INTERRUPTIN=1 -DDEVICE_SPISLAVE=1 -DMBED_BUILD_TIMESTAMP=1506392061.97 -DTOOLCHAIN_GCC_ARM
"             \ -DDEVICE_SERIAL_FC=1 -DDEVICE_TRNG=1 -D__MBED_CMSIS_RTOS_CM -DTARGET_RELEASE -DTARGET_STM -DTARGET_STM32L432KC
"             \ -D__FPU_PRESENT=1 -DDEVICE_SLEEP=1 -DDEVICE_PORTIN=1 -DTARGET_STM32L432xC -DDEVICE_I2C=1
"             \ -DTRANSACTION_QUEUE_SIZE_SPI=2 -D__CORTEX_M4 -DDEVICE_STDIO_MESSAGES=1
"             \ -DTARGET_STM32L4 -DDEVICE_SPI_ASYNCH=1 -DDEVICE_SERIAL=1 -DDEVICE_SPI=1
"             \ -DDEVICE_ANALOGOUT=1 -DTARGET_M4 -DTARGET_UVISOR_UNSUPPORTED
"             \ -DDEVICE_I2C_ASYNCH=1 -DTARGET_CORTEX_M -DTARGET_LIKE_CORTEX_M4
"             \ -DTOOLCHAIN_object -D__CMSIS_RTOS -DTARGET_FF_ARDUINO -DTOOLCHAIN_GCC
"             \ -DDEVICE_PORTINOUT=1 -DTARGET_RTOS_M4_M7 -DDEVICE_LOWPOWERTIMER=1 -DDEVICE_RTC=1
"             \ -D__MBED__=1 -DDEVICE_I2CSLAVE=1 -DTARGET_LIKE_MBED -DDEVICE_PORTOUT=1 "
" let g:syntastic_shell = "/bin/dash"
" Plugin 'scrooloose/syntastic'

let g:expand_region_text_objects = { 'iw':0, 'iW':0, "i\"":0, "a\"":0, "i'":0, "a'":0, 'ib':1, 'ab':1, 'i]':1, 'iB':1, 'il':0, 'ii':1, 'ai':1, 'ip':0, 'ie':0, }
let g:expand_region_text_objects_python = { 'iA':0, 'iB':0, 'ai':1, }
Plugin 'terryma/vim-expand-region'

let g:gutentags_project_root=['.git', '.gutentagthis', 'Makefile', 'develop.json', '.hg']
let g:gutentags_ctags_exclude = ['TARGET']
let g:gutentags_generate_on_empty_buffer=1
let g:gutentags_resolve_symlinks=1
let g:gutentags_add_default_project_roots=0
if !exists('g:gutentags_project_info')
    let g:gutentags_project_info = []
endif
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
call add(g:gutentags_project_info, {'type': 'cpp', 'file': 'Makefile'})
Plugin 'ludovicchabant/vim-gutentags'

let g:grammarous#default_comments_only_filetypes = {
            \ '*' : 1, 'help' : 0, 'markdown' : 0, 'tex' : 0
            \ }
let g:grammarous#show_first_error = 1
Plugin 'rhysd/vim-grammarous'
Plugin 'rhysd/vim-fixjson'
Plugin 'rhysd/clever-split.vim'
Plugin 'rhysd/vim-textobj-lastinserted'
Plugin 'rhysd/vim-textobj-continuous-line'
Plugin 'rhysd/tmpwin.vim'
Plugin 'rhysd/vim-operator-filled-with-blank'
Plugin 'rhysd/committia.vim'
Plugin 'lervag/vimtex'
Plugin 'neomake/neomake'
let g:vimtex_compiler_progname = 'nvr'
let g:neomake_tex_enabled_makers = ['chktex', 'lacheck', 'rubberinfo', 'proselint', 'writegood', 'redpen', 'alex']
function TexWritegoodPostprocess(entry)
            if a:entry.text !~# '".*"'
                call extend(a:entry,{'valid':-1})
            endif
        endfunction
let g:neomake_tex_writegood_maker = {
            \ 'exe': 'writegood',
            \ 'args': '',
            \ 'output_stream' : 'stdout',
            \ 'append_file': 1,
            \ 'errorformat': '%m line %l at column %c',
            \ 'postprocess': function('TexWritegoodPostprocess'),
            \ }

let g:neomake_tex_alex_maker = {
            \ 'exe': 'alex',
            \ 'args': '',
            \ 'output_stream' : 'both',
            \ 'append_file': 1,
            \ 'errorformat': '%+P%f,%*[\ ]%l:%c-%*[0-9]:%v%*[\ ]%m,%-Q',
            \ }
let g:neomake_tex_redpen_maker = {
            \ 'exe': 'redpen',
            \ 'args': ['-c', expand('$HOME/.redpenrc'), '-f', 'latex', '-r', 'plain', '-l', '100',],
            \ 'output_stream' : 'both',
            \ 'append_file': 1,
            \ 'errorformat': '%f:%l: %m',
            \ }
            " \ 'postprocess': function('TexWritegoodPostprocess'),

let g:neomake_cpp_mbed_maker = {
    \ 'exe': 'mbed',
    \ 'cwd': '',
    \ 'args': ['compile', '--profile', 'develop.json'],
    \ 'append_file': 0,
    \ 'errorformat': '%f:%l:%c: %m',
    \ }
let g:neomake_open_list = 2
Plugin 'xuhdev/vim-latex-live-preview'
let g:livepreview_previewer = 'tabbed -f -r 2 zathura -e ""'
let g:livepreview_engine = 'latexmk' . ' -pdf -shell-escape'

" " TODO configure perl templates
" let g:tlist_perl_settings = "perl;c:constants;f:formats;l:labels;p:packages;s:subroutines;d:subroutines;o:POD;t:Keyword Comments"
" let g:Templates_InternetBrowserExec = "chromium"
" let g:Perl_CustomTemplateFile = expand("${ZDOTD}/nvim/bundle/perl-support/templates/perl.templates")
" let g:Perl_LoadMenus = "no"
" let g:Perl_Ctrl_j = "on"
" let g:Perl_PerlTags = "on"
" Plugin 'vim-perl/vim-perl'
" Plugin 'c9s/perlomni.vim'
" Plugin 'WolfgangMehner/perl-support'

" let g:haskell_enable_quantification = 1
" let g:haskell_enable_recursivedo = 1
" let g:haskell_enable_arrowsyntax = 1
" let g:haskell_enable_pattern_synonyms = 1
" let g:haskell_enable_typeroles = 1
" let g:haskell_enable_static_pointers = 1
" let g:haskell_indent_if = 3
" let g:haskell_indent_case = 2
" let g:haskell_indent_let = 4
" let g:haskell_indent_where = 6
" let g:haskell_indent_do = 3
" let g:haskell_indent_in = 1
" let g:haskell_indent_guard = 2
" let g:cabal_indent_section = 2
" let g:haddock_browser = "/usr/bin/chromium"
" let g:haskellmode_completion_ghc = 0
" let g:necoghc_enable_detailed_browse = 1
" Plugin 'eagletmt/neco-ghc'
" Plugin 'neovimhaskell/haskell-vim.git'

function! Jedi_doc_imp()
    PythonJedi if jedi_vim.show_documentation() is None: vim.command('return')
    call pymode#tempbuffer_open('__doc__')
    silent $put=l:doc
    silent normal! gg
    silent normal! 3dd
    setlocal nomodifiable
    setlocal nomodified
    setlocal filetype=rst
    setlocal foldlevel=200 " do not fold in __doc__

    wincmd p
endfunction

augroup autojedi
    autocmd!
    autocmd CursorHold *.py call Jedi_doc_imp()
augroup end

let g:jedi#completions_command = ''
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "\<leader>g"
let g:jedi#goto_assignments_command = "\<leader>jf"
let g:jedi#documentation_command = "\<leader>d"
let g:jedi#rename_command = "\<leader>js"
let g:jedi#usages_command = "\<leader>8"
let g:jedi#auto_close_doc = 0
let g:jedi#use_splits_not_buffers = 'winwidth'
let g:jedi#completions_enabled = 0
let g:jedi#force_py_version = 3
let g:pymode_options = 0
let g:pymode_options_max_line_length = 90
let g:pymode_python = 'python3'
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
let g:pymode_rope_goto_definition_cmd = 'vnew'
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
let g:python3_host_prog = expand('$VIRTUAL_ENV/bin/python3')
let g:python_host_prog = expand('$VIRTUAL_ENV/../venv2/pyenv2/bin/python2')
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
call neomake#configure#automake('nw', 750)

filetype plugin indent on
syntax enable
colorscheme base16-seti

set autowrite
set background=dark
set backupdir=${HOME}/.config/nvim/files/backup/
set clipboard+="unnamed,unnamedplus,autoselect"
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
set listchars=tab:>┈,trail:┅,nbsp:+,extends:╡,precedes:╞,eol:┊
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
" set tags=./tags,./perltags,${HOME}/.vimtags
set tags=
set timeoutlen=1000
set undodir=${HOME}/.config/nvim/files/.undo/
set undofile
set updatetime=4000
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
    au FileType tex setl conceallevel=0
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
hi Conceal                            ctermfg=16
hi CursorColumn           ctermbg=237
hi CursorLine             ctermbg=237
hi HighlightedyankRegion  ctermbg=238  ctermfg=none cterm=bold
hi TermCursorNC           ctermbg=236 ctermfg=none
hi SyntasticErrorLine     ctermbg=126 cterm=underline
hi SyntasticWarningLine   ctermbg=136 cterm=underline
hi SpellBad               cterm=standout
hi SpellCap               cterm=bold,underline

hi link perlFunctionTag      pythonFunctionTag
hi link vimAutoGroupTag      pythonClassTag
hi link vimCommandTag        pythonFunctionTag
hi link vimFuncNameTag       pythonMethodTag
hi link vimScriptFuncNameTag pythonMethodTag

let g:clipboard = {
            \ 'name':'myClipboard',
            \ 'copy':{
            \  '+':'xsel --nodetach -i -b',
            \  '*':'xsel --nodetach -i -p',
            \ },
            \ 'paste': {
            \ '+':'xsel -o -b',
            \ '*':'xsel -o -p',
            \ },
            \ 'cache_enabled':1,
            \ }

cnoreabbrev T/  Tabularize //l1c1l0<left><left><left><left><left><left><left><c-h>
cnoreabbrev w!! :w suda://%<CR>


for [s:k, s:c] in items({
            \ 'w': 'bd-wl',
            \ 'f': 'bd-fl',
            \ 't': 'bd-tl',
            \ 'j': 'bd-jk',
            \ 'k': 'bd-jk',
            \ })
    exe 'map <expr><unique>'.s:k.' v:count ? "'.s:k.'" : "\<Plug>(easymotion-'.s:c.')"'
endfor

nmap <expr><unique> e v:count ? e : "\<Plug>(easymotion-bd-el)"
xmap <expr><unique> e v:count ? e : "\<Plug>(easymotion-bd-el)"
omap <expr><unique> e v:count ? e : "v\<Plug>(easymotion-bd-el)"

inoremap <silent><expr><unique> <C-K>   pumvisible() ? "\<C-P>" : "\<Del>"
inoremap <silent><expr><unique> <C-J>   pumvisible() ? "\<C-n>" : "\<C-J>"
imap     <silent>      <unique> <Tab>   <Plug>delimitMateS-Tab
snoremap <unique><Tab> <C-O>%
inoremap <unique> <C-S> <C-Y>
inoremap <unique><C-A> <C-@>
inoremap <unique><C-G><C-A> <C-A>
inoremap <unique><C-Q>     <C-V>

map <unique>s <Plug>(easymotion-bd-f2)
noremap <unique>gs s

for [s:k, s:c] in items({
            \ 'S': 'z*',
            \ })
    exe 'nmap <unique>'.s:k.' <Plug>(asterisk-'.s:c.')'
    exe 'omap <unique>'.s:k.' <Plug>(asterisk-'.s:c.')'
endfor

for s:m in ['nmap', 'omap', 'xmap',]
    exe s:m.' <unique><tab> %'
endfor

let g:lastwin = 1
augroup window_autos
    autocmd!
autocmd WinLeave /*/[^\[]*[^\]] let g:lastwin = winnr()
augroup end
nnoremap <silent><expr><unique><S-Tab> winnr() == g:lastwin ? "\<c-w>W" : winnr('$') > g:lastwin ? "\<c-w>W" : ":exe g:lastwin.'wincmd w'\<CR>"

nmap <unique> g. <Plug>(swap-next)
nmap <unique> g, <Plug>(swap-prev)
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
nnoremap <unique>K     g<C-]>
nnoremap <unique><C-K> <C-T>

nnoremap <unique><F10> <esc>:xa<cr>

let g:mapleader=','
nnoremap <unique><leader>k     :w<CR>
nnoremap          <unique><leader>z    zjzo
nnoremap  <silent><unique><leader>r    :noh<CR>:dif<CR>:syn sync fromstart<CR><C-L>
nmap              <unique><leader>n    <Plug>(easymotion-bd-n)
nnoremap          <unique><leader>v    <C-V>
nnoremap          <unique><leader>,    qj
nnoremap          <unique><leader>.    :HardTimeOff<CR>@j:HardTimeOn<CR>
noremap           <unique><leader>q    :qall<CR>
noremap           <unique><leader>d    :hide<CR>
nnoremap <silent><leader><Space>       :<C-U>call tmpwin#toggle(      'normal! gg'     )<CR>
nnoremap          <unique><leader>ss   :<C-U>CleverSplit<CR>
nnoremap          <unique><leader>sv   :vs<CR>
nnoremap          <unique><leader>sh   :sp<CR>
nnoremap          <unique><leader>cd   :cd %:p:h<CR>
nmap <unique><leader>b <Plug>AirlineSelectPrevTab
nmap <unique><leader>f <Plug>AirlineSelectNextTab

for s:n in range(1,9)
    exe 'nmap <unique>'.g:mapleader.s:n.' <Plug>AirlineSelectTab'.s:n
endfor

let g:mapleader=';'
nnoremap <unique><leader><Space> :Startify<CR>
nnoremap <unique><leader>y       :YRShow<CR>
nnoremap <unique><leader>t       :TlistOpen<CR>
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

for [s:k,s:c] in items({
            \ 'l' : 'unite:location_list',
            \ 'q' : 'unite:quickfix',
            \ 'h' : 'help',
            \ 'b' : 'buffer',
            \ 'G' : 'menu:git',
            \ ':' : 'command',
            \ '/' : 'line',
            \ })
    exe 'nnoremap <unique>'.g:mapleader.s:k.' :Denite -cursor-wrap '.s:c.'<CR>'
endfor

let g:mapleader='-'

augroup mapsFiletype
    autocmd!
    " au FileType tex,plaintex im <buffer><leader>]  <Plug>LatexCloseCurEnv
    " au FileType tex,plaintex nm <buffer><leader>*  <Plug>LatexToggleStarEnv
    " au FileType tex,plaintex nm <buffer><leader>ce <Plug>LatexChangeEnv
    " au FileType tex,plaintex vm <buffer><leader>}  <Plug>LatexWrapSelection
    " au FileType tex,plaintex vm <buffer><leader>se <Plug>LatexEnvWrapSelection
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
