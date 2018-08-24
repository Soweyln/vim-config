" Html
let g:html_number_lines = 1
let g:html_ignore_folding = 1
let g:html_use_css = 1
let g:xml_use_xhtml = 1

" Javascript
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" Python
let g:python_highlight_all = 1

" Json
let g:vim_json_syntax_conceal = 0

" Fugitive
nnoremap <silent> <Leader>gs :Gstatus<CR>
nnoremap <silent> <Leader>gc :Gcommit<CR>
nnoremap <silent> <Leader>gd :call util#GitDiff()<CR>
nnoremap <silent> <Leader>gb :Gblame<CR>
nnoremap <silent> <Leader>gr :Gread<CR>
nnoremap <silent> <Leader>gl :Glog -- %<CR>
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif

" Gitgutter
let g:gitgutter_max_signs = 1000
nmap <Leader>ga <Plug>GitGutterStageHunk
nmap <Leader>gr <Plug>GitGutterUndoHunk
nmap <Leader>gp <Plug>GitGutterPreviewHunk
hi GitGutterAdd ctermfg=28 ctermbg=234 cterm=none
hi GitGutterAddLine ctermfg=28 ctermbg=234 cterm=none
hi GitGutterChange ctermfg=3 ctermbg=234 cterm=none
hi GitGutterDelete ctermfg=1 ctermbg=234 cterm=none
hi GitGutterChangeDelete ctermfg=3 ctermbg=234 cterm=none

" YankRing
nnoremap <C-y> :YRShow<CR>
let g:yankring_max_history = 200
let g:yankring_history_dir = '$HOME/.vim'
let g:yankring_window_height = 20

function! YRRunAfterMaps()
  nnoremap <silent> Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#current_first = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='powerlineish'
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
set laststatus=2

" Comentary
nmap <Leader>c <Plug>Commentary
vmap <Leader>c <Plug>Commentary

" NERDTree
nnoremap <C-g> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>zz
hi NERDTreeDir ctermfg=81 cterm=none
hi NERDTreeDirSlash ctermfg=81 cterm=none
hi NERDTreeCWD ctermfg=118 cterm=none
hi NERDTreeOpenable ctermfg=59 cterm=none
hi NERDTreeClosable ctermfg=7 cterm=none
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowFiles = 1
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeMapJumpNextSibling = ''
let g:NERDTreeMapJumpPrevSibling = ''
let g:NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$', '__pycache__',
                       \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo', 'tags' ]

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx'
let g:closetag_xhtml_filenames = '*.html,*.xhtml,*.phtml,*.php,*.js,*.jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_close_shortcut = '<Leader>c'

" Ale
let g:ale_open_list = 1
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_list_window_size = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '>>'
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\   'python': ['pylint', 'flake8'],
\}
let g:ale_javascript_eslint_options = js#ESLintArgs()
let g:ale_python_pylint_options = python#PYLintArgs()
let g:ale_python_flake8_options = '--ignore=E101,E501,W291,W292,W293'

hi ALEErrorSign ctermfg=015 ctermbg=001 cterm=none
hi ALEWarningSign ctermfg=015 ctermbg=166 cterm=none
hi link ALEError clear
hi link ALEWarning clear

nnoremap <Leader>p :ALEPreviousWrap<CR>
nnoremap <Leader>n :ALENextWrap<CR>

" EasyMotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap H <Plug>(easymotion-overwin-f2)
nmap F <Plug>(easymotion-fl)
nmap T <Plug>(easymotion-tl)

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
let g:gundo_close_on_revert = 1

" Tagbar
nnoremap <Leader>t :TagbarOpenAutoClose<CR>

" Expand region
map K <Plug>(expand_region_expand)
map L <Plug>(expand_region_shrink)
let g:expand_region_text_objects_javascript = {
      \ 'il': 0,
      \ 'ib': 1,
      \ 'iB': 1,
      \ 'aI': 1,
      \ 'ae': 0,
      \ }

" UltiSnips
let g:UltiSnipsExpandTrigger = '<Leader>e'
let g:UltiSnipsJumpForwardTrigger = '<Leader><Tab>'

