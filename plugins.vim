"pathogen https://github.com/tpope/vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

"vim-startify https://github.com/mhinz/vim-startify
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = map(split(system('cowsay'), 'n'), '"   ". v:val') + ['','']

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-N> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>



