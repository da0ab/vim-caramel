" ===== Основное =====

"Несовместимость с vi
set nocompatible 
"Базовая кодировка
set encoding=utf-8
"Список используемых кодировок для автоматического их определения
set fileencodings=utf-8,koi8-r,cp1251,cp866
"Включить плагины
filetype plugin indent on
"Русский хелп
set helplang=ru
"Отключить гуи
set guioptions-=T
"Системный буфер
set clipboard=unnamed
"Назначаем leader
let mapleader = "."

" ===== Фикс русской раскладки =====

map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map . /
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?


" ===== Оформление =====

set shm+=I "Пустой стартовый экран
"set guifont=DejaVu\ Sans\ Mono 13 "Размер шрифта
set lines=75 "Высота
set columns=210 "Ширина
set ch=1 "Сделать строку команд высотой в одну строку
hi Pmenu guibg=#666666 guifg=#eeeeec
colorscheme desert


" ===== Курсор =====

"Классичемкий курсор
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

set cursorline
hi CursorLine ctermbg=235 cterm=none
set ruler "Текущее положение курсора

"Линия курсора только в активном окне, и только в режиме вставки
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

set mousemodel=popup
set mouse=a "Включаем мышку
set mousehide "Скрывать мышку при печати

" ===== Строка состояния =====

set showmode "Включить строкe состояния
set wildmenu
set laststatus=2
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %o\ %P


" ===== Поиск =====

set hlsearch "Подсветка все совпадения результатов поиска
set ignorecase "Игнорировать регистр букв при поиске
set incsearch "При поиске перескакивать на найденный текст в процессе набора строки
set smartcase "Игнорировать предыдущую опцию если в строке поиска есть буквы разного регистра
set nowrapscan "Поиск до первого совпадения
set infercase "Предлагать авто-дополнение на основе уже введённого регистра


" ===== Бекап =====
set noswapfile "Убить свапфайл

if version >= 700
    set history=64
    set undodir=~/.vim/tmp/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

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

"F4 Вставка длинных кусков с подсказкой
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
nnoremap <F4> :call InsertSnippet()<CR>
inoremap <F4> <Esc>:call InsertSnippet()<CR>
"-----------------------------

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

"F11 - html клинер
"Смотри  py-script

"F12 - NERDTree
nnoremap <F12> :NERDTreeToggle<CR>

" ===== html =====

"Текстовые элементы
vnoremap pp 1"zdi<p><C-R>z</p><ESC>
vnoremap bb "zdi<strong><C-R>z</strong><ESC>
vnoremap sb "zdi<b><C-R>z</b><ESC>
vnoremap ii "zdi<em><C-R>z</em><ESC>
vnoremap si "zdi<i><C-R>z</i><ESC>
vnoremap sq "zdi«<C-R>z»<ESC>

"Заголовки
vnoremap s1 "zdi<h1><C-R>z</h1><ESC>
vnoremap s2 "zdi<h2><C-R>z</h2><ESC>
vnoremap s2t "zdi<h2 class="title"><C-R>z</h2><ESC>
vnoremap s3 "zdi<h3><C-R>z</h3><ESC>
vnoremap s4 "zdi<h4><C-R>z</h4><ESC>
vnoremap s5 "zdi<h5><C-R>z</h5><ESC>
vnoremap s6 "zdi<h6><C-R>z</h6><ESC>"

"Ссылки обычные
vnoremap sa "zdi<a href="<esc>maa"><C-R>z</a><ESC>`aa
vnoremap saa "zdi<a href="<C-R>z"><C-R>z</a><ESC>`aa
"Ссылки target
vnoremap sat "zdi<a href="<esc>maa" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap saat "zdi<a href="https://<C-R>z" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
"e-mail
vnoremap s@ "zdi<a href="mailto:<C-R>z"><C-R>z</a><Esc>
"Телефон
vnoremap st "zdi<a href="tel:<C-R>z"><C-R>z</a><ESC>

"html блоки
vnoremap sd 1"zdi<div><cr><C-R>z<cr><C-R> </div><ESC>
vnoremap sdi 1"zdi<div id=""><C-R>z</div><ESC>
vnoremap sdc 1"zdi<div class=""><cr><C-R>z<cr><C-R> </div><ESC>