" Tabularize
noremap \= :Tabularize /=<CR>
noremap \: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap \> :Tabularize /=><CR>
noremap \, :Tabularize /,\zs/l0l1<CR>
noremap \{ :Tabularize /{<CR>
noremap \\| :Tabularize /\|<CR>
noremap \& :Tabularize /\(&\\|\\\\\)<CR>

" Deoplete
if exists('g:plugs["deoplete.nvim"]')
  let g:deoplete#enable_at_startup = 1
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
endif

" Tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType javascript nnoremap <silent> <buffer> <Leader>ff :TernDef<CR>
  autocmd FileType javascript nnoremap <silent> <buffer> <Leader>fr :TernRename<CR>
endif

" Jedi
if exists('g:plugs["jedi-vim"]')
  let g:jedi#completions_enabled = 0
  let g:jedi#goto_command = '<Leader>ff'
  let g:jedi#usages_command = '<Leader>fu'
  let g:jedi#rename_command = '<Leader>fr'
  let g:jedi#documentation_command = ''
  let g:jedi#goto_assignments_command = ''
  let g:jedi#goto_definitions_command = ''

  hi link jediUsage Search
endif

" YCM
if exists('g:plugs["YouCompleteMe"]')
  nnoremap <Leader>ff :YcmCompleter GoToDefinition<CR>
  let g:ycm_key_invoke_completion = '<Leader><Tab>'
  let g:ycm_confirm_extra_conf = 0
  let g:ycm_show_diagnostics_ui = 0
  let g:ycm_filetype_blacklist = {
        \ 'tagbar' : 1,
        \ 'qf' : 1,
        \ 'shada' : 1
        \}
  let g:ycm_global_ycm_extra_conf = '$HOME/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
endif

" Vimux
let g:VimuxOrientation = 'h'
let g:VimuxHeight = 50
nnoremap <Leader>rc :call VimuxCloseRunner()<CR>
nnoremap <Leader>ro :call VimuxOpenRunner()<CR>
nnoremap <Leader>rb :call VimuxInterruptRunner()<CR>
nnoremap <Leader>ra :call VimuxPromptCommand()<CR>
nnoremap <Leader>rm :call VimuxZoomRunner()<CR>

" Notes
let g:notes_directories = ['$HOME/.vim/notes']
nnoremap <Leader>er :RecentNote<CR>
nnoremap <Leader>en :MostRecentNote<CR>
hi notesName ctermfg=81 cterm=underline

" Vim Test
let g:test#strategy = 'vimux'
let g:test#preserve_screen = 0

nnoremap <Leader>rl :TestNearest<CR>
nnoremap <Leader>rr :TestFile<CR>

" Highlightedyank
if !exists('##TextYankPost')
  map y <Plug>(highlightedyank)
endif
let g:highlightedyank_highlight_duration = 500

" fzf
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_layout = { 'down': '~50%' }
let g:fzf_colors =
  \ {'fg':      ['fg', 'Normal'],
  \  'bg':      ['bg', 'Normal'],
  \  'hl':      ['fg', 'Type'],
  \  'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \  'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \  'hl+':     ['fg', 'Title'],
  \  'info':    ['fg', 'PreProc'],
  \  'border':  ['fg', 'Ignore'],
  \  'prompt':  ['fg', 'Conditional'],
  \  'pointer': ['fg', 'Exception'],
  \  'marker':  ['fg', 'Keyword'],
  \  'spinner': ['fg', 'Label'],
  \  'header':  ['fg', 'Comment'] }
noremap <Leader>, :History<CR>
noremap <Leader>. :Mixed<CR>
noremap <Leader>za :Files<CR>
noremap <Leader>zb :BCommits<CR>
noremap <Leader>zc :Commits<CR>
noremap <Leader>zm :Maps<CR>
tnoremap <C-f> <C-\><C-n>:let @s=matchstr(getline('.'), '\v\> ?\zs.+\ze$')<CR>:close<CR>:sleep 100m<CR>:call fzf#vim#gitfiles('.', {'options': ['--query', @s]})<CR>

" Unimpaired
let g:nremap = {"[t": "", "]t": ""}
let g:xremap = {"[t": "", "]t": ""}
let g:oremap = {"[t": "", "]t": ""}

" Ag
nnoremap <Leader>aa :GrepperAg 
nnoremap <Leader>agw "wyiw:GrepperAg '<C-r>w' 
nnoremap <Leader>agW "wyiW:GrepperAg '<C-r>w' 
nnoremap <Leader>aw "wyiw:GrepperAg '\b<C-r>w\b' 
nnoremap <Leader>aW "wyiW:GrepperAg '\b<C-r>w\b' 

nnoremap <silent> <leader>a :set operatorfunc=util#GrepOperator<CR>g@
vnoremap <silent> <leader>a :<c-u>call util#GrepOperator(visualmode())<CR>

" HLT
nmap <Leader>_ <Plug>HiLinkTrace

" QFEnter
let g:qfenter_keymap = {}
let g:qfenter_keymap.vopen = ['<C-v>']
let g:qfenter_keymap.hopen = ['<C-CR>', '<C-s>', '<C-x>']
let g:qfenter_keymap.topen = ['<C-t>']

" EsFormatter
let g:esformatter_config=$HOME.'/.vim/.esformatter.json'

" Flow
nnoremap <F3> :FlowCoverageToggle<CR>

" Marvim
let g:marvim_store = $HOME.'/.vim/macro'
let g:marvim_find_key = '<Leader>mf'
let g:marvim_store_key = '<Leader>ms'
noremap <Leader>me :execute 'e ' . g:marvim_store<CR>

" Live Markdown
nnoremap <Leader>md :LivedownToggle<CR>

" Neoterm
nnoremap <silent> <Leader>rgd :tabnew<CR>:T git diff<CR>
nnoremap <silent> <Leader>ral :tabnew<CR>:T arc lint<CR>
nnoremap <silent> <Leader>rad :tabnew<CR>:T arc land<CR>
