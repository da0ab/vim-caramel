" ===== Базовые сочетания горячих клавиш =====

"C-q Выход без сохранения
map <C-Q> <Esc>:q!<cr>

"Space Пробел в нормальном режиме перелистывает страницы
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>

"Табы

"Переключение вкладок: m . → следующая, m , → предыдущая
nnoremap m. :tabnext<CR>
nnoremap m, :tabprevious<CR>
set timeoutlen=300
"mНОМЕРтАБА
for i in range(1, 9)
  execute "nnoremap m" . i . " " . i . "gt"
endfor

"< и > Смещаем блоки
vmap < <gv
vmap > >gv

"C-c и C-v  Копировать/вставить
vmap <C-C> "+y
imap <C-V> <esc>"+gp
vnoremap <C-v> "_d"+p

"C-a  Выделить всё
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG

"C-d  Дублировать текущую строку
nnoremap <C-d> :copy.<CR>
inoremap <C-d> <Esc>:copy.<CR>gi
vnoremap <C-d> y`>pgv`<

"C-x  Вырезать текущую строку
nnoremap <C-x> dd
inoremap <C-x> <Esc>ddi
vnoremap <C-x> d

" ===== Одиночные горячие клавиши =====

"F1 - Сохранить
nnoremap <F1> :w!<CR>
inoremap <F1> <Esc>:w!<CR>
vnoremap <F1> <Esc>:w!<CR>

"F1 .vimrc  - Автообновление vim
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | echo "✅ .vimrc reloaded"
augroup END

"F2 - Выделить строчку без переноса
nmap <F2> ^vg_

"F3 - Удалить пустые строки
nmap <F3> :g/^s*$/d

"Shift + F3 - Удалить множественные пустые строки, оставить одну
nnoremap <S-F3> :%s/\v\n(\s*\n)+/\r\r/<CR>:noh<CR>

"F4 - html клинер
"Смотри  py-script

"F5 - Вставка дата времени
imap <F5> <C-R>= '-----/ ' . toupper(strftime("%d %B %Y • %H:%M:%S %A")) . ' /-----'<CR>
" %d — день месяца (01..31).
" %B — полное название месяца (январь, февраль и т.д.).
" %Y — полный год (например, 2025).
" %H:%M:%S — время в формате час:минуты:секунды.
" %A — полное название дня недели (понедельник, вторник и т.д.).

"F6 - Мой хелп
nnoremap <F6> :e <C-R>=expand("~/.vim/my-help.vim")<CR><CR>

"F7 - Редактировать .vimrc
map <F7> :vsp $MYVIMRC<CR>

"F8 - Выбор кодировки
set wildmenu
set wcm=<Tab>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>

"F9 - Отобразить/Скрыть меню
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

"F10 - Оборачивайтесь свободным тегом
let g:html_tags = [
      \ 'div', 'span', 'p', 'a', 'img', 'ul', 'ol', 'li',
      \ 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'section', 'article',
      \ 'header', 'footer', 'nav', 'main', 'aside', 'figure', 'figcaption',
      \ 'table', 'tr', 'td', 'th', 'form', 'input', 'button', 'label',
      \ 'select', 'option', 'textarea', 'details', 'script', 'link', 'meta'
      \]

function! WrapWithTag()
  " Проверяем, есть ли выделение
  if mode() =~ '^[vV]'
    let [l1, c1] = [line("'<"), col("'<")]
    let [l2, c2] = [line("'>"), col("'>")]
  else
    normal! V
    let [l1, c1] = [line("'<"), col("'<")]
    let [l2, c2] = [line("'>"), col("'>")]
  endif

  let input_str = input("Tag name (optional class): ", '', 'customlist,CompleteTags')
  if empty(input_str)
    echo "No tag entered."
    return
  endif

  let parts = split(input_str)
  let tag = parts[0]
  let class_attr = len(parts) > 1 ? ' class="' . join(parts[1:], ' ') . '"' : ''

  if l1 > l2 || (l1 == l2 && c1 > c2)
    let [l1, l2] = [l2, l1]
    let [c1, c2] = [c2, c1]
  endif

  let lines = getline(l1, l2)
  let lines[0] = lines[0][c1 - 1:]
  let lines[-1] = lines[-1][:c2 - 1]

  let wrapped_lines = ['<' . tag . class_attr . '>'] + lines + ['</' . tag . '>']
  call setline(l1, wrapped_lines)

  if l2 > l1 + len(wrapped_lines) - 1
    call deletebufline('%', l1 + len(wrapped_lines), l2)
  endif
endfunction

function! CompleteTags(ArgLead, CmdLine, CursorPos)
  let matches = []
  for tag in g:html_tags
    if tag =~ '^' . a:ArgLead
      call add(matches, tag)
    endif
  endfor
  return matches
endfunction

vnoremap <F10> :<C-u>call WrapWithTag()<CR>
nnoremap <F10> V:<C-u>call WrapWithTag()<CR>

"F11 Вставка длинных кусков с подсказкой
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
  \ 'grid':               "display: grid;\ngrid-template-columns: repeat(2, 1fr)",
  \ 'colspan':            'colspan="2"',
  \ 'rowspan':            'rowspan="2"',
  \ 'copy':               '©',
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


"F12 - NERDTree
nnoremap <F12> :NERDTreeToggle<CR>
