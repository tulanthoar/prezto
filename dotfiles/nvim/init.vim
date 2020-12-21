"{set utf8
 set encoding=utf-8
 scriptencoding utf-8
"}

"{disable builtin plugins
 let g:loaded_gzip = 1
 let g:loaded_man = 1
 let g:loaded_tarPlugin = 'v29'
 let g:loaded_2html_plugin = 'vim7.4_v2'
 let g:loaded_zipPlugin = 'v27'
"}

" git clone https://github.com/VundleVim/Vundle.vim.git ~/vimfiles/bundle/Vundle.vim

filetype off
set shellslash
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin('~/vimfiles/bundle')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"}
"{Syntax Folding
 " let g:vimsyn_folding='af'
 let g:tex_fold_enabled=1
 let g:clojure_fold = 1
 let g:ruby_fold = 1
 let g:perl_fold = 1
 let g:perl_fold_blocks = 1
"}
"{fold-cycle: incrementally fold/unfold nested folds
 let g:fold_cycle_default_mapping = 0
 Plugin 'arecarn/vim-fold-cycle'
"}
"{anyfold: better automatic folds and fold text
 let g:anyfold_fold_comments=2
 let g:anyfold_fold_level_str = '↴'
 let g:anyfold_fold_size_str = '%s'
 let g:anyfold_fold_comments=1
 let g:anyfold_motion=1
 let g:anyfold_fold_display=1
 augroup anyfold
     autocmd!
     au FileType undotree setl foldlevel=200
     au FileType nerdtree setl foldlevel=200
     au FileType help setl foldlevel=200
     au FileType startify setlocal foldlevel=200
     au VimEnter *
             \ nmap <expr><unique> <CR> foldlevel(getcurpos()[1]) ?
             \ "\<Plug>(fold-cycle-open)" : "\<Plug>(AnyfoldJumpprevfoldend)"
     au VimEnter *
             \ nmap <expr><unique> <S-Tab> foldlevel(getcurpos()[1]) ?
             \"\<Plug>(fold-cycle-close)":"\<Plug>(AnyfoldJumpnextfoldstart)+"
     autocmd Filetype * AnyFoldActivate
 augroup END
 Plugin 'pseewald/vim-anyfold'
"}
"{better-whitespace: highlight trailwhite \s and \t
 let g:better_whitespace_operator = ',Q'
 Plugin 'ntpeters/vim-better-whitespace'
"}
"{comfortable-motion: intertial scrolling
 let g:comfortable_motion_interval = 2000.0 / 60
 let g:comfortable_motion_friction = 100.0
 let g:comfortable_motion_air_drag = 5
 let g:comfortable_motion_no_default_key_mappings = 1
 let g:cmotion_f = 2
 augroup comfortable
     autocmd!
     au VimEnter * nnoremap <silent> <ScrollWheelDown> ^<Cmd>call
                 \ comfortable_motion#flick(g:cmotion_f * winheight(0))<CR>
     au VimEnter * nnoremap <silent> <ScrollWheelUp>   ^<Cmd>call
                 \ comfortable_motion#flick(-g:cmotion_f * winheight(0))<CR>
     au VimEnter *
                 \ nnoremap <silent> <C-d> ^<Cmd>call
                 \ comfortable_motion#flick(g:cmotion_f * winheight(0)*2)<CR>
     au VimEnter *
                 \ nnoremap <silent> <C-u> ^<Cmd>call
                 \ comfortable_motion#flick(g:cmotion_f * winheight(0)*-2)<CR>
     au VimEnter *
                 \ nnoremap <silent> <C-f> ^<Cmd>call
                 \ comfortable_motion#flick(g:cmotion_f * winheight(0)*4)<CR>
     au VimEnter *
                 \ nnoremap <silent> <C-b> ^<Cmd>call
                 \ comfortable_motion#flick(g:cmotion_f * winheight(0)*-4)<CR>
 augroup end
 Plugin 'yuttie/comfortable-motion.vim'
"}
"{indexed-search: tells you which out of how many total search results
 let g:indexed_search_center = 1
 let g:indexed_search_max_lines = 20000
 let g:indexed_search_max_hits = 2000
 let g:indexed_search_line_info = 1
 let g:indexed_search_shortmess = 1
 let g:indexed_search_numbered_only = 1
 Plugin 'henrik/vim-indexed-search'
"}
"{exchange: use the cx operator (X in vis) to swap regions
 let g:exchange_indent = '=='
 Plugin 'tommcdo/vim-exchange'
"}
"{swap: \x pivot operators; \p user pivot: \H with WORD right; \L left
 aug swappivot
     au!
     au VimEnter * vmap <leader>x  <plug>SwapSwapOperands
     au VimEnter * vmap <leader>p <plug>SwapSwapPivotOperands
     au VimEnter * nmap <leader>L  <plug>SwapSwapWithR_WORD
     au VimEnter * nmap <leader>H  <plug>SwapSwapWithL_WORD
 aug END
 Plugin 'kurkale6ka/vim-swap', {'name': 'vim-swap-pivot'}
