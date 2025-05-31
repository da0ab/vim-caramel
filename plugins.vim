" ===== Плагины  =====
execute pathogen#infect()
syntax on


"https://github.com/tpope/vim-pathogen/
"https://github.com/mhinz/vim-startify/
"https://github.com/preservim/nerdtree/
"https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
"https://github.com/ryanoasis/vim-devicons
"https://www.nerdfonts.com/font-downloads

"https://github.com/mattn/emmet-vim
"let g:user_emmet_leader_key='<C-1>'
" Горячая клавиша F5 для запуска автодополнения
function! CssCompleteExternal()
  let l:line = getline('.')
  let l:col = col('.') - 1
  let l:command = '~/.vim/css/css.py ' . shellescape(l:line) . ' ' . l:col
  let l:result = system(l:command)

  if l:result =~# '^-- нет предложений --'
    echo "Нет подсказок"
    return
  endif

  let l:suggestions = split(l:result, "\n")

  " вычисляем начало слова (откуда вставлять)
  let l:start_col = l:col
  while l:start_col > 0 && getline('.')[l:start_col - 1] =~ '\w'
    let l:start_col -= 1
  endwhile

  call complete(l:start_col + 1, l:suggestions)
endfunction

" Только в режиме вставки
autocmd FileType css inoremap <buffer> <F5> <C-O>:call CssCompleteExternal()<CR>



