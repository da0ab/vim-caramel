" ===== Строка состояния =====

let g:angle_chars = {
      \ 'left': '',
      \ 'right': '',
      \ 'left_thin': '',
      \ 'right_thin': ''
      \}

autocmd VimEnter * highlight! Space_0 guifg=#000000 guibg=#000000
autocmd VimEnter * highlight! Text_0 guifg=#cd5c54 guibg=#000000 gui=bold
autocmd VimEnter * highlight! Angle_0 guifg=#000000 guibg=#222222

autocmd VimEnter * highlight! Space_1 guifg=#222222 guibg=#222222
autocmd VimEnter * highlight! Text_1 guifg=#FFFFFF guibg=#222222 gui=bold
autocmd VimEnter * highlight! Angle_1 guifg=#222222 guibg=#444444

autocmd VimEnter * highlight! Space_2 guifg=#444444 guibg=#444444
autocmd VimEnter * highlight! Text_2 guifg=#FFFFFF guibg=#444444 gui=bold
autocmd VimEnter * highlight! Angle_2 guifg=#444444 guibg=#666666

autocmd VimEnter * highlight! Angle_5 guifg=#222222 guibg=#666666

set showmode
set wildmenu
set laststatus=2
set statusline=
set statusline+=%#Space_0#\
set statusline+=%h%#Text_0#%{&modified?'СОХРАНИ':''}%*%r
set statusline+=%#Space_0#\
set statusline+=%#Angle_0#%{g:angle_chars.right}

set statusline+=%#Text_1#\ Строки\ %L\ ∙\ \%l\ ∙\ \%p%%
set statusline+=%#Space_1#\
set statusline+=%#Angle_1#%{g:angle_chars.right}

set statusline+=%#Text_2#\ Символы\ %{CharCount()}\ ∙\ \%{virtcol('$')-1}\ ∙\ \%v
set statusline+=%#Space_2#\
set statusline+=%#Angle_2#%{g:angle_chars.right}

function! CharCount()
    if !exists("b:charcount")
        let b:charcount = join(getline(1, '$'), '')->strlen()
    endif
    return '' . b:charcount
endfunction
autocmd BufWritePost,TextChanged,TextChangedI * unlet! b:charcount
set statusline+=%=

set statusline+=%#Angle_5#%{g:angle_chars.left}
set statusline+=%#Space_1#\
set statusline+=%#Text_1#\ \%{&fileencoding}
set statusline+=%#Space_1#\


" %< : Отображает только часть имени файла, если оно слишком длинное
" %f : Имя текущего файла
" %h : Указывает, что файл является скрытым
" %m : Указывает, что файл был изменен (не сохранен)
" %r : Указывает, что файл открыт в режиме только для чтения
" =  : Разделитель между различными частями информации
" format=%{&fileformat} : Показывает формат файла (например, Unix, DOS)
" file=%{&fileencoding} : Показывает кодировку файла (например, UTF-8)
" enc=%{&encoding} : Показывает текущую кодировку Vim
" %o : Показывает номер текущей строки и общее количество строк
" %P : Показывает процентное соотношение текущего положения курсора в файле