"}
"{blockinsert: insert text or norm cmd at start/end of line or vblock bounds
 aug blockins
     au!
     au VimEnter * xmap <leader>i  <Plug>BlockinsertVInsert
     au VimEnter * xmap <leader>a  <Plug>BlockinsertVAppend
     au VimEnter * xmap <leader>qi <Plug>BlockinsertVQ_Insert
     au VimEnter * xmap <leader>qa <Plug>BlockinsertVQ_Append

     au VimEnter * nmap <leader>i  <Plug>BlockinsertNInsert
     au VimEnter * nmap <leader>a  <Plug>BlockinsertNAppend
     au VimEnter * nmap <leader>qi <Plug>BlockinsertNQ_Insert
     au VimEnter * nmap <leader>qa <Plug>BlockinsertNQ_Append

     au VimEnter * xmap <leader>[]  <Plug>BlockinsertVBoth
     au VimEnter * xmap <leader>[[  <Plug>BlockinsertVBSame
     au VimEnter * xmap <leader>]]  <Plug>BlockinsertVBSame
     au VimEnter * xmap <leader>q[] <Plug>BlockinsertVQ_Both
     au VimEnter * xmap <leader>q[[ <Plug>BlockinsertVQ_BSame
     au VimEnter * xmap <leader>q]] <Plug>BlockinsertVQ_BSame

     au VimEnter * nmap <leader>[]  <Plug>BlockinsertVBoth
     au VimEnter * nmap <leader>[[  <Plug>BlockinsertVBSame
     au VimEnter * nmap <leader>]]  <Plug>BlockinsertVBSame
     au VimEnter * nmap <leader>q[] <Plug>BlockinsertVQ_Both
     au VimEnter * nmap <leader>q[[ <Plug>BlockinsertVQ_BSame
     au VimEnter * nmap <leader>q]] <Plug>BlockinsertVQ_BSame
 aug END
 Plugin 'kurkale6ka/vim-blockinsert'
"}
"{NERDTree: tree file browser
 augroup nerdtree
     autocmd!
     au StdinReadPre * let s:std_in = 1
     au VimEnter * if argc() == 1 &&
                 \ isdirectory(argv()[0]) &&
                 \ !exists("s:std_in")
                 \ | exe 'NERDTree' argv()[0] | wincmd p | enew | wincmd p
                 \ | endif
 augroup END
 let g:NERDTreeGitStatusShowIgnored = 1
 let g:NERDTreeFileExtensionHighlightFullName = 1
 let g:NERDTreeExactMatchHighlightFullName = 1
 let g:NERDTreePatternMatchHighlightFullName = 1
 let g:NERDTreeHighlightFolders = 1
 let g:NERDTreeHighlightFoldersFullName = 1
 let g:NERDTreeHighlightCursorline = 0
 if !exists('g:NERDTreeGitStatusIndicatorMapCustom')
             let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '✎',
    \ 'Staged'    : '✔',
    \ 'Untracked' : '∩',
    \ 'Renamed'   : '⇒',
    \ 'Unmerged'  : '⊄',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?'
    \ }
     endif
 let g:NERDTreeAutoCenter = 1
 let g:NERDTreeAutoCenterThreshold = 10
 let g:NERDTreeCaseSensitiveSort = 0
 let g:NERDTreeSortHiddenFirst = 1
 let g:NERDTreeNaturalSort = 1
 let g:NERDTreeShowHidden = 1
 Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
 Plugin 'scrooloose/nerdtree'
 Plugin 'Xuyuanp/nerdtree-git-plugin'
"}
"{text object plugins: entire, line, and indent
 Plugin 'rhysd/vim-textobj-lastinserted'
 Plugin 'rhysd/vim-textobj-continuous-line'
 Plugin 'kana/vim-textobj-entire'
 Plugin 'kana/vim-textobj-line'
 Plugin 'kana/vim-textobj-lastpat'
 Plugin 'michaeljsmith/vim-indent-object'
 Plugin 'kana/vim-operator-user'
 Plugin 'kana/vim-textobj-user'
"}
"{targets: better text object handling
 Plugin 'wellle/targets.vim'
"}
"{eunuch: do linux shell commands especially SudoWrite (as w!!)
 augroup eunuch
     autocmd!
     au VimEnter * cnoreabbrev w!! SudoWrite
 augroup end
 Plugin 'tpope/vim-eunuch'
"}
"{commentary: gc operator to toggle comments on textobjs
 Plugin 'tpope/vim-commentary'
"}
"{repeat: expand '.' to do plugin operations
 Plugin 'tpope/vim-repeat'
"}
"{fugitive: git command aliases
 Plugin 'tpope/vim-fugitive'
"}
"{abolish: search or S/// in an intelligent way
 Plugin 'tpope/vim-abolish'
"}
"{unimpaired: convenient keybindings like [e swap lines and [\s insert blank
 Plugin 'tpope/vim-unimpaired.git'
"}
"{surround: opperate on surrounding pairs like () {} "" ,, etc
 Plugin 'tpope/vim-surround'
"}
"{FastFold: speed up folds by updating at select times
 let g:fastfold_skip_filetypes =
             \ [ 'taglist', 'gitcommit', 'startify', 'man', 'rst', ]
 Plugin 'Konfekt/FastFold'
"}
"{scratch: create a scratch window which can be viewed as preview window
 aug scratch
     au!
     au VimEnter * nnoremap <unique><leader>s <Cmd>ScratchInsert<CR>
     au VimEnter * xmap <unique><leader>s <plug>(scratch-selection-reuse)
     au VimEnter * xmap <unique><leader>S <plug>(scratch-selection-clear)
 aug END
 let g:scratch_no_mappings = 1
 let g:scratch_persistence_file = expand('$TMPDIR/vim.scratch')
 Plugin 'mtth/scratch.vim'
