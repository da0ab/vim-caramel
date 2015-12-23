"Necessary for multiple encodings
set encoding=utf-8
"nnoremap <F5> <ESC>:w<ENTER>:!me_run %:p:h<ENTER>
filetype indent on
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

"история изменений
if version >= 700
    set history=64
    set undolevels=128
    set undodir=~/.vim/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"Common code for encodings
function! SetFileEncodings(encodings)
let b:myfileencodingsbak=&fileencodings
let &fileencodings=a:encodings
endfunction
function! RestoreFileEncodings()
let &fileencodings=b:myfileencodingsbak
unlet b:myfileencodingsbak
endfunction

".NFO specific
au BufReadPre *.nfo call SetFileEncodings('cp437')|set ambiwidth=single
au BufReadPost *.nfo call RestoreFileEncodings()

"---------------------dlia win
"настраиваю для работы с русскими словами (чтобы w, b, * понимали русские слова)
"set iskeyword=@,48-57,_,192-255
"set fileencoding=utf-8
"set guifont=Courier_New:h9:cRUSSIAN
"------------------------------------

"словарь
"setlocal spell spelllang=ru_ru,en_us

"Список используемых кодировок для автоматического их определения
set fileencodings=utf-8,koi8-r,cp1251,cp866

"автоматически удалять окончания строк - Dos-return'ы, пробельные символы
autocmd BufRead * silent! %s/[\r \t]\+$//
autocmd BufEnter *.php :%s/[ \t\r]\+$//e

"Не выгружать буфер, когда переключаемся на другой
set hidden
set clipboard=unnamed,exclude:cons\\\|linux

"Преобразование Таба в пробелы
set expandtab
set tabstop=4
"Умные отступы
set smartindent

"Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

"Автозавершение слов по tab 
function InsertTabWrapper()
 let col = col('.') - 1
 if !col || getline('.')[col - 1] !~ '\k'
 return "\<tab>"
 else
 return "\<c-p>"
 endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

"вкл плагины
filetype plugin on

"выбор кодировки
set wildmenu
set wcm=<Tab>
colorscheme  desert
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>
"быстрый выбор
"map <F8> :e ++enc=utf8<CR>
"map <F9>  :e ++enc=cp1251 ++ff=dos<CR>

"классичемкий курсор
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

"MORDA
set helplang=ru "русский хелп
set guioptions-=T "откл гуи
set lines=75 "высота
set columns=210 "ширина
set cursorline
hi CursorLine ctermbg=235 cterm=none
set nocompatible "несовместимость с vi
set ruler "текущее положение курсора
set nu "нумерация строк
set mouse=a "включаем мышку
set mousemodel=popup
set ch=1 " Сделать строку команд высотой в одну строку
set mousehide "скрывать мышку при печате
syntax on "подсветка синтаксиса
set wrap "перенос строк
set linebreak "не рвать строку
set nobackup "не бекапить
set noswapfile "убить свапфайл
set undolevels=100 "память отмен
set showmode "строка состояния

"Statusline
set wildmenu
set laststatus=2
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %o\ %P
"set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

"Search options
set hlsearch  "Подсветка результатов
set ignorecase  "Игнорировать регистр букв при поиске
set incsearch   "При поиске перескакивать на найденный текст в процессе набора строки
set smartcase   "Игнорировать предыдущую опцию если в строке поиска есть буквы разного регистра
set nowrapscan
set infercase   "предлагать авто-дополнение на основе уже введённого регистра

