"--------------------------------------------------------------------------------- Базовые сочетания горячих клавиш

"C-q  -------------------------------------------------  Выход без сохранения
map <C-Q> <Esc>:q!<cr>

"Space  -----------------------------------------------  Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

"< и >  -----------------------------------------------  Смещаем блоки
vmap < <gv
vmap > >gv

"C-c и C-v  -------------------------------------------  Копировать/вставить
vmap <C-C> "+y
imap <C-V> <esc>"+gp
vnoremap <C-v> "_d"+p

"C-a -------------------------------------------------- Выделить всё
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG

"C-d -------------------------------------------------- Дублировать текущую строку
nnoremap <C-d> :copy.<CR>
inoremap <C-d> <Esc>:copy.<CR>gi
vnoremap <C-d> y`>pgv`<

"C-x -------------------------------------------------- Вырезать текущую строку
nnoremap <C-x> dd
inoremap <C-x> <Esc>ddi
vnoremap <C-x> d

"--------------------------------------------------------------------------------- Одиночные горячие клавиши

"F1 -------------------------------------------------- Сохранить
"nmap <F1> :w!<CR>
"imap <F1> <Esc>:w!<CR>
"vmap <F1> <Esc>:w!<CR>

nnoremap <F1> :w!<CR>
inoremap <F1> <Esc>:w!<CR>
vnoremap <F1> <Esc>:w!<CR>


"F1 .vimrc -------------------------------------------------- Автообновление vim
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | echo "✅ .vimrc reloaded"
augroup END

"F2 -------------------------------------------------- Выделить строчку без переноса
nmap <F2> ^vg_

"F3 -------------------------------------------------- Удалить пустые строки
nmap <F3> :g/^s*$/d

"F4 -------------------------------------------------- Удалить множественные пустые строки, оставить одну
nmap <F4> :v/./,/./-j

"F5 -------------------------------------------------- Вставка дата времени
imap <F5> <C-R>=strftime("%c")<CR>

"F6 --------------------------------------------------  Мой хелп
nnoremap <F6> :e <C-R>=expand("~/.vim/my-help.vim")<CR><CR>

"F7 -------------------------------------------------- Редактировать .vimrc
map <F7> :vsp $MYVIMRC<CR>

"F8 -------------------------------------------------- Выбор кодировки
set wildmenu
set wcm=<Tab>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

"F9 -------------------------------------------------- Отобразить/Скрыть меню
"set guioptions-=m
    function MyToggleMenu()
        let old_guioptions = &guioptions
        "Если меню в данный момент видимо
        if stridx(old_guioptions, 'm') != -1
            set guioptions-=m
        else
            set guioptions+=m
        endif
    endfunction
    cmap <F9> <ESC>:call MyToggleMenu()<CR>
    imap <F9> <ESC>:call MyToggleMenu()<CR>
    nmap <F9> :call MyToggleMenu()<CR>
    vmap <F9> <ESC>:call MyToggleMenu()<CR>

"F10 -------------------------------------------------- Оборачивайтесь свободным тегом
function! WrapWithTag()
  let input_str = input("Tag name (optional class): ")
  if empty(input_str)
    echo "No tag entered."
    return
  endif

  " Разделяем: тег и классы
  let parts = split(input_str)
  let tag = parts[0]
  let class_attr = len(parts) > 1 ? ' class="' . join(parts[1:], ' ') . '"' : ''

  " Получаем координаты выделения
  let [l1, c1] = [line("'<"), col("'<")]
  let [l2, c2] = [line("'>"), col("'>")]

  " Обратное выделение — меняем местами
  if l1 > l2 || (l1 == l2 && c1 > c2)
    let [l1, l2] = [l2, l1]
    let [c1, c2] = [c2, c1]
  endif

  let lines = getline(l1, l2)

  " Обрезаем начальную и конечную строку
  let lines[0] = lines[0][c1 - 1:]
  let lines[-1] = lines[-1][:c2 - 1]

  " Оборачиваем с переносами
  let wrapped_lines = ['<' . tag . class_attr . '>'] + lines + ['</' . tag . '>']

  " Заменяем строки в буфере
  call setline(l1, wrapped_lines)

  " Удаляем лишние старые строки, если было больше
  if l2 > l1 + len(wrapped_lines) - 1
    call deletebufline('%', l1 + len(wrapped_lines), l2)
  endif
endfunction

vnoremap <F10> :<C-u>call WrapWithTag()<CR>

"F11 -------------------------------------------------- html клинер
" py-script