vnoremap spa "zdi<span class=""><C-R>z</span><ESC>
vnoremap span "zdi<span><C-R>z</span><ESC>

vnoremap sec 1"zdi<section><cr><C-R>z<cr></section><ESC>
vnoremap secc 1"zdi<section class="main"><cr><C-R>z<cr></section><ESC>


"details
vnoremap details 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>
vnoremap det 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>

"Списки ul
vnoremap sl 1"zdi<li><C-R>z</li><ESC>
"vnoremap sld 1"zdi<dd><C-R>z</dd><ESC>
"vnoremap slt 1"zdi<dt><C-R>z</dt><ESC>
"vnoremap sll 1"zdi<dl><cr><C-R>z<cr></dl><ESC>

"Изображения
vnoremap sw "zdi<img src="images/<C-R>z" alt="" title=""><ESC>
vnoremap swl "zdi<a href="images/<C-R>z" class="iPop-img"><img src="images/<C-R>z" alt="" title=""></a><ESC>
vnoremap swv "zdi<a href="<C-R>z"class="iPop-video"></a><ESC>

"Комментарии
vnoremap ss 1"zdi<!--<C-R>z --><ESC>
vnoremap sc 1"zdi/*<C-R>z*/<ESC>
vnoremap sx 1"zdi/*-------------------- <C-R>z --------------------*/<ESC>
vnoremap sv 1"zdi" ===== <C-R>z =====<ESC>

"Пустой HTML
inoremap \x0 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr></body><cr></html>

inoremap \x5 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1"><cr><meta name="format-detection" content="telephone=no"><cr><link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><script type="text/javascript" src="js/vendor.min.js?v=0.0.1"></script><cr><cr><script type="text/javascript" src="js/ProTo.min.js?v=0.0.1"></script><cr><cr></body><cr></html>

inoremap \seo <cr><meta name="description" content=""><cr><meta name="keywords" content=""><cr><meta name="author" content=""><cr><meta name="copyright" lang="ru" content=""><cr><meta name="robots" content="all"><cr>

"Быстрая добавка
inoremap <C-Enter> <br>
inoremap \a <a id="" class="anchor"></a>
inoremap \<Space> &nbsp;
inoremap \i <C-Space>id=""
inoremap \c <C-Space>class=""
inoremap \w width:;
inoremap \h height:;
inoremap \l <cr><hr><cr>
inoremap \-  –
"inoremap \co &copy;
"inoremap \p -webkit-
inoremap \v var(--);
"inoremap \ve ?v=0.0.1
inoremap \ff color: #fff;
inoremap \b border: 1px solid #ddd;
inoremap \1  <C-Space>!important
inoremap \fw font-weight: bold;
inoremap \bg background: transparent url(../images/) no-repeat center;


"HTML/CSS/bash/python
inoremap \sh #!/bin/bash
inoremap \py #!/usr/bin/env python3<cr># -*- coding: utf-8 -*-
inoremap \s <style type="text/css"><cr><cr></style>
inoremap \j <script type="text/javascript" src="js"><cr><cr></script>
inoremap \css <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">


" ===== python скрипты =====

"sp  Оборачивание нескольких абзацев/предложений в `<p>`
vnoremap <silent> sp :%!python3 ~/.vim/scripts/p.py<CR>

"sdd  Оборачивание нескольких абзацев/предложений в`<div>`
vnoremap <silent> sdd :%!python3 ~/.vim/scripts/div.py<CR>

"su  Оборачивание в список группы строк (разделение переносом)
vnoremap <silent> su :%!python3 ~/.vim/scripts/li.py<CR>

"F11  html клинер
imap <F11> <C-R>:%!python3 ~/.vim/scripts/clean_html.py<CR>
nmap <F11> :%!python3 ~/.vim/scripts/clean_html.py<CR>
vmap <F11> <Esc>:%!python3 ~/.vim/scripts/clean_html.py<CR>

" ===== Pathogen =====
"pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on

" ===== vim-startify =====
" https://github.com/mhinz/vim-startify
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = map(split(system('cowsay'), 'n'), '"   ". v:val') + ['','']

let g:startify_bookmarks = [
      \ { 'p': '~/prompts.txt' },
      \ { 'h': '~/.vim/my-help.vim' },
      \ ]

" ===== NERDTree =====

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>




