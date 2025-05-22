
"/*-------------------- NERDTree --------------------*/
"
:OpenBookmark <BOOKMARK> "  переход к закладке
:EditBookmarks           " редактирование закладок
B                        " закладки
Ctrl+ w +  w              " переключение межу  NERDTree и файлом
o                             "открыть файл в текущем окне.
i                             "открыть файл в новом горизонтальном окне.
s                             "открыть файл в новом вертикальном окне.
t                             "открыть файл в новом табе.



" File node mappings~
" double-click,
" o: open in prev window
" go: preview
" t: open in new tab
" T: open in new tab silently
" middle-click,
" i: open split
" gi: preview split
" s: open vsplit
" gs: preview vsplit
" <CR>: custom open
"
" ----------------------------
" Directory node mappings~
" double-click,
" o: open & close node
" O: recursively open node
" t: open in new tab
" T: open in new tab silently
" <CR>: custom open
" x: close parent of node
" X: close all child nodes of
"    current node recursively
" middle-click,
" e: explore selected dir
"
" ----------------------------
" Bookmark table mappings~
" double-click,
" gb: jump to bookmark table
" o: open bookmark
" go: preview file
" go: find dir in tree
" t: open in new tab
" T: open in new tab silently
" i: open split
" gi: preview split
" s: open vsplit
" gs: preview vsplit
" <CR>: custom open
" D: delete bookmark
"
" ----------------------------
" Tree navigation mappings~
" P: go to root
" p: go to parent
" K: go to first child
" J: go to last child
" <C-j>: go to next sibling
" <C-k>: go to prev sibling
"
" ----------------------------
" Filesystem mappings~
" C: change tree root to the
"    selected dir
" u: move tree root up a dir
" U: move tree root up a dir
"    but leave old root open
" r: refresh cursor dir
" R: refresh current root
" m: Show menu
" cd:change the CWD to the
"    selected dir
" CD:change tree root to CWD
"
" ----------------------------
" Tree filtering mappings~
" I: hidden files (off)
" f: file filters (on)
" F: files (on)
" B: bookmarks (on)
" FL: files lines (off)
"
" ----------------------------
" Custom mappings~
"
" ----------------------------
" Other mappings~
" q: Close the NERDTree window
" A: Zoom (maximize-minimize)
"    the NERDTree window
" ?: toggle help
"
" ----------------------------
" Bookmark commands~
" :Bookmark [<name>]
" :BookmarkToRoot <name>
" :RevealBookmark <name>
" :OpenBookmark <name>
" :ClearBookmarks [<names>]
" :ClearAllBookmarks
" :ReadBookmarks
" :WriteBookmarks
" :EditBookmarks




hjkl                      " перемещение в разные стороны
i                         " режим вставки
I                         " добавление в начало строки
a                         " режим добавления
A                         " добавление в конец строки
o                         " добавить строку сразу за текущей
O                         " добавить строку перед текущей
R                         " писать поверх имеющегося текста
u, :u[ndo]                " отмена предыдущего действия (undo)
CTR-R, :red[o]            " отмена отмены предыдущего действия (redo)
cc                        " удалить и начать редактирование

ESC                       " перейти в режим просмотра
DEL                       " удалить следующий символ
:<n>                      " перейти на строку #n
%                         " перейти к парной скобке
:e <fname>                " редактировать файл
:w [fname]                " записать изменения
:wa                       " сохранить изменения во всех файлах
J                         " выделенное в 1 строчку
<n>d                      " удалить n+1 строку
<n>y                      " скопировать n+1 строку
'.                        "перейти к строке последнего изменения



"................ Сворачивание

zc                        " свернуть блок
zo                        " развернуть блок
zM                        " закрыть все блоки
zR                        " открыть все блоки
za                        " инвертирование
zf                        " ручное :set foldmethod=manual

"................ Маркеры

ma                        " установить локальный маркер a
mB                        " установить глобальный маркер B
`c                        " перейти к локальному маркеру c
`0                        " вернуться на позицию, на которой закончили работу при закрытии vim
:marks                    " просмотр маркеров
q:                        " История команд

"................ Орфография

setlocal spell spelllang=ru,en   " включить проверку орфографии
set spell!                       " вкл/выкл проверку во время работы
]s                               " следующее слово с ошибкой
[s                               " предыдущее слово с ошибкой
zg                               " good word
zw                               " wrong word
zG                               " ignore word

"................ Работа с окнами

n или s                 " разделить окно на две части горизонтально
v                       " разделить окно на две части вертикально
с                       " закрыть окно
=                       " установить равный размер окон
hjkl                    " перемещение между окнами

"................ mod

"перевести в верхний регистр первую букву предложения
:%s/[.!?]\_s\+\a/\U&\E/g

"раздельные слова и цифры оборачиваем только цифры
:%s,\(\d\+\),<td>\1</td>,g



#/*--------------------Python--------------------*/

python3 -m venv my_local_python
"python3.13 -m venv my_local_python
pip install -r requirements.txt

alias pp="source ~/my_local_python/bin/activate"
alias ppp="python3"
alias pv3="echo " $(python3 --version) | $(pip3 --version)""


pip freeze > requirements.txt