"}
"{Tabularize: use :T/regexp<CR> to make a table around regexp or \t in vmode
 aug tabular
     au!
     au VimEnter * command -nargs=1 -bar -range T exe ":Tabularize ".<q-args>
     au VimEnter * nnoremap <unique><expr><leader>t join(["<Cmd>Tabularize /",
            \ nr2char(getchar()), "<CR>" ], "")
     au VimEnter * xnoremap <unique><expr><leader>t join(["<Cmd>Tabularize /",
            \ nr2char(getchar()), "<CR>" ], "")
 aug END
 Plugin 'godlygeek/tabular'
"{swap{alt}: use \h or \l to swap comma deliminated function args
 let g:swap_no_default_key_mappings = 1
 aug swapargs
     au VimEnter * nmap <unique><leader>l <Plug>(swap-next)
     au VimEnter * nmap <unique><leader>h <Plug>(swap-prev)
 aug END
 Plugin 'machakann/vim-swap'
"}
"{ale:asynchronous linting engine
 let g:grammarous#default_comments_only_filetypes = {
             \ '*' : 1, 'help' : 0, 'markdown' : 0, 'tex' : 0
             \ }
 let g:grammarous#show_first_error = 1
 let g:ale_perl_perl_options = '-c -Mperl5i::2 -MPerl::Critic'
 let g:ale_perl_perlcritic_showrules = 1
 let g:ale_cursor_detail = 1
 let g:ale_sign_column_always = 1
 Plugin 'rhysd/vim-grammarous'
 Plugin 'rhysd/vim-fixjson'
 Plugin 'w0rp/ale'
"}
"{perl:
 let g:tlist_perl_settings ='perl;c:constants;f:formats;l:labels;p:packages;
 \ s:subroutines;d:subroutines;o:POD;t:Keyword Comments'
 let g:Templates_InternetBrowserExec = 'chromium'
 let g:Perl_CustomTemplateFile = expand
 \ ('${ZDOTD}/nvim/bundle/perl-support/templates/perl.templates')
 let g:Perl_LoadMenus = 'no'
 let g:Perl_Ctrl_j = 'no'
 let g:Perl_Ctrl_d = 'no'
 let g:Perl_PerlTags = 'on'
 let g:Perl_MapLeader = '-'
 let g:Perl_Perltidy = 'on'
 let g:Perl_Executable = '/usr/bin/site_perl/perl5i'
 Plugin 'c9s/perlomni.vim'
 Plugin 'WolfgangMehner/perl-support'
 Plugin 'vim-perl/vim-perl'
"}
"{vimtex:
 let g:vimtex_compiler_progname = 'nvr'
 Plugin 'lervag/vimtex'
"}
"{clever-split:
 Plugin 'rhysd/clever-split.vim'
"}
"{fill-with-blanks:
 Plugin 'rhysd/vim-operator-filled-with-blank'
"}
"{committia:
 Plugin 'rhysd/committia.vim'
"}
"{tagbar:
 Plugin 'majutsushi/tagbar'
"}
"{ctrlp:
 let g:ctrlp_cmd = 'CtrlPMRUFiles'
 let g:ctrlp_match_window = 'order:ttb'
 let g:ctrlp_by_filename = 1
 let g:ctrlp_switch_buffer = 'et'
 let g:ctrlp_use_caching = 0
 let g:ctrlp_user_command = 'ag --nocolor --hidden -l "" %s'
 let g:ctrlp_types = ['fil', 'mru']
 let g:ctrlp_tilde_homedir = 1
 let g:ctrlp_brief_prompt = 1
 let g:ctrlp_extensions = ['buffertag', 'quickfix', 'rtscript', ]
 Plugin 'ctrlpvim/ctrlp.vim'
