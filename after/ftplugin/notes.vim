setlocal tabstop=2
setlocal shiftwidth=2
setlocal comments=:•,:◦,:▸,:▹,:▪,:▫,:>
setlocal expandtab
setlocal textwidth=88

let g:presenting_top_margin = 5

nnoremap <buffer> <Leader>n /\v• \zs.+<CR>:noh<CR>
nnoremap <buffer> <Leader>p ?\v• \zs.+<CR>:noh<CR>
nnoremap <buffer> <C-S-P> :StartPresenting<CR>