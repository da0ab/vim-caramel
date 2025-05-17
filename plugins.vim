" ===== Pathogen =====
"pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on

" ===== vim-startify =====
" https://github.com/mhinz/vim-startify
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = map(split(system('cowsay'), 'n'), '"   ". v:val') + ['','']

let g:startify_bookmarks = [
      \ { 'p': '~/prompts.txt' },
      \ { 'h': '~/.vim/my-help.vim' },
      \ ]

" ===== NERDTree =====

"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-f> :NERDTreeFind<CR>



