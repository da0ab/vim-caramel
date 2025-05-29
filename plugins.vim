" ===== Плагины  =====
execute pathogen#infect()
syntax on


"https://github.com/tpope/vim-pathogen/
"https://github.com/mhinz/vim-startify/
"https://github.com/preservim/nerdtree/
"https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
"https://github.com/ryanoasis/vim-devicons
"https://www.nerdfonts.com/font-downloads



" Настройка автодополнения CSS
function! s:css_complete() abort
    if !has('python3') && !has('python3/dynamic')
        return "\<Tab>"
    endif

    try
        python3 << EOF
import css_complete
css_complete.complete()
EOF
        if exists('g:css_completions') && !empty(g:css_completions)
            call complete(col('.'), g:css_completions)
            return ''
        endif
    catch
        " Подавляем ошибки чтобы не ломать другие плагины
    endtry

    return "\<Tab>"
endfunction

" Безопасное подключение только для CSS файлов
augroup css_autocomplete
    autocmd!
    autocmd FileType css inoremap <silent> <expr> <Tab> <SID>css_complete()
augroup END

