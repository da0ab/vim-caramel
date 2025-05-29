" ===== Плагины  =====
execute pathogen#infect()
syntax on


"https://github.com/tpope/vim-pathogen/
"https://github.com/mhinz/vim-startify/
"https://github.com/preservim/nerdtree/
"https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
"https://github.com/ryanoasis/vim-devicons
"https://www.nerdfonts.com/font-downloads





set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1251,koi8-r
set iskeyword+=192-255



set runtimepath+=~/.vim
autocmd FileType css setlocal completefunc=css_context_complete.get_css_completions
autocmd FileType css inoremap <buffer> <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>"

