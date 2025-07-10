" ===== Классичемкий курсор =====
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

" Включает выделение строки с курсором
set cursorline

" Настраивает цвет фона выделенной строки (CursorLine)
"hi CursorLine ctermbg=235 cterm=none

" Отображает текущее положение курсора в нижней части окна
set ruler

" Линия курсора только в активном окне, и только в режиме вставки
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" Устанавливает режим работы мыши на всплывающее меню
set mousemodel=popup

" Включает возможность использования мыши во всех режимах
set mouse=a

" Скрывает указатель мыши при печати
set mousehide