"}
"{rainbow:
 let g:rainbow_active = 1
 let g:rainbow_conf = {
     \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
     \   'ctermfgs':['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
     \   'operators': '_,_',
     \   'parentheses': ['start=/(/ end=/)/',
     \                   'start=/\[/ end=/\]/',
     \                   'start=/{/ end=/}/'
     \                  ],
     \   'separately': {
     \       '*': {},
     \       'tex': {
     \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
     \       },
     \       'vim': {
     \           'parentheses':['start=/(/ end=/)/',
     \                          'start=/\[/ end=/\]/',
     \                          'start=/{/ end=/}/',
     \                          'start=/(/ end=/)/ containedin=vimFuncBody',
     \                          'start=/\[/ end=/\]/ containedin=vimFuncBody',
     \                          'start=/{/ end=/}/ containedin=vimFuncBody'
     \                         ],
     \       },
     \   }
     \}
 Plugin 'luochen1990/rainbow'
"}
"{indentline:
 let g:indentLine_char = 'ǁ'
 let g:indentLine_color_term = 135
 let g:indentLine_bgcolor_term = 233
 let g:indentLine_first_char = '╠'
 let g:indentLine_indentLevel = 10
 let g:indentLine_showFirstIndentLevel = '1'
 let g:indentLine_fileType = ['vim', 'perl', 'python', 'cpp',]
 let g:indentLine_faster = 0
 let g:indentLine_concealcursor='inc'
 let g:indentLine_leadingSpaceChar = '˔'
 let g:indentLine_leadingSpaceEnabled = 1
 Plugin 'Yggdroot/indentLine'
"}
"{stay:
 augroup vimstay
     autocmd!
     au VimEnter * cal extend(g:volatile_ftypes, ['taglist', 'rst','scratch'])
 augroup end
 Plugin 'kopischke/vim-stay'
"}
"{autoformat:
  augroup autoformat
      au!
      au VimEnter * nnoremap <unique> Q     <Cmd>Autoformat<CR>
  aug END
 let g:formatters_python = ['yapf']
 let g:formatters_zsh = ['shfmt']
 let g:autoformat_autoindent = 0
 let g:autoformat_remove_trailing_spaces = 1
 let g:formatdef_custom_cpp = '"astyle"'
 let g:formatters_cpp = ['custom_cpp']
 Plugin 'Chiel92/vim-autoformat'
"}
"{hardtime:
 let g:list_of_insert_keys = ['<UP>', '<DOWN>', '<LEFT>', '<RIGHT>',]
 let g:list_of_visual_keys = ['gh', 'gj', 'gk', 'gl',] + g:list_of_insert_keys
 let g:list_of_normal_keys = g:list_of_visual_keys + ['x']
 let g:hardtime_maxcount = 2
 let g:hardtime_default_on = 1
 let g:hardtime_timeout = 2000
 Plugin 'takac/vim-hardtime'
"}
"{highlightedyank:
 let g:highlightedyank_highlight_duration = -1
 Plugin 'machakann/vim-highlightedyank'
"}
"{asterisk:
 aug asterisk
     au!
     au VimEnter * nmap <unique> S <Plug>(asterisk-z*)
     au VimEnter * omap <unique> S <Plug>(asterisk-z*)
 aug END
 Plugin 'haya14busa/vim-asterisk'
"}
"{visual-star-search:
 Plugin 'nelstrom/vim-visual-star-search'
"}
"{man:
 augroup manpages
     autocmd!
     au VimEnter * com! -nargs=+ -bar -complete=customlist,man#completion#run
                 \ Man call man#get_page('tab', <f-args>)
 augroup end
 Plugin 'vim-utils/vim-man'
"}
"{echodoc:
 let g:echodoc_enable_at_startup = 1
 Plugin 'Shougo/echodoc.vim'
"}
"{side-search:
 let g:side_search_split_pct = 0.5
 Plugin 'ddrscott/vim-side-search'
"}

"{denite:
 augroup denitecmds
     autocmd!
     for [s:k, s:c] in items({
             \ "\<C-J>" : "\<denite:move_to_next_line>",
             \ "\<C-K>" : "\<denite:move_to_previous_line>",
             \ })
         exe 'au VimEnter * cal '.
                 \ "denite#custom#map('insert','".s:k."','".s:c."','noremap')"
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
 Plugin 'iyuuya/denite-ale'
 Plugin 'Shougo/unite.vim'
 Plugin 'Shougo/denite.nvim'
"}

"{multiple-cursors:
 let g:multi_cursor_use_default_mapping=0
 function! g:Multiple_cursors_before()
     let g:deoplete#disable_auto_complete = 1
 endfunction
 function! g:Multiple_cursors_after()
     let g:deoplete#disable_auto_complete = 0
 endfunction
 let g:multi_cursor_start_word_key      = '<C-h>'
 let g:multi_cursor_select_all_word_key = '<M-C-H>'
 let g:multi_cursor_start_key           = 'g<C-h>'
 let g:multi_cursor_select_all_key      = 'g<M-C-H>'
 let g:multi_cursor_next_key            = '<C-h>'
 let g:multi_cursor_prev_key            = '<C-p>'
 let g:multi_cursor_skip_key            = '<C-n>'
 let g:multi_cursor_quit_key            = '<Esc>'
 let g:multi_cursor_exit_from_visual_mode = 0
 let g:multi_cursor_exit_from_insert_mode = 0
 let g:multi_cursor_visual_maps = {'i':1, 'a':1, 'f':1, 't':1,}
 Plugin 'terryma/vim-multiple-cursors'
"}

"{startify:
 let g:startify_bookmarks = [ { 'n': '~/AppData/Local/nvim/init.vim' }, ]
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
"}

"{ultisnips:
 let g:UltiSnipsEditSplit='vertical'
 let g:UltiSnipsExpandTrigger='<s-tab>'
 let g:UltiSnipsJumpForwardTrigger='<s-tab>'
 let g:UltiSnipsJumpBackwardTrigger='<CR>'
 Plugin 'SirVer/ultisnips'
 Plugin 'honza/vim-snippets'
"}
"{signature:
 let g:SignatureDeleteConfirmation = 1
 let g:SignatureForceMarkPlacement = 1
 let g:SignatureForceMarkerPlacement = 1
 let g:SignatureMarkTextHLDynamic = 1
 let g:SignatureMarkerTextHLDynamic = 1
 let g:SignatureMarkLineHL = 'TermCursorNC'
 Plugin 'kshenoy/vim-signature'
"}
"{gitgutter:
 augroup gitgutter
     au!
     au VimEnter * nmap <unique> [g <Plug>GitGutterPrevHunk
     au VimEnter * nmap <unique> ]g <Plug>GitGutterNextHunk
     au VimEnter * omap <unique> ig <Plug>GitGutterTextObjectInnerPending
     au VimEnter * omap <unique> ag <Plug>GitGutterTextObjectOuterPending
     au VimEnter * xmap <unique> ig <Plug>GitGutterTextObjectInnerVisual
     au VimEnter * xmap <unique> ag <Plug>GitGutterTextObjectOuterVisual
 augroup END
 let g:gitgutter_highlight_lines = 0
 let g:gitgutter_map_keys = 0
 let g:gitgutter_max_signs = 3000
 Plugin 'airblade/vim-gitgutter'
"}
"{move:
 augroup movelines
     au!
     au VimEnter * vmap <A-J> <Plug>MoveBlockDown
     au VimEnter * nmap <A-J> <Plug>MoveLineDown
     au VimEnter * vmap <A-K> <Plug>MoveBlockUp
     au VimEnter * nmap <A-K> <Plug>MoveLineUp
     au VimEnter * vmap <A-L> <Plug>MoveBlockLeft
     au VimEnter * nmap <A-L> <Plug>MoveCharLeft
     au VimEnter * vmap <A-H> <Plug>MoveBlockRight
     au VimEnter * nmap <A-H> <Plug>MoveCharRight
 aug END
 let g:move_map_keys = 0
 Plugin 'matze/vim-move'
"}
"{easymotion:
 aug easymotion
     au!
 for [s:k, s:c] in items({
             \ 'w': 'bd-wl',
             \ 'f': 'bd-fl',
             \ 't': 'bd-tl',
             \ 'j': 'bd-jk',
             \ 'k': 'bd-jk',
             \ })
     exe 'au VimEnter * map <expr><unique> '.s:k.' v:count ? "'
                 \ .s:k.'" : "\<Plug>(easymotion-'.s:c.')"'
 endfor
 au VimEnter * nmap <expr><unique> e v:count ? "e" : "\<Plug>(easymotion-bd-el)"
 au VimEnter * xmap <expr><unique> e v:count ? "e" : "\<Plug>(easymotion-bd-el)"
 au VimEnter * omap <expr><unique> e v:count ? "e" :"v\<Plug>(easymotion-bd-el)"
 au VimEnter * map <expr><unique> s v:count ? "s" : "\<Plug>(easymotion-bd-f2)"
 aug END
 let g:EasyMotion_space_jump_first = 1
 let g:EasyMotion_use_smartsign_us = 1
 let g:EasyMotion_keys = 'ASDFGHJKLQWERUIO;'
 let g:EasyMotion_smartcase = 1
 let g:EasyMotion_startofline = 0
 let g:EasyMotion_use_upper = 1
 Plugin 'easymotion/vim-easymotion'
"}

"{deoplete:
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
 if !exists('g:deoplete#omni#input_patterns')
     let g:deoplete#omni#input_patterns = {}
 endif
 if !exists('g:deoplete#omni#functions')
     let g:deoplete#omni#functions = {}
 endif
 if !exists('g:neoinclude#reverse_exprs')
     let g:neoinclude#reverse_exprs = {}
 endif
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
 let g:deoplete#sources#jedi#show_docstring = 1
 let g:deoplete#sources#jedi#worker_threads = 2
 let g:deoplete#sources#jedi#python_path = expand('$VIRTUAL_ENV/bin/python3')
 let g:deoplete#omni#input_patterns.perl = ['[a-zA-Z_]\+->',]
 let g:deoplete#omni#functions.perl = 'PerlComplete'
 let g:neoinclude#reverse_exprs.perl =
             \ "fnamemodify(substitute(v:fname,\"/\", \"::\", \"g\"), \":r\")"
 augroup deopletecommands
     autocmd!
     au VimEnter * cal deoplete#enable()
     au VimEnter * cal deoplete#custom#option(
                 \ 'deoplete-options-auto_complete_delay', 500)
     au FileType python let g:deoplete#delimiters = ["/", ".", "(",]
     au FileType perl   let g:deoplete#delimiters =
                 \ ["/", "->", "(", "::", "$", "@", "%",]
     au FileType vim    let g:deoplete#delimiters = ["/", ":", "(", "'",]
     au FileType cpp    let g:deoplete#delimiters = ["/", ":", "(", ".",]
 augroup end
 Plugin 'Shougo/neco-syntax'
 Plugin 'Shougo/neco-vim'
 Plugin 'Shougo/neoinclude.vim'
 Plugin 'SevereOverfl0w/deoplete-github'
 Plugin 'Shougo/context_filetype.vim'
 Plugin 'zchee/deoplete-jedi'
 Plugin 'tweekmonster/deoplete-clang2'
 Plugin 'Shougo/deoplete.nvim'
