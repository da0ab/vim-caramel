" ===== NERDTree =====
" https://github.com/preservim/nerdtree

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeShowIcons = 1

" Убрать пробел после иконки в NERDTree
function! NERDTreeRenderNodeCustom(item)
  let icon = WebDevIconsGetNerdTreeFileNodeSymbol(a:item)
  let name = a:item.name
    " ← без пробела, без скобок
  return icon . name
endfunction

let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsNerdTreeCustomRender = 1

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
highlight NERDTreeFileExtension_js  guifg=#F0DB4F ctermfg=220
highlight NERDTreeFileExtension_py  guifg=#3572A5 ctermfg=67
highlight NERDTreeFileExtension_vim guifg=#199F4B ctermfg=35
highlight NERDTreeFileExtension_md  guifg=#FF79C6 ctermfg=212

" Подсветка расширений" Подсветка расширений (добавьте свои)
highlight nerdtreeFileExtensionLabel_js    guifg=#E5C07B
highlight nerdtreeFileExtensionLabel_html  guifg=#E06C75
highlight nerdtreeFileExtensionLabel_vim   guifg=#98C379
highlight nerdtreeFileExtensionLabel_md    guifg=#FFFFFF
highlight nerdtreeFileExtensionLabel_json  guifg=#E5C07B



