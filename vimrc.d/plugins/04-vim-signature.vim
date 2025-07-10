function! FixSignatureColors()
    " Маркеры a-z (обычные)
    hi SignatureMarkText  guifg=#6c6c6c guibg=#1e1e2e ctermfg=242 ctermbg=236 gui=NONE cterm=NONE
    " Маркеры A-Z (специальные)
    hi SignatureMarkerText guifg=#5c5c5c guibg=#1e1e2e ctermfg=240 ctermbg=236 gui=NONE cterm=NONE
endfunction
autocmd VimEnter,ColorScheme * call FixSignatureColors()