"}

"{base16:
 let g:base16colorspace=256
 Plugin 'chriskempson/base16-vim'
"}
"{airline:
 let g:airline_exclude_preview = 1
 let g:airline_exclude_filenames = ['__doc__']
 let g:airline_powerline_fonts = 1
 let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
 let g:airline#extensions#ale#enabled = 1
 let g:airline#extensions#branch#enabled = 0
 let g:airline#extensions#hunks#enabled = 0
 let g:airline#extensions#ctrlp#show_adjacent_modes = 1
 let g:airline#extensions#tabline#enabled = 1
 let g:airline#extensions#tabline#show_splits = 1
 let g:airline#extensions#tabline#excludes =
             \ [ 'pydir.log', 'pyrun.log', "'__doc__'", 'scratch']
 let g:airline#extensions#tabline#exclude_preview = 1
 let g:airline#extensions#tabline#buffers_label = ''
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
     let g:airline_section_b = airline#section#create
                 \(["%{fnamemodify(getcwd(), \":p:~\")}"])
     let g:airline_section_c =
                 \ airline#section#create(["%{bufname(\"%\")}"])
     let g:airline_section_z =
                 \ airline#section#create( [ 'linenr', 'maxlinenr', ':%2v' ] )
 endfunction
 aug airlineau
     au!
 au User AirlineAfterInit cal AirlineInit()
 aug END
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'mkitt/tabline.vim'
 Plugin 'bling/vim-airline'
