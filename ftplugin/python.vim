nnoremap <buffer> gj :call python#OpenPythonFile()<CR>
nnoremap <buffer> gt :call python#OpenTestFile()<CR>
nnoremap <buffer> gb :call python#OpenBuildFile()<CR>

nnoremap <buffer> <Leader>rpb :call python#BuildDeps()<CR>
nnoremap <buffer> <Leader>rpt :call python#TargetGen()<CR>
nnoremap <buffer> <Leader>rpg :call python#GenAll()<CR>

nnoremap <buffer> <Leader>rpim :call python#InstallExtDeps('python/manhattan:')<CR>
nnoremap <buffer> <Leader>rpir :call python#InstallExtDeps('internal-site/internal_site:')<CR>
nnoremap <buffer> <Leader>rpib :call python#InstallExtDeps('python/batmobile:')<CR>

nnoremap <buffer> <Leader>rd :TestNearest -s<CR>