" ===== Базовые сочетания горячих клавиш =====

" C-q Выход без сохранения
map <C-Q> <Esc>:q!<cr>

" Space Пробел в нормальном режиме перелистывает страницы
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>

" Табы

" Переключение вкладок: m . → следующая, m , → предыдущая
nnoremap m. :tabnext<CR>
nnoremap m, :tabprevious<CR>

" mНОМЕРтАБА
for i in range(1, 9)
  execute "nnoremap m" . i . " " . i . "gt"
endfor

" < и > Смещаем блоки
vmap < <gv
vmap > >gv

" C-c и C-v  Копировать/вставить
vmap <C-C> "+y
imap <C-V> <esc>"+gp
vnoremap <C-v> "_d"+p

" C-a  Выделить всё
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG

" C-d  Дублировать текущую строку
nnoremap <C-d> :copy.<CR>
inoremap <C-d> <Esc>:copy.<CR>gi
vnoremap <C-d> y`>pgv`<

" C-x  Вырезать текущую строку
nnoremap <C-x> dd
inoremap <C-x> <Esc>ddi
vnoremap <C-x> d

" ===== Одиночные горячие клавиши =====

" F1 - Сохранить
nnoremap <F1> :w!<CR>
inoremap <F1> <Esc>:w!<CR>
vnoremap <F1> <Esc>:w!<CR>

" F1 .vimrc  - Автообновление vim
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | echo "✅ .vimrc reloaded"
augroup END

" F2 - Выделить строчку без переноса
nmap <F2> ^vg_

" F3 - Выделить содержимое тега под курсором
nnoremap <F4> vit
inoremap <F4> <C-O>vit

" F4 - Выделить тег под курсором
nnoremap <F5> vat
inoremap <F5> <C-O>vat

" F5

" F6 - Удалить пустые строки
nmap <F6> :g/^s*$/d

" Shift + F6 - Удалить множественные пустые строки, оставить одну
nnoremap <S-F6> :%s/\v\n(\s*\n)+/\r\r/<CR>:noh<CR>

" F7 - html клинер
" Смотри  py-script


" F8 - Выбор кодировки
set wildmenu
set wcm=<Tab>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

" F9 - Отобразить/Скрыть меню
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

" F10 - Оборачивайтесь свободным тегом

" Функция для оборачивания текста в HTML-теги
function! WrapWithTag(type) abort
  " Запрашиваем у пользователя тег (и класс, если нужно)
  let l:raw_input = input('Tag (> для построчной обёртки): ')
" Если пользователь ничего не ввел - выходим
  if empty(l:raw_input)
    return
  endif

  " Обрабатываем ввод:
  " - Если введено ">тег" - заменяем на "> тег" для правильного разбора
  let l:raw_input = substitute(l:raw_input, '^>\(\S\)', '> \1', '')
  " - Разбиваем ввод на части (тег и класс)
  let l:parts = split(l:raw_input)

  " Определяем тип обертки:
  " - Если первый символ ">" - построчная обертка
  let l:is_line_wrap = (get(l:parts, 0, '') ==# '>')
  " - Получаем имя тега (второй элемент для построчной обертки)
  let l:tag = l:is_line_wrap ? get(l:parts, 1, '') : get(l:parts, 0, '')
  " - Получаем класс (третий элемент для построчной обертки)
  let l:class = l:is_line_wrap ? get(l:parts, 2, '') : get(l:parts, 1, '')

  " Проверяем, что тег указан
  if empty(l:tag)
    echo '❌ Не указан тег'
    return
  endif

  " Формируем открывающий и закрывающий теги
  let l:class_str = l:class !=# '' ? ' class="'.l:class.'"' : ''
  let l:open_tag = '<'.l:tag.l:class_str.'>'
  let l:close_tag = '</'.l:tag.'>'

  " Обработка визуального выделения посимвольно (v)
  if a:type ==# 'v'
    " Получаем координаты выделения
    let [line1, col1] = getpos("'<")[1:2]
    let [line2, col2] = getpos("'>")[1:2]

    " Если выделение многострочное
    if line1 != line2
      let l:lines = getline(line1, line2)
      " Обрезаем начало первой строки и конец последней
      let l:lines[0] = l:lines[0][col1-1 :]
      let l:lines[-1] = l:lines[-1][: col2-1]
      " Оборачиваем выделенные строки в теги
      let l:wrapped = [l:open_tag] + l:lines + [l:close_tag]
      call setline(line1, l:wrapped)
      " Удаляем лишние строки, если они есть
      if line2 > line1 + len(l:wrapped) - 1
        execute (line1 + len(l:wrapped)) . ',' . line2 . 'delete _'
      endif
      return
    endif

    " Для однострочного выделения
    let l:line = getline(line1)
    " Корректируем координаты, если выделение справа налево
    if col2 < col1
      let [col1, col2] = [col2, col1]
    endif

    " Переводим позиции в индексы символов (начинаем с 0)
    let l:start = col1 - 1
    let l:end = col2 - 1

    " Корректируем выделение для UTF-8 символов:
    " - Смещаем начало влево, если попали в середину символа
    while l:start > 0 && l:line[l:start] =~ '[\x80-\xBF]'
      let l:start -= 1
    endwhile
    " - Смещаем конец вправо, если попали в середину символа
    while l:end < strlen(l:line) - 1 && l:line[l:end + 1] =~ '[\x80-\xBF]'
      let l:end += 1
    endwhile

    " Проверяем, есть ли пробел после выделения
    let l:has_trailing_space = 0
    if l:end < strlen(l:line) - 1 && l:line[l:end + 1] ==# ' '
      let l:has_trailing_space = 1
    endif

    " Если выделение заканчивается пробелом - исключаем его из тега
    if l:line[l:end] ==# ' '
      let l:end -= 1
      let l:has_trailing_space = 1
    endif

    " Формируем новую строку:
    " - Часть до выделения
    " - Открывающий тег
    " - Выделенный текст (без пробела в конце)
    " - Закрывающий тег
    " - Пробел (если был в исходном тексте)
    " - Часть после выделения
    let l:newline = strpart(l:line, 0, l:start) .
          \ l:open_tag .
          \ strpart(l:line, l:start, l:end - l:start + 1) .
          \ l:close_tag .
          \ (l:has_trailing_space ? ' ' : '') .
          \ strpart(l:line, l:end + 1 + (l:has_trailing_space ? 1 : 0))

    " Заменяем строку в буфере
    call setline(line1, l:newline)

  " Обработка построчного выделения (V)
  elseif a:type ==# 'V'
    let l:start = line("'<")
    let l:end = line("'>")

    " Если нужно оборачивать каждую строку отдельно
    if l:is_line_wrap
      for lnum in range(l:start, l:end)
        let l:line = getline(lnum)
        " Пропускаем пустые строки
        if l:line =~ '^\s*$'
          continue
        endif
        " Оборачиваем каждую непустую строку
        call setline(lnum, l:open_tag . l:line . l:close_tag)
      endfor
    else
      " Оборачиваем все выделенные строки как один блок
      let l:lines = getline(l:start, l:end)
      let l:wrapped = [l:open_tag] + l:lines + [l:close_tag]
      call setline(l:start, l:wrapped)
      " Удаляем лишние строки, если они есть
      if l:end > l:start + len(l:wrapped) - 1
        execute (l:start + len(l:wrapped)) . ',' . l:end . 'delete _'
      endif
    endif

  " Обработка обычного режима (без выделения)
  else
    let l:line = getline('.')
    call setline('.', l:open_tag . l:line . l:close_tag)
  endif
endfunction

" Назначение горячих клавиш:
" - В обычном режиме
nnoremap <silent> <F10> :call WrapWithTag('n')<CR>
" - В визуальном режиме
vnoremap <silent> <F10> :<C-u>call WrapWithTag(visualmode())<CR>
" - В режиме вставки
inoremap <silent> <F10> <Esc>:call WrapWithTag('n')<CR>

" F11 Вставка длинных кусков с подсказкой
" Включить wildmenu для интерактивного меню
set wildmenu
set wildmode=longest,list,full

" Словарь сниппетов / двойные кавычки для переносов
let g:insert_snippets = {
  \ 'texterea':           '<textarea rows="3" placeholder=""></textarea>',
  \ 'input':              '<input type="text" placeholder="">',
  \ 'radio':              '<input type="radio">',
  \ 'checkbox':           '<input type="checkbox">',
  \ 'media phone':        "/*phone*/\n@media (max-width: 769px) {\n\t\n}",
  \ 'media pad':          "/*pad*/\n@media (min-width: 769px) and (max-width: 1024px) {\n\t\n}",
  \ 'media pad portrait': "/*pad portrait*/\n@media  (min-width : 768px) and (max-width: 1024px) and (orientation: portrait) {\n\t\n}",
  \ 'media notebook':     "/*notebook*/\n@media only screen and (max-width: 1650px) {\n\t\n}",
  \ 'media square':       "/*square*/\n@media screen and (min-width: 1025px) and (max-width: 1400px) {\n\t\n}",
  \ 'text-shadow':        'text-shadow: 0 0 10px #d1d1d1',
  \ 'colspan':            'colspan="2"',
  \ 'rowspan':            'rowspan="2"',
  \ 'copy':               '©',
  \ 'seo':            "<meta name=\"description\" content=\"\">\n<meta name=\"keywords\" content=\"\">\n<meta name=\"author\" content=\"\">\n<meta name=\"copyright\" lang=\"ru\" content=\"\">\n<meta name=\"robots\" content=\"all\">",
  \ 'html5':          "<!DOCTYPE html>\n<html lang=\"ru\">\n<head>\n\t<meta charset=\"utf-8\">\n\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n\t<meta name=\"format-detection\" content=\"telephone=no\">\n\t<link rel=\"stylesheet\" href=\"css/ProTo.min.css?v=0.0.1\">\n\t<title></title>\n</head>\n<body>\n\n\t<script type=\"text/javascript\" src=\"js/vendor.min.js?v=0.0.1\"></script>\n\t<script type=\"text/javascript\" src=\"js/ProTo.min.js?v=0.0.1\"></script>\n</body>\n</html>",
  \ 'html mini':       "<!DOCTYPE html>\n<html lang=\"ru\">\n<head>\n\t<meta charset=\"utf-8\">\n\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no\">\n\t<title></title>\n</head>\n<body>\n\n</body>\n</html>",
  \ 'webkit':             '-webkit-',
  \ 'version':            '?v=0.0.1',
  \ 'cover':              'background-size: cover'
\ }
" Функция для автодополнения ключей
function! SnippetComplete(A, L, P)
  let matches = []
  for key in keys(g:insert_snippets)
    if key =~ '^' . a:A
      call add(matches, key)
    endif
  endfor
  return matches
endfunction

" Вставка сниппета
function! InsertSnippet()
  let key = input('Вставка по ключу: ', '', 'customlist,SnippetComplete')
  if has_key(g:insert_snippets, key)
    execute "normal! a" . g:insert_snippets[key]
    " Перемещаем курсор внутрь скобок для сниппета pad
    if key == 'pad'
      execute "normal! k$"
    endif
  else
    echo "Нет соответствующего сниппета для ключа: " . key
  endif
endfunction

" Привязка клавиши F4
nnoremap <F11> :call InsertSnippet()<CR>
inoremap <F11> <Esc>:call InsertSnippet()<CR>


" F12 - NERDTree
nnoremap <F12> :NERDTreeToggle<CR>
inoremap <F12> <C-O>:NERDTreeToggle<CR>

" ===== LEADER сочетания =====

nnoremap <leader>l :echo "t - дата, v - vimrc, h - хелпик "<CR>

" LEADER t - Вставка дата времени
imap <leader>t <C-R>= '-----/ ' . toupper(strftime("%d %B %Y • %H:%M:%S %A")) . ' /-----'<CR>
" %d — день месяца (01..31).
" %B — полное название месяца (январь, февраль и т.д.).
" %Y — полный год (например, 2025).
" %H:%M:%S — время в формате час:минуты:секунды.
" %A — полное название дня недели (понедельник, вторник и т.д.).

" LEADER v - Редактировать .vimrc
nnoremap <leader>v :vsp $MYVIMRC<CR> Редактировать .vimrc
nnoremap <leader>v :vsp $MYVIMRC<CR>

" LEADER h - Мой хелп
nnoremap <leader>h :e <C-R>=expand("~/.vim/my-help.vim")<CR><CR>