"}
"{delimitmate:
 augroup delimitemate
     autocmd!
     au VimEnter * imap <silent><unique> <Tab> <Plug>delimitMateS-Tab
     au FileType python let b:delimitMate_nesting_quotes = ["\"",]
     au FileType python let b:delimitMate_expand_inside_quotes = 1
     au FileType perl,cpp   let b:delimitmate_insert_eol_marker = 1
     au FileType perl,cpp   let b:delimitMate_eol_marker = ";"
 augroup END
 let g:delimitMate_expand_cr = 1
 let g:delimitMate_expand_space = 1
 let g:delimitMate_jump_expansion = 1
 let g:delimitMate_balance_matchpairs = 1
 Plugin 'Raimondi/delimitMate'
"}
"{undotree:
 function g:Undotree_CustomMap()
     nmap <buffer>K <Plug>UndotreeGoNextState
     nmap <buffer>J <Plug>UndotreeGoPreviousState
     nmap <buffer>N <Plug>UndotreeGoNextSaved
     nmap <buffer>P <Plug>UndotreeGoPreviousSaved
     nmap <buffer>q <Plug>UndotreeToggle
 endfunc
 let g:undotree_SplitWidth = 30
 Plugin 'mbbill/undotree'
"}
"{YankRing:
 augroup yankring | exe 'au!' | exe 'au TextYankPost * YRPush' | augroup end
 function! YRRunAfterMaps()
     nnoremap <expr> @ join( [ "<Cmd>HardTimeOff<CR><Cmd>normal! @",
         \ nr2char(getchar()), "<CR><Cmd>HardTimeOn<CR>" ], "")
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
"}
"{expand-region:
 aug expandregion
     au!
     au VimEnter * xmap     <unique> v     <Plug>(expand_region_expand)
     au VimEnter * nunmap +
 aug END
 let g:expand_region_text_objects = {'iw':0, 'iW':0, "i\"":0, "a\"":0, "i'":0,
             \ "a'":0, 'ib':1, 'ab':1, 'i]':1, 'iB':1, 'il':0, 'ii':1, 'ai':1,
             \ 'ip':0, 'ie':0, }
 let g:expand_region_text_objects_python = { 'iA':0, 'iB':0, 'ai':1, }
 Plugin 'terryma/vim-expand-region'
"}
"{gutentags:
 let g:gutentags_project_root=['.git', '.gutentagthis', 'Makefile',
             \ 'develop.json', '.hg']
 let g:gutentags_ctags_exclude = ['TARGET']
 let g:gutentags_generate_on_empty_buffer=1
 let g:gutentags_resolve_symlinks=1
 let g:gutentags_add_default_project_roots=0
 if !exists('g:gutentags_project_info')|let g:gutentags_project_info=[]|endif
 call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
 call add(g:gutentags_project_info, {'type': 'cpp', 'file': 'Makefile'})
 call add(g:gutentags_project_info, {'type': 'c', 'file': 'Makefile'})
 Plugin 'ludovicchabant/vim-gutentags'
"}
"{latex-live-preview:
 let g:livepreview_previewer = 'tabbed -f -r 2 zathura -e ""'
 let g:livepreview_engine = 'latexmk' . ' -pdf -shell-escape'
 Plugin 'xuhdev/vim-latex-live-preview'
"}
"{pythonmode:
 function! Jedi_doc_imp()
     try
     silent PythonJedi if jedi_vim.show_documentation() is None:
                 \ vim.command('retu')
     silent call pymode#tempbuffer_open('__doc__')
     silent PymodePython pymode.get_documentation()
     silent normal! gg3dd
     setlocal nomodifiable nomodified filetype=rst foldlevel=200
     wincmd p
 catch
     silent hide
 endtry
 endfunction
 aug jedi|exe 'au!'|exe 'au CursorHold *.py call Jedi_doc_imp()'|aug end
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
 let g:python3_host_prog = 'C:\Users\natha\virtualenvs\nvimpy3\Scripts\python.exe'
 "let g:python_host_prog = expand('$VIRTUAL_ENV/../venv2/pyenv2/bin/python2')
 let g:python_no_builtin_highlight = 1
 let g:python_no_exception_highlight = 1
 let g:python_no_doctest_highlight = 1
 let g:python_no_doctest_code_highlight = 1
 augroup pythonmode
     autocmd!
     au FileType python setl
                 \ def=^\s*\\(def\\\\|class\\) cms=#%s nowrap fo-=t cpt+=t
     au FileType python let b:match_words =
                 \ "def:return,if:elif:else,try:except,from:import"
 augroup end
 Plugin 'davidhalter/jedi-vim'
 " Plugin 'tmhedberg/SimpylFold'
 Plugin 'tweekmonster/impsort.vim'
 Plugin 'klen/python-mode'
