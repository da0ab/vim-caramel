" ===== python скрипты =====

"sp  Оборачивание нескольких абзацев/предложений в `<p>`
vnoremap <silent> sp :%!python3 ~/.vim/scripts/p.py<CR>

"sdd  Оборачивание нескольких абзацев/предложений в`<div>`
vnoremap <silent> sdd :%!python3 ~/.vim/scripts/div.py<CR>

"su  Оборачивание в список группы строк (разделение переносом)
vnoremap <silent> su :%!python3 ~/.vim/scripts/li.py<CR>

"F11  html клинер
imap <F11> <C-R>:%!python3 ~/.vim/scripts/clean_html.py<CR>
nmap <F11> :%!python3 ~/.vim/scripts/clean_html.py<CR>
vmap <F11> <Esc>:%!python3 ~/.vim/scripts/clean_html.py<CR>
