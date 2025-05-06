"--------------------------------------------- КУРСОР
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