"}
"{devicons: keep this one last
 Plugin 'ryanoasis/vim-devicons'
"}

"{finish plugins
 call vundle#end()
 " call neomake#configure#automake('nw', 750)
 filetype plugin indent on
 syntax enable
 colorscheme base16-seti
"}

"{set options
 set autowrite
 set background=dark
 "set backupdir=~/vimfiles/nvim/files/backup/
 set clipboard+="unnamed,unnamedplus,autoselect"
 set cmdheight=2
 set colorcolumn=+1
 set completeopt=menuone,noselect,preview
 set conceallevel=2
 set concealcursor=inc
 set cpoptions+=Dt$
 set cursorcolumn
 set cursorline
 "set directory=~/vimfiles/nvim/files/swap/
 set errorbells
 set expandtab
 set fileformats=dos,unix
 set foldcolumn=1
 set foldenable
 set foldlevel=0
 set foldmethod=expr
 set foldminlines=0
 set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
 set gdefault
 set hidden
 set helpheight=30
 set ignorecase
 set isfname+={,}
 set list
 set listchars=tab:>┈,trail:┅,nbsp:+,extends:╡,precedes:╞,eol:┊
 set matchpairs=(:),[:],{:}
 set matchtime=2
 set mouse=a
 set path+=/usr/local/include,mbed-os
 set previewheight=10
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
 set shell=bash
 set softtabstop=4
 set tabstop=4
 set tagcase=match
 set tags=
 set timeoutlen=1000
 "set undodir=${HOME}/.config/nvim/files/.undo/
 set undofile
 set updatetime=4000
 set viewoptions=cursor,folds,slash,unix
 set virtualedit=block
 set visualbell
 set shada='100,h,s1000
 set whichwrap+=<,>,h,l
 set wildignore=*.o,*~,*.pyc
 set wildmode=list:longest,list:full
 set nowrap
"}

"{autocommands related to buffer setlocal
 augroup autooptions
     autocmd!
     au WinEnter * setlocal cursorline cursorcolumn
     au WinLeave * setlocal nocursorcolumn nocursorline
     au InsertEnter * setlocal timeoutlen=800
     au InsertLeave * setlocal timeoutlen=1300
     au FileType vim setlocal matchpairs=(:),[:],{:},<:>
     au FileType tex setlocal conceallevel=0
 augroup END
"}

"{syntax highlighting
 hi Conceal                            ctermfg=16
 hi CursorColumn           ctermbg=237
 hi CursorLine             ctermbg=237
 hi FoldColumn             ctermbg=26
 hi Folded                 ctermbg=234
 hi IncSearch              cterm=bold,inverse
 hi link Search IncSearch
 hi LineNr                 ctermbg=18
 hi MatchParen             ctermbg=23  ctermfg=20 cterm=bold
 hi Normal                 ctermfg=10
 hi NormalNC               ctermfg=2
 hi SignColumn             ctermbg=25
 hi SpellBad               cterm=standout
 hi SpellCap               cterm=bold,underline
 hi StatusLine             ctermbg=234
 hi Substitute             cterm=standout
 hi TermCursorNC           ctermbg=236 ctermfg=none
 hi VertSplit              ctermbg=25
 hi Visual                 ctermbg=233 cterm=inverse
 hi Whitespace             ctermfg=19
 hi WildMenu               ctermbg=236 cterm=bold

 hi SyntasticErrorLine     ctermbg=126 cterm=underline
 hi SyntasticWarningLine   ctermbg=136 cterm=underline
 hi HighlightedyankRegion  ctermbg=238  ctermfg=none cterm=bold
 hi pythonFunctionTag      ctermbg=23  cterm=bold ctermfg=9
 hi pythonMethodTag        ctermbg=23  cterm=bold ctermfg=12
 hi pythonClassTag         ctermbg=23  cterm=bold ctermfg=11
 hi pythonImportedObject   ctermbg=22  cterm=bold ctermfg=10
 hi pythonImportedFuncDef  ctermbg=22  cterm=bold ctermfg=9
 hi pythonImportedClassDef ctermbg=22  cterm=bold ctermfg=11
 hi link perlFunctionTag      pythonFunctionTag
 hi link vimAutoGroupTag      pythonClassTag
 hi link vimCommandTag        pythonFunctionTag
 hi link vimFuncNameTag       pythonMethodTag
 hi link vimScriptFuncNameTag pythonMethodTag
"}

noremap <unique>gs s