"автоставки для скобок их пар
imap [ []<LEFT>
imap { {}<LEFT>
imap ( ()<LEFT>
set showmatch "подсветка парных скобок

"HTML
vnoremap s1 "zdi<h1><C-R>z</h1><ESC>
vnoremap sll "zdi<label><C-R>z</label><ESC>
vnoremap so "zdi<option><C-R>z</option><ESC>
vnoremap s2 "zdi<h2><C-R>z</h2><ESC>
vnoremap s3 "zdi<h3><C-R>z</h3><ESC>
vnoremap s4 "zdi<h4><C-R>z</h4><ESC>
vnoremap s5 "zdi<h5><C-R>z</h5><ESC>
vnoremap s6 "zdi<h6><C-R>z</h6><ESC>
vnoremap sb "zdi<strong><C-R>z</strong><ESC>
vnoremap sbb "zdi<b><C-R>z</b><ESC>
vnoremap si "zdi<em><C-R>z</em><ESC>
vnoremap sq "zdi&laquo;<C-R>z&raquo;<ESC>
vnoremap sp 1"zdi<p><C-R>z</p><ESC>
vnoremap sd 1"zdi<div><C-R>z</div><ESC>
vnoremap sa "zdi<a href="<esc>maa"><C-R>z</a><ESC>`aa
vnoremap s@ "zdi<a href="mailto:<esc>maa"><C-R>z</a><ESC>`aa
vnoremap s, "zdi<<esc>maa><C-R>z</><ESC>`aa
vnoremap sdi 1"zdi<div id=""><C-R>z</div><ESC>
vnoremap sdc 1"zdi<div class=""><C-R>z</div><ESC>
vnoremap sup 1"zdi<sup><C-R>z</sup><ESC>
vnoremap sub 1"zdi<sub><C-R>z</sub><ESC>
vnoremap sl 1"zdi<li><C-R>z</li><ESC>
vnoremap su 1"zdi<ul><cr><C-R>z<cr></ul><ESC>

vnoremap sw "zdi<img class="materialboxed responsive-img" src="<C-R>z" alt="" title=""><ESC>
vnoremap ss 1"zdi<!--<C-R>z--><ESC>
vnoremap sc 1"zdi/*<C-R>z*/<ESC>
vnoremap sx 1"zdi/*--------------------<C-R>z--------------------*/<ESC>
vnoremap spp 1"zdi<span class=""><C-R>z</span><ESC>
vnoremap spb "zdi<p><strong><C-R>z</strong></p><ESC>

vnoremap bb "zdi<strong><C-R>z</strong><ESC>
vnoremap pp 1"zdi<p><C-R>z</p><ESC>

"TABLE
vnoremap st 1"zdi<table><C-R>z</table><ESC>
vnoremap stt 1"zdi<table><C-R>z</table><ESC>
vnoremap std 1"zdi<td><C-R>z</td><ESC>
vnoremap str 1"zdi<tr><C-R>z</tr><ESC>
vnoremap sth 1"zdi<th><C-R>z</th><ESC>
inoremap \stc colspan="2"

inoremap \sh #!/bin/bash

inoremap <C-Enter> <br>
inoremap <S-C-Enter> <br />
inoremap \l <hr>
inoremap \0 <div class="clearfix"></div>
inoremap \s <style type="text/css">  </style>
inoremap \j <script type="text/javascript" src="js"></script>
inoremap \css <link rel="stylesheet" type="text/css" href="style.css">
inoremap \a <a id=""></a>
inoremap \c class=""
inoremap \i id=""
inoremap \<Space> &nbsp;
inoremap \fw font-weight:bold;
inoremap \w width:;
inoremap \h height:;
inoremap \cb clear:both;

noremap \7 &amp;
inoremap \- &mdash;
inoremap \co &copy;
inoremap \. &hellip;
inoremap \` &rsquo;
inoremap \d &#8709;
inoremap \g &deg;
inoremap \s2 <sup>2</sup>
inoremap \s3 <sup>3</sup>

"CSS
inoremap \ts text-shadow:1px 1px 1px #D1D1D1
inoremap \b border:1px solid RED;
inoremap \bg background:transparent url() no-repeat;

inoremap \w1 <meta http-equiv="Content-Type" content="text/html; charset=windows-1251">

inoremap \x1 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><cr><html><cr><head><cr><title></title><cr><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><cr></head> <cr><body> <cr><cr></body></html>

inoremap \x2 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><cr><head><cr><title></title><cr><meta http-equiv="Content-Type" content="text/html; charset=windows-1251"><cr></head> <body><cr><cr></body></html>

inoremap \x5 <!DOCTYPE html><cr><html><cr><head><cr><meta charset="utf-8"><cr><title></title><cr></head><cr><body><cr><cr><cr></body><cr></html>

inoremap \6 <!--[if IE 6]><link href="ie6.css" rel="stylesheet" media="all" /><![endif]-->
inoremap \7 <!--[if IE 7]><link href="ie7.css" rel="stylesheet" media="all" /><![endif]-->
inoremap \8 <!--[if IE 8]><link href="ie8.css" rel="stylesheet" media="all" /><![endif]-->

"-------------------bootstrap /mazai
inoremap \chek <label class="checkbox"><cr><input type="checkbox"><cr></label>
"inoremap \row <div class="row"><cr>  <div class="col-md-9"><cr><cr></div><!--col--><cr>  <div class="col-md-9"><cr><cr></div><!--col--><cr></div><!--row-->

inoremap \row <div class="row"><cr>  <div class="col m4 s12"><cr><cr></div><!--c--><cr>  <div class="col m4 s12"><cr><cr></div><!--c--><cr></div><!--r-->

inoremap \texter <form><cr>  <textarea rows="3" placeholder=""></textarea><cr></form>
inoremap \text <form><cr>  <input type="text" placeholder=""><cr></form>
inoremap \radio <label class="radio"><cr>  <input type="radio"><cr></label>

"Pmenu
hi Pmenu guibg=#666666 guifg=#eeeeec
"hi PmenuSel guibg=#ffffff guifg=#c1b5b5
"hi PmenuSbar guibg=#555753
"hi PmenuThumb guifg=#ffffff

"C-c and C-v - Copy/Paste
vmap <C-C> "+y
imap <C-V> <esc>"+gP

"C-a
nmap <C-a> ggVG<CR>
imap <C-a> <esc>ggVGG<CR>
vmap <C-a> <esc>ggVGG<CR>

"C-y - cat
nmap <C-x> dd
imap <C-x> <esc>ddi

"C-Space coment plag NERD Commenter
nmap <C-A-Space> ,cc
imap <C-A-Space>  <Esc>,cc<CR>
vmap <C-A-Space>  <Esc>,cc<CR>

"F1 - save
nmap <F1> :w!<CR>
imap <F1> <Esc>:w!<CR>
vmap <F1> <Esc>:w!<CR>

"F2 - выделить строчку без переноса
nmap <F2> 0v$h
set foldmethod=manual

"F3 - DOS переносы
"nmap <F3> :%s/\r//g
"удалить пустые строки
nmap <F3> :g/^s*$/d
set foldmethod=manual




"Insert my stamp (in i mode)
imap <F4> <C-R>=MyStamp()<CR>
        function! MyStamp()
let myhead = " ====================================  \n"
\ . "created by _([]:::) \n"
\."==================================== "
\ . strftime("%c")
        return myhead
        endfunction

" ## Edit .vimrc ##
map ,s :vsp $MYVIMRC<CR>
"map ,S :source $MYVIMRC<CR>

"F12 - derevo
map <F12> :Ex<cr>
vmap <F12> <esc>:Ex<cr>i
imap <F12> <esc>:Ex<cr>i

"табы
map <C-Tab> <Esc>gt<CR>
map <F5> :tabprevious<C-M>
map <F6> :tabnext<C-M>

"Открыть пустую вкладку
nmap <C-T> :tabnew<cr>
imap <C-T> <esc>:tabnew<cr>
vmap <C-T> <esc>:tabnew<cr>
" Отключаем графические табы
set guioptions-=e

"exit no save
map <C-Q> <Esc>:q!<cr>

"< & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

"Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/

"C-d - дублирование текущей строки
map <C-d> <esc>yyp<CR>
imap <C-d> <esc>yyp<CR>
vmap <C-d> <esc>yyp<CR>

"Меню -->
    " По умолчанию меню скрыто
    set guioptions-=m

    "Горячие клавиши скрытия/отображения меню -->
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
    " Горячие клавиши скрытия/отображения меню <--
" Меню <--



"imap <F4> <C-R>=MyStamp()<CR>
     "   function! MyStamp()
"let myhead ="------------------------------------\n\n"
"\ . "Edit by........._ \n"
"\ . ".___..___..___.| |._ _..___. \n"
"\ . "| . || . || . || || | ||_ -| \n"
"\ . "|_  ||___||_  ||_||___||___| \n"
"\ . "|___|.....|___|.http://goglus.com\n\n"
"\ . strftime("%c")
"\ . "\n\n------------------------------------\n"
"        return myhead
"        endfunction


"-------------------------------HELP


"hjkl                      перемещение в разные стороны
"i                         режим вставки
"I                         добавление в начало строки
"a                         режим добавления
"A                         добавление в конец строки
"o                         добавить строку сразу за текущей
"O                         добавить строку перед текущей
"R                         писать поверх имеющегося текста
"u, :u[ndo]                отмена предыдущего действия (undo)
"CTR-R, :red[o]            отмена отмены предыдущего действия (redo)
"dd                        вырезать (удалить) строку
"cc                        удалить и начать редактирование
"yy                        копировать строку
"p                         вставить из буфера обмена
"<n>d                      удалить n+1 строку
"<n>y                      скопировать n+1 строку
"ESC                       перейти в режим просмотра
"DEL                       удалить следующий символ
":<n>                      перейти на строку #n
"%                         перейти к парной скобке
":e <fname>                редактировать файл
":w [fname]                записать изменения
":wa                       сохранить изменения во всех файлах
"J                         выделенное в 1 строчку

"== Выделение ==
"v + hjkl                  выделение текста
"SHIFT + v                 выделить строку
"CTR + v                   выделение прямоугольника
"p                         вставить
"y                         копировать
"d                         удалить
"gu                        к нижнему регистру
"gU                        к верхнему регистру


"== Сворачивание ==
"zc                        свернуть блок
"zo                        развернуть блок
"zM                        закрыть все блоки
"zR                        открыть все блоки
"za                        инвертирование
"zf                        ручное :set foldmethod=manual

"== Маркеры ==
"ma                        установить локальный маркер a
"mB                        установить глобальный маркер B
"`c                        перейти к локальному маркеру c
"`0                        вернуться на позицию, на которой закончили работу при закрытии vim
":marks                    просмотр маркеров
"q:                        История команд

"setlocal spell spelllang=ru,en   включить проверку орфографии
"set spell!                       вкл/выкл проверку во время работы
"]s                               следующее слово с ошибкой
"[s                               предыдущее слово с ошибкой
"zg                               good word
"zw                               wrong word
"zG                               ignore word

"== Работа с окнами ==
"Ctr+W, затем
"  n или s                 разделить окно на две части горизонтально
"  v                       разделить окно на две части вертикально
"  с                       закрыть окно
"  =                       установить равный размер окон
"  hjkl                    перемещение между окнами


"--------v mod
"смена регистра букв
"guu                      перевести строку в нижний регистр
"gUU                      перевести строку в верхний регистр
"Vu                       перевести строку в нижний регистр
"VU                       перевести строку в верхний регистр
"g~~                      поменять регистр строки
"vEU                      перевести слово в верхний регистр
"vE~                      поменять регистр слова
"ggguG                    перевести весь файл в нижний регистр
" '. перейти к строке последнего изменения

"vat                      выделить содержимое тега
"vit                      выделить тег целиком
"va"                      выделение строки целиком, вместе с кавычками
"va}                      выделения содержимого блока целиком

"---------: mod
"":g/^s*$/d  удалить все пустые строки
":%s/\r//g очистка DOS переносов
":%s/[.!?]\_s\+\a/\U&\E/g  перевести в верхний регистр первую букву предложения
":%s/^/ /g                 отступ справа
":%s/\(\s\+\)\(\S\+\)/<td>\2<\/td>/g    оборачиваем табличным тегом все
"раздельные слова и цифры
":%s,\(\d\+\),<td>\1</td>,g оборачиваем только цифры



"== Поиск в файле ==
"/<выражение>              поиск выражения в файле
"n                         следующее совпадение
"N                         предыдущее совпадение




" ------------------------------------------------------

"C-u регистр gu gU
"nmap <C-u> qu<CR>
"imap <C-u> <esc>qu<CR>
"vmap <C-u> <esc>qu<CR>


"F5 - просмотр списка буферов
"nmap <F5> <Esc>:BufExplorer<cr>
"vmap <F5> <esc>:BufExplorer<cr>
"imap <F5> <esc><esc>:BufExplorer<cr>

"F6 - предыдущий буфер
"map <F6> :bp<cr>
"vmap <F6> <esc>:bp<cr>i
"imap <F6> <esc>:bp<cr>i

"F7 - следующий буфер
"map <F7> :bn<cr>
"vmap <F7> <esc>:bn<cr>i
"imap <F7> <esc>:bn<cr>i

" Фолдинг по отсупам
"set foldmethod=indent
" Включить автоотступы
"set autoindent
"set foldmethod=manual


"F2 выделить содержимое тега
"vmap <F2> <esc>  vit

"F3 выделить тег целиком
"vat
"vmap <F3> <esc>  vat
"Выделим всё содержимое закавыченной строки vi"
"F2 - select strok

"vmap <F2> <Esc>vi}:<CR>


"Надоело переключаться на латинские буквы для передвижения курсора
"map Я Z map к r map К R map ш i map Ш I map щ o map Щ O map в d

"F3 - clear DOS
"nmap <F3> :%s/\r//g <CR>
"imap <F3> <Esc> :%s/\r//g <CR>
"vmap <F3> <Esc> :%s/\r//g <CR>
"nmap <F4>C:\Program Files\Mozilla Firefox\firefox.exe<CR>
"imap <F4> <Esc>C:\Program Files\Mozilla Firefox\firefox.exe<CR>
"vmap <F4> <Esc>C:\Program Files\Mozilla Firefox\firefox.exe<CR>

"vmap <F4> <Esc>urxtv lua<CR>
"nmap <F4> :vit<CR>
" imap <F4> <Esc> :vit<CR>
"vmap <F4> <Esc> :vit<CR>


"F3 - просмотр ошибок
"nmap <F3> :copen<cr>
"vmap <F3> <esc>:copen<cr>
"imap <F3> <esc>:copen<cr>





