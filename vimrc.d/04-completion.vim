" ===== Кодировка и поддержка кириллицы =====
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r

" Расширяем "слово" — включает кириллицу и :
set iskeyword+=192-255,:,;,(,),-

" Используем как источники автодополнения:
" . — текущий буфер
" w — все окна
" b — все буферы
" k — словари
set complete=.,k

" Варианты отображения меню
set completeopt=menuone,noinsert,noselect
set shortmess+=c
set wildmenu

" Обработка Tab:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : (col('.') > 1 && getline('.')[col('.') - 2]  =~ '\k') ? "\<C-n>" : "\<Tab>"

" Для CSS — подгружаем словарь css.dict
autocmd FileType css,html setlocal dictionary+=~/.vim/dict/css.dict

