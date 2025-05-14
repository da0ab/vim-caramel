" ===== Бекап =====
set noswapfile "Убить свапфайл

if version >= 700
    set history=64
    set undodir=~/.vim/tmp/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
