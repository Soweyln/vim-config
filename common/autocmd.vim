augroup autocmd
  autocmd!

  autocmd BufWritePost .vimrc,vimrc source $MYVIMRC
  autocmd BufWritePost *.vim source %

  autocmd BufEnter * call util#CloseLastWindow()

  " When opening a file, always jump to the last cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \     exe "normal! g'\"zz" |
        \ endif |

  autocmd CursorHold * silent! checktime

  autocmd QuickFixCmdPost * botright copen
  autocmd FileType qf wincmd J

  autocmd BufWinLeave * call util#GitDiffEnd()

  autocmd BufWinLeave * call util#SaveView()
  autocmd BufWinEnter * call util#LoadView()

  autocmd VimResized * let g:fzf_preview_window = util#IsWideWin() ? 'right' : 'up'

  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | silent! pclose | endif
augroup END