inoremap <silent><expr><unique><C-K>   pumvisible() ? "\<C-P>" : "\<Del>"
inoremap <silent><expr><unique><C-J>   pumvisible() ? "\<C-n>" : "\<C-J>"
for s:m in ['nmap', 'omap', 'xmap',]|exe s:m.' <unique><tab> %'|endfor
snoremap <unique><Tab> <C-O>%
inoremap <unique><C-A> <C-@>
noremap! <unique><C-Q> <Cmd>YRPush '+'<CR><C-R><C-P>+
noremap! <unique><MiddleMouse> <Cmd>YRPush '*'<CR><C-R><C-P>*
noremap! <unique><C-Space> <Esc>gUiw`]a

nnoremap <unique>'[ `[
nnoremap <unique>'] `]
nnoremap <unique>'< `<
nnoremap <unique>'> `>
nnoremap <unique>`[ '[
nnoremap <unique>`] ']
nnoremap <unique>`< '<
nnoremap <unique>`> '>

noremap  <unique>h     ^
noremap  <unique>gh    h
noremap  <unique>l     $
noremap  <unique>gl    l
nnoremap <unique>gf    <Cmd>cd %:p:h|normal! gf<CR>
nnoremap <unique>v     viw

xnoremap <unique>J     <esc>
inoremap <unique>jf    <esc>
inoremap <unique>fj    <esc>

xnoremap <unique><C-Space>  c<Space><C-R>"<Space><C-C>
nnoremap <unique><c-Space> <C-I>
nnoremap <unique><Space>   <C-O>
nnoremap <unique>K     g<C-]>
nnoremap <unique><F10> <Cmd>xa<cr>
nnoremap <unique><F9> <Cmd>qa<cr>

let g:mapleader=','
nnoremap <unique><leader>k     <Cmd>wall<CR>
nnoremap <unique><leader>r    <Cmd>noh|dif|syn sync fromstart<CR><C-L>
nmap     <unique><leader>n    <Plug>(easymotion-bd-n)
nnoremap <unique><leader>v    <C-V>
nnoremap <unique><leader>.    <Cmd>normal! @:<CR>
noremap  <unique><expr><leader>q   join( [ "<Cmd>HardTimeOff<CR><Cmd>norm! @",
            \ nr2char(getchar()), "<CR><Cmd>HardTimeOn<CR>" ], "")
noremap  <unique><leader>d    <Cmd>hide<CR>
nnoremap <leader><Space>       <Cmd>ScratchPreview<CR>
nnoremap <unique><leader>ss   <Cmd>CleverSplit<CR>
nnoremap <unique><leader>sv   <Cmd>vs<CR>
nnoremap <unique><leader>sh   <Cmd>sp<CR>
nnoremap <unique><leader>cd   <Cmd>cd %:p:h<CR>
nmap <unique><leader>b <Plug>AirlineSelectPrevTab
nmap <unique><leader>f <Plug>AirlineSelectNextTab
nnoremap <unique><leader>t       <Cmd>TagbarOpen<CR>
nnoremap <unique><leader>ag    :SideSearch ""<Left>
xnoremap <unique><leader>ag    y<Cmd>SideSearch <C-r><C-r>"|wincmd p<CR>
nnoremap <silent><unique><leader>N <Cmd>NERDTreeToggle<CR>
nnoremap <unique><leader><C-Space> <Cmd>Startify<CR>
nnoremap <unique><leader>m       <Cmd>CtrlPMRUFiles<CR>
nnoremap <unique><leader>y       <Cmd>YRShow<CR>
nnoremap <unique><leader>u       <Cmd>UndotreeToggle<CR>
nnoremap <unique><leader>'       <Cmd>SignatureListBufferMarks 1|lclose|
            \Denite -cursor-wrap unite:location_list<CR>
nnoremap <unique><leader>O <Cmd>Denite -vertical-preview
            \ -auto-preview -cursor-wrap outline<CR>

for s:n in range(1,9)
    exe 'nmap <unique>'.g:mapleader.s:n.' <Plug>AirlineSelectTab'.s:n
endfor
for [s:k,s:c] in items({
            \ 'L' : 'unite:location_list',
            \ 'Q' : 'unite:quickfix',
            \ 'H' : 'help',
            \ 'B' : 'buffer',
            \ 'G' : 'menu:git',
            \ ';' : 'command',
            \ '/' : 'line',
            \ })
    exe 'nnoremap <unique><leader>'.s:k.'
                \ <Cmd>Denite -cursor-wrap '.s:c.'<CR>'
endfor

let g:mapleader=';'

augroup mapsFiletype
    autocmd!
    " au FileType tex,plaintex im <buffer><leader>]  <Plug>LatexCloseCurEnv
    " au FileType tex,plaintex nm <buffer><leader>*  <Plug>LatexToggleStarEnv
    " au FileType tex,plaintex nm <buffer><leader>ce <Plug>LatexChangeEnv
    " au FileType tex,plaintex vm <buffer><leader>}  <Plug>LatexWrapSelection
    " au FileType tex,plaintex
    " \ vm <buffer><leader>se <Plug>LatexEnvWrapSelection
    au FileType python nm <buffer><leader>f <Cmd>cal pymode#rope#find_it()<CR>
    " au FileType cpp,haskell,perl,vim,python
    " \ nm <buffer><CR> <Plug>unimpairedBlankDown
    " au FileType help nn <buffer><CR> <C-]>
    au FileType help nn <buffer><BS> <C-T>
    au FileType help nn <buffer>q    <Cmd>q<CR>
augroup END

augroup cppFiletype
    autocmd!
    au BufRead,BufNewFile *.h,*.c setlocal filetype=cpp.doxygen
    au FileType cpp setlocal filetype=cpp.doxygen
augroup END
