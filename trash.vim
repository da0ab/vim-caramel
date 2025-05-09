
"------------------------------- NERDTree добавить букмарку по .b


let g:nerdtree_bookmark_file = expand('~/.NERDTreeBookmarks')

function! AddBookmarkWithName()
    let l:bookmark_name = input('Введите имя закладки: ')
    let l:current_path = expand('%:p:h') " Получаем путь к текущей директории
    let l:home_dir = expand('~') " Получаем домашнюю директорию

    " Проверяем, является ли текущий путь домашней директорией
    if l:current_path ==# l:home_dir
        let l:current_path = '~'
    else
        " Заменяем полный путь на относительный, начиная с ~
        let l:current_path = substitute(l:current_path, l:home_dir, '~', '')
    endif

    if !empty(l:bookmark_name)
        call writefile([l:bookmark_name . ' ' . l:current_path], g:nerdtree_bookmark_file, 'a')
        echo ' Закладка добавлена: ' . l:bookmark_name . ' -> ' . l:current_path
    else
        echo ' Имя закладки не может быть пустым.'
    endif
endfunction

nnoremap <silent> <leader>b :call AddBookmarkWithName()<CR>
