" Рекурсивная загрузка всех .vim файлов из vimrc
function! LoadVimConfigs(dir)
    for f in sort(split(glob(a:dir . '/*.vim'), '\n'))
        execute 'source' f
    endfor
    for d in sort(split(glob(a:dir . '/*', 1), '\n'))
        if isdirectory(d)
            call LoadVimConfigs(d)
        endif
    endfor
endfunction

call LoadVimConfigs('~/.vim/vimrc.d')
