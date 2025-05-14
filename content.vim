" ===== Базовые настройки (применяются глобально) =====
syntax on
set wrap
set linebreak
set nu
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set nofoldenable
set foldmethod=manual
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
    autocmd BufWritePre *.html,*.php,*.css,*.js execute 'normal mzgg=G`z'
augroup END
