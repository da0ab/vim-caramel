" ===== Pathogen =====
"pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on

" ===== vim-startify =====
" https://github.com/mhinz/vim-startify

let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 0

" Цитата при старте
function! GetWelcomeMessage()
  let l:file = expand("~/.vim/start.vim")
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

let g:startify_custom_header = GetWelcomeMessage()

" Вывод истории
let g:startify_lists = [
      \ { 'type': 'files', 'header': ['   A few moments earlier...'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] }
      \ ]

" Bookmarks
let g:startify_bookmarks = [
      \ { 'p': '~/prompts.txt' },
      \ { 'h': '~/.vim/my-help.vim' },
      \ ]

" Раскраска файлов списка

augroup StartifySyntax
  autocmd!
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

" Связываем расширения с цветами
autocmd FileType startify :
  \ syntax match StartifyExtVim /\.vim\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtPy  /\.py\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtJs  /\.js\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtMd  /\.md\($\|\[\)/ containedin=StartifyFile

" ===== NERDTree =====

 " Флаг, чтобы NERDTree запускался только один раз
let g:nerdtree_auto_opened = 0
let g:NERDTreeLimitedSyntax = 0
let g:NERDTreeSyntaxEnabled = 1
" автопоиск открытого файла
nnoremap <C-f> :NERDTreeFind<CR>
" показать скрытые файлы
let NERDTreeShowHidden=1

function! s:MaybeNERDTreeFind()
  " Условия пропуска
  if &filetype =~# 'nerdtree\|startify\|gitcommit'
    return
  endif
  if !filereadable(expand('%:p'))
    return
  endif
  if g:nerdtree_auto_opened
    return
  endif
  if exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1
    return
  endif

  " Открыть NERDTree и выделить файл
  let g:nerdtree_auto_opened = 1
  execute 'NERDTreeFind'
endfunction

augroup NERDTreeAutoFind
  autocmd!
  autocmd VimEnter * call s:MaybeNERDTreeFind()
  autocmd BufReadPost * call s:MaybeNERDTreeFind()
augroup END

autocmd BufWritePost * if &ft == 'nerdtree' | silent NERDTreeSyntaxRefresh | endif

" Включить стандартные расширени
let g:NERDTreeSyntaxDisableDefaultExtensions = 0
" Ваши расширения
let g:NERDTreeSyntaxEnabledExtensions = ['js', 'py', 'vim', 'md', 'txt']

" Кастомные цвета для расширений (hex/rgb/cterm)
highlight NERDTreeFileExtension_js  guifg=#F0DB4F ctermfg=220  " JavaScript
highlight NERDTreeFileExtension_py  guifg=#3572A5 ctermfg=67   " Python
highlight NERDTreeFileExtension_vim guifg=#199F4B ctermfg=35   " Vimscript
highlight NERDTreeFileExtension_md  guifg=#FF79C6 ctermfg=212   " Markdown

" Подсветка расширений" Подсветка расширений (добавьте свои)
highlight nerdtreeFileExtensionLabel_js    guifg=#E5C07B
highlight nerdtreeFileExtensionLabel_html  guifg=#E06C75
highlight nerdtreeFileExtensionLabel_vim   guifg=#98C379
highlight nerdtreeFileExtensionLabel_md    guifg=#FFFFFF
highlight nerdtreeFileExtensionLabel_json  guifg=#E5C07B

" Фон строки
highlight CursorLine ctermbg=0 guibg=#2e2e2e cterm=none gui=none

" Номер строки
highlight CursorLineNr ctermbg=235 guibg=#2c313c ctermfg=214 guifg=#FFA500

"nnoremap <leader>n :NERDTreeFocus<CR>

" Включить подсветку поиска, но сразу сбросить текущую подсветку
set hlsearch
nohlsearch

