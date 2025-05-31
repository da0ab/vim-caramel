" --- Кодировка и поддержка кириллицы ---
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

" Расширяем "слово" — включает кириллицу и :
set iskeyword+=192-255,:,;

" Используем как источники автодополнения:
" . — текущий буфер
" w — все окна
" b — все буферы
" k — словари
set complete=.,k

" Варианты отображения меню
"set completeopt=menuone,longest,menu
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set wildmenu

" Обработка Tab:
" - если меню открыто — <C-n> (вниз по списку)
" - иначе — запуск автодополнения по <C-n> (из текста/буфера)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-n>"

" Для CSS — подгружаем словарь css.dict

autocmd FileType css setlocal dictionary+=~/.vim/dict/css.dict

"| setlocal dictionary+=~/.vim/dict/universal-css.dict
