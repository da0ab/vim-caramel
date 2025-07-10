" ===== vim-startify =====

" Включает автоматическое изменение директории на корень VCS (Version Control System - система управления версиями)
let g:startify_change_to_vcs_root = 1

" Включает специальные элементы (например, значки, разделители и т.д.)
let g:startify_enable_special = 1

" Включает использование значков Devicons для отображения различных типов файлов и папок
let g:startify_use_devicons = 1

" Цитата при старте
function! GetWelcomeMessage()
  let l:file = expand("~/.vim/help/start-help.vim")
  if filereadable(l:file)
    let l:lines = readfile(l:file)
    if !empty(l:lines)
      let quote = l:lines[rand() % len(l:lines)]
      let len_quote = len(quote) + 6

      let top = '┌' . repeat('─', len_quote) . '┐'
      let middle = '   ' . quote . '   '
      let bottom = '└' . repeat('─', len_quote) . '┘'

      return [
            \ '',
            \ top,
            \ middle,
            \ bottom,
            \ ''
            \ ]
    endif
  endif
  return ['   (Цитата не найдена)']
endfunction

" Раскраска цитаты
autocmd FileType startify syntax match StartifyHotkey /"\s\zs\(\S\{2,4}\):/ containedin=StartifyHeader
highlight StartifyHotkey guifg=#fabd2f ctermfg=214 gui=bold

" Устанавливает настраиваемый заголовок для Startify, используя функцию GetWelcomeMessage()
let g:startify_custom_header = GetWelcomeMessage()

" Вывод истории
let g:startify_lists = [
      \ { 'type': 'files', 'header': ['   A few moments earlier...'] },
      "\ { 'type': 'sessions', 'header': ['   Сессии'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] }
      \ ]

" Bookmarks
let g:startify_bookmarks = [
      \ { 'p': '~/prompts.txt' },
      \ { 'b': '~/.bash_profile' },
      \ { 'h': '~/.vim/help/my-help.vim' },
      \ { 's': '~/.vim/start-help.vim' },
      \ { 'v': '~/Dropbox/worck/GIT/vim-caramel' },
      \ { '.v': '~/.vimrc' },
      \ { 'c': '~/Dropbox/worck/GIT/vim-caramel/dict/css.dict' }
      \ ]

" Раскраска файлов списка
augroup StartifySyntax
  autocmd!
  " Скобки
  autocmd FileType startify syntax match StartifyBracketLeft /\[/ contained
  autocmd FileType startify syntax match StartifyBracketRight /\]/ contained
  " Основные правила
  autocmd FileType startify :
    " Имя файла в квадратных скобках
    \ syntax match StartifyFile /\[[^\]]\+\]/ containedin=StartifySection |
    " Путь
    \ syntax match StartifyPath /\/[^\/]*$/ containedin=StartifyFile
    " Подсветка расширений
  autocmd FileType startify :
    " Расширение (.py, .js)
    \ syntax match StartifyExt /\.\w\+\($\|\[\)/ containedin=StartifyFile |
    " Скрытые файлы (.gitignore)
    \ syntax match StartifyExt /\/\.[^\/]\+\// containedin=StartifyPath
augroup END

" Цвета расширений
highlight StartifyExt   guifg=#83a598 ctermfg=109  " Общий цвет расширений (голубой)
highlight StartifyExtVim guifg=#b16286 ctermfg=132  " .vim (фиолетовый)
highlight StartifyExtPy  guifg=#458588 ctermfg=66   " .py (синий)
highlight StartifyExtJs  guifg=#d79921 ctermfg=172  " .js (оранжевый)
highlight StartifyExtMd  guifg=#8ec07c ctermfg=108  " .md (зелёный)

highlight StartifyBracketLeft  guifg=#444444 ctermfg=240
highlight StartifyBracketRight guifg=#444444 ctermfg=240

" Связываем расширения с цветами
autocmd FileType startify :
  \ syntax match StartifyExtVim /\.vim\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtPy  /\.py\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtJs  /\.js\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtMd  /\.md\($\|\[\)/ containedin=StartifyFile
