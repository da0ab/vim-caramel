" ===== Базовые настройки (применяются глобально) =====

" Включает подсветку синтаксиса для поддерживаемых языков
syntax on

" Включает перенос строк в окне редактирования
set wrap

" Переносит строки только в конце слов, а не посреди
set linebreak

" Включает нумерацию строк
set nu

" Включает умный отступ при вводе новых строк
set smartindent

" Устанавливает ширину табуляции в 4 пробела
set tabstop=4

" Устанавливает ширину отступа при использовании команд (например, << и >>) в 4 пробела
set shiftwidth=1

" Устанавливает количество пробелов, добавляемых при нажатии Tab в режиме вставки
set softtabstop=4

" Превращает табуляцию в пробелы
set expandtab

" Копирует отступ предыдущей строки при создании новой
set autoindent

" Отключает сворачиваемые блоки
set nofoldenable

" Устанавливает метод сворачивания на ручной (вместо автоматического)
set foldmethod=manual

" Подсвечивает соответствующие скобки при их вводе
set showmatch

" ===== Автозакрытие скобок =====
imap [ []<LEFT>
imap { {}<LEFT>
imap ( ()<LEFT>

" ===== Умный Tab =====
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

" ===== Очистка пробелов в конце строк =====
autocmd BufWritePre * silent! %s/[\r \t]\+$//

" ===== Специфичные настройки для типов файлов =====
augroup filetype_settings
    autocmd!

    " HTML/PHP
    autocmd FileType html,php setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html,php setlocal wrap

    " CSS (включая встроенный в HTML)
    autocmd FileType css setlocal foldmethod=indent

    " JavaScript (включая встроенный в HTML)
    autocmd FileType javascript setlocal cinoptions=(0,u0,U0,j1
    autocmd FileType javascript setlocal cindent

    " Форматирование при сохранении
    autocmd BufWritePre *.html,*.php,*.css,*.js silent! normal! mzgg=G``z
augroup END


