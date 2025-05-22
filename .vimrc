set nocompatible
set encoding=utf-8
set fileencodings=utf-8,koi8-r,cp1251,cp866
filetype plugin indent on
set helplang=ru
set guioptions-=T
set clipboard=unnamed
let mapleader = "."

map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map . /
map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?

set shm+=I
colorscheme my-desert
set guifont=AnonymicePro\ Nerd\ Font\ Propo:h14
set lines=75
set columns=210
set ch=1
hi Pmenu guibg=#666666 guifg=#eeeeec
set cursorline
set termguicolors

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
set cursorline
hi CursorLine ctermbg=235 cterm=none
set ruler
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline
set mousemodel=popup
set mouse=a
set mousehide

set showmode
set wildmenu
set laststatus=2
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %o\ %P

set hlsearch
set ignorecase
set incsearch
set smartcase
set nowrapscan
set infercase

if version >= 700
    set history=64
    set undodir=~/.vim/tmp/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
set noswapfile

syntax on
set wrap
set linebreak
set nu
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set nofoldenable
set foldmethod=manual
set showmatch
imap [ []<LEFT>
imap { {}<LEFT>
imap ( ()<LEFT>
function InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>
autocmd BufWritePre * silent! %s/[\r \t]\+$//
augroup filetype_settings
    autocmd!
    autocmd FileType html,php setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType html,php setlocal wrap
    autocmd FileType css setlocal foldmethod=indent
    autocmd FileType javascript setlocal cinoptions=(0,u0,U0,j1
    autocmd FileType javascript setlocal cindent
    autocmd BufWritePre *.html,*.php,*.css,*.js execute 'normal mzgg=G`z'
augroup END

map <C-Q> <Esc>:q!<cr>
nnoremap <Space> <PageDown>
nnoremap <S-Space> <PageUp>
nnoremap m. :tabnext<CR>
nnoremap m, :tabprevious<CR>
set timeoutlen=300
for i in range(1, 9)
  execute "nnoremap m" . i . " " . i . "gt"
endfor
vmap < <gv
vmap > >gv
vmap <C-C> "+y
imap <C-V> <esc>"+gp
vnoremap <C-v> "_d"+p
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG
nnoremap <C-d> :copy.<CR>
inoremap <C-d> <Esc>:copy.<CR>gi
vnoremap <C-d> y`>pgv`<
nnoremap <C-x> dd
inoremap <C-x> <Esc>ddi
vnoremap <C-x> d
nnoremap <F1> :w!<CR>
inoremap <F1> <Esc>:w!<CR>
vnoremap <F1> <Esc>:w!<CR>
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | echo "✅ .vimrc reloaded"
augroup END
nmap <F2> ^vg_
nnoremap <F4> vit
inoremap <F4> <C-O>vit
nnoremap <F5> vat
inoremap <F5> <C-O>vat
nmap <F6> :g/^s*$/d
nnoremap <S-F6> :%s/\v\n(\s*\n)+/\r\r/<CR>:noh<CR>
set wildmenu
set wcm=<Tab>
menu Encoding.windows-1251 :e ++enc=cp1251 ++ff=dos<CR>
menu Encoding.utf-8 :e ++enc=utf8<CR>
menu Encoding.cp866 :e ++enc=cp866 ++ff=dos<CR>
menu Encoding.koi8-r :e ++enc=koi8-r ++ff=unix<CR>
menu Encoding.koi8-u :e ++enc=koi8-u ++ff=unix<CR>
map <F8> :emenu Encoding.<TAB>
    function MyToggleMenu()
        let old_guioptions = &guioptions
        if stridx(old_guioptions, 'm') != -1
            set guioptions-=m
        else
            set guioptions+=m
        endif
    endfunction
    cmap <F9> <ESC>:call MyToggleMenu()<CR>
    imap <F9> <ESC>:call MyToggleMenu()<CR>
    nmap <F9> :call MyToggleMenu()<CR>
    vmap <F9> <ESC>:call MyToggleMenu()<CR>
let g:html_tags = [
      \ 'div', 'span', 'p', 'a', 'img', 'ul', 'ol', 'li',
      \ 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'section', 'article',
      \ 'header', 'footer', 'nav', 'main', 'aside', 'figure', 'figcaption',
      \ 'table', 'tr', 'td', 'th', 'form', 'input', 'button', 'label',
      \ 'select', 'option', 'textarea', 'details', 'script', 'link', 'meta'
      \]
function! WrapWithTag()
  if mode() =~ '^[vV]'
    let [l1, c1] = [line("'<"), col("'<")]
    let [l2, c2] = [line("'>"), col("'>")]
  else
    normal! V
    let [l1, c1] = [line("'<"), col("'<")]
    let [l2, c2] = [line("'>"), col("'>")]
  endif
  let input_str = input("Tag name (optional class): ", '', 'customlist,CompleteTags')
  if empty(input_str)
    echo "No tag entered."
    return
  endif
  let parts = split(input_str)
  let tag = parts[0]
  let class_attr = len(parts) > 1 ? ' class="' . join(parts[1:], ' ') . '"' : ''
  if l1 > l2 || (l1 == l2 && c1 > c2)
    let [l1, l2] = [l2, l1]
    let [c1, c2] = [c2, c1]
  endif
  let lines = getline(l1, l2)
  let lines[0] = lines[0][c1 - 1:]
  let lines[-1] = lines[-1][:c2 - 1]
  let wrapped_lines = ['<' . tag . class_attr . '>'] + lines + ['</' . tag . '>']
  call setline(l1, wrapped_lines)
  if l2 > l1 + len(wrapped_lines) - 1
    call deletebufline('%', l1 + len(wrapped_lines), l2)
  endif
endfunction
function! CompleteTags(ArgLead, CmdLine, CursorPos)
  let matches = []
  for tag in g:html_tags
    if tag =~ '^' . a:ArgLead
      call add(matches, tag)
    endif
  endfor
  return matches
endfunction
vnoremap <F10> :<C-u>call WrapWithTag()<CR>
nnoremap <F10> V:<C-u>call WrapWithTag()<CR>
set wildmenu
set wildmode=longest,list,full
let g:insert_snippets = {
  \ 'texterea':           '<textarea rows="3" placeholder=""></textarea>',
  \ 'input':              '<input type="text" placeholder="">',
  \ 'radio':              '<input type="radio">',
  \ 'checkbox':           '<input type="checkbox">',
  \ 'media phone':        "/*phone*/\n@media (max-width: 769px) {\n\t\n}",
  \ 'media pad':          "/*pad*/\n@media (min-width: 769px) and (max-width: 1024px) {\n\t\n}",
  \ 'media pad portrait': "/*pad portrait*/\n@media  (min-width : 768px) and (max-width: 1024px) and (orientation: portrait) {\n\t\n}",
  \ 'media notebook':     "/*notebook*/\n@media only screen and (max-width: 1650px) {\n\t\n}",
  \ 'media square':       "/*square*/\n@media screen and (min-width: 1025px) and (max-width: 1400px) {\n\t\n}",
  \ 'text-shadow':        'text-shadow: 0 0 10px #d1d1d1',
  \ 'grid':               "display: grid;\ngrid-template-columns: repeat(2, 1fr)",
  \ 'colspan':            'colspan="2"',
  \ 'rowspan':            'rowspan="2"',
  \ 'copy':               '©',
  \ 'webkit':             '-webkit-',
  \ 'version':            '?v=0.0.1',
  \ 'cover':              'background-size: cover'
\ }
function! SnippetComplete(A, L, P)
  let matches = []
  for key in keys(g:insert_snippets)
    if key =~ '^' . a:A
      call add(matches, key)
    endif
  endfor
  return matches
endfunction
function! InsertSnippet()
  let key = input('Вставка по ключу: ', '', 'customlist,SnippetComplete')
  if has_key(g:insert_snippets, key)
    execute "normal! a" . g:insert_snippets[key]
    if key == 'pad'
      execute "normal! k$"
    endif
  else
    echo "Нет соответствующего сниппета для ключа: " . key
  endif
endfunction
nnoremap <F11> :call InsertSnippet()<CR>
inoremap <F11> <Esc>:call InsertSnippet()<CR>
nnoremap <F12> :NERDTreeToggle<CR>
inoremap <F12> <C-O>:NERDTreeToggle<CR>
nnoremap <leader>l :echo "t - дата, v - vimrc, h - хелпик "<CR>
imap <leader>t <C-R>= '-----/ ' . toupper(strftime("%d %B %Y • %H:%M:%S %A")) . ' /-----'<CR>
nnoremap <leader>v :vsp $MYVIMRC<CR> Редактировать .vimrc
nnoremap <leader>v :vsp $MYVIMRC<CR>
nnoremap <leader>h :e <C-R>=expand("~/.vim/my-help.vim")<CR><CR>

vnoremap pp 1"zdi<p><C-R>z</p><ESC>
vnoremap bb "zdi<strong><C-R>z</strong><ESC>
vnoremap sb "zdi<b><C-R>z</b><ESC>
vnoremap ii "zdi<em><C-R>z</em><ESC>
vnoremap si "zdi<i><C-R>z</i><ESC>
vnoremap sq "zdi«<C-R>z»<ESC>
vnoremap s1 "zdi<h1><C-R>z</h1><ESC>
vnoremap s2 "zdi<h2><C-R>z</h2><ESC>
vnoremap s2t "zdi<h2 class="title"><C-R>z</h2><ESC>
vnoremap s3 "zdi<h3><C-R>z</h3><ESC>
vnoremap s4 "zdi<h4><C-R>z</h4><ESC>
vnoremap s5 "zdi<h5><C-R>z</h5><ESC>
vnoremap s6 "zdi<h6><C-R>z</h6><ESC>"
vnoremap sa "zdi<a href="<esc>maa"><C-R>z</a><ESC>`aa
vnoremap saa "zdi<a href="<C-R>z"><C-R>z</a><ESC>`aa
vnoremap sat "zdi<a href="<esc>maa" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap saat "zdi<a href="https://<C-R>z" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap s@ "zdi<a href="mailto:<C-R>z"><C-R>z</a><Esc>
vnoremap st "zdi<a href="tel:<C-R>z"><C-R>z</a><ESC>
vnoremap sd 1"zdi<div><cr><C-R>z<cr><C-R> </div><ESC>
vnoremap sdi 1"zdi<div id=""><C-R>z</div><ESC>
vnoremap sdc 1"zdi<div class=""><cr><C-R>z<cr><C-R> </div><ESC>
vnoremap spa "zdi<span class=""><C-R>z</span><ESC>
vnoremap span "zdi<span><C-R>z</span><ESC>
vnoremap sec 1"zdi<section><cr><C-R>z<cr></section><ESC>
vnoremap secc 1"zdi<section class="main"><cr><C-R>z<cr></section><ESC>
vnoremap details 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>
vnoremap det 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>
vnoremap sl 1"zdi<li><C-R>z</li><ESC>
vnoremap sw "zdi<img src="images/<C-R>z" alt="" title=""><ESC>
vnoremap swl "zdi<a href="images/<C-R>z" class="iPop-img"><img src="images/<C-R>z" alt="" title=""></a><ESC>
vnoremap swv "zdi<a href="<C-R>z"class="iPop-video"></a><ESC>
vnoremap ss 1"zdi<!--<C-R>z --><ESC>
vnoremap sc 1"zdi/*<C-R>z*/<ESC>
vnoremap sx 1"zdi/*-------------------- <C-R>z --------------------*/<ESC>
vnoremap sv 1"zdi" ===== <C-R>z =====<ESC>
inoremap \x0 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr></body><cr></html>
inoremap \x5 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1"><cr><meta name="format-detection" content="telephone=no"><cr><link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><script type="text/javascript" src="js/vendor.min.js?v=0.0.1"></script><cr><cr><script type="text/javascript" src="js/ProTo.min.js?v=0.0.1"></script><cr><cr></body><cr></html>
inoremap \seo <cr><meta name="description" content=""><cr><meta name="keywords" content=""><cr><meta name="author" content=""><cr><meta name="copyright" lang="ru" content=""><cr><meta name="robots" content="all"><cr>
inoremap <C-Enter> <br>
inoremap \a <a id="" class="anchor"></a>
inoremap \<Space> &nbsp;
inoremap \i <C-Space>id=""
inoremap \c <C-Space>class=""
inoremap \w width:;
inoremap \h height:;
inoremap \l <cr><hr><cr>
inoremap \-  –
inoremap \v var(--);
inoremap \ff color: #fff;
inoremap \b border: 1px solid #ddd;
inoremap \1  <C-Space>!important
inoremap \fw font-weight: bold;
inoremap \bg background: transparent url(../images/) no-repeat center;
inoremap \sh #!/bin/bash
inoremap \py #!/usr/bin/env python3<cr># -*- coding: utf-8 -*-
inoremap \s <style type="text/css"><cr><cr></style>
inoremap \j <script type="text/javascript" src="js"><cr><cr></script>
inoremap \css <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">

vnoremap <silent> sp :%!python3 ~/.vim/scripts/p.py<CR>
vnoremap <silent> sdd :%!python3 ~/.vim/scripts/div.py<CR>
vnoremap <silent> su :%!python3 ~/.vim/scripts/li.py<CR>
imap <F7> <C-R>:%!python3 ~/.vim/scripts/clean_html.py<CR>
nmap <F7> :%!python3 ~/.vim/scripts/clean_html.py<CR>
vmap <F7> <Esc>:%!python3 ~/.vim/scripts/clean_html.py<CR>

execute pathogen#infect()
syntax on

let g:startify_change_to_vcs_root = 1
let g:startify_enable_special = 1
let g:startify_use_devicons = 1
function! GetWelcomeMessage()
  let l:file = expand("~/.vim/start-help.vim")
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
autocmd FileType startify syntax match StartifyHotkey /"\s\zs\(\S\{2,4}\):/ containedin=StartifyHeader
highlight StartifyHotkey guifg=#fabd2f ctermfg=214 gui=bold
let g:startify_custom_header = GetWelcomeMessage()
let g:startify_lists = [
      \ { 'type': 'files', 'header': ['   A few moments earlier...'] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] }
      \ ]
let g:startify_bookmarks = [
      \ { 'p': '~/prompts.txt' },
      \ { 'h': '~/.vim/my-help.vim' },
      \ { 's': '~/.vim/start-help.vim' },
      \ { 'v': '~/.vimrc' },
      \ ]
augroup StartifySyntax
  autocmd!
  autocmd FileType startify :
    \ syntax match StartifyFile /\[[^\]]\+\]/ containedin=StartifySection |
    \ syntax match StartifyPath /\/[^\/]*$/ containedin=StartifyFile
  autocmd FileType startify :
    \ syntax match StartifyExt /\.\w\+\($\|\[\)/ containedin=StartifyFile |
    \ syntax match StartifyExt /\/\.[^\/]\+\// containedin=StartifyPath
augroup END
highlight StartifyExt   guifg=#83a598 ctermfg=109  " Общий цвет расширений (голубой)
highlight StartifyExtVim guifg=#b16286 ctermfg=132  " .vim (фиолетовый)
highlight StartifyExtPy  guifg=#458588 ctermfg=66   " .py (синий)
highlight StartifyExtJs  guifg=#d79921 ctermfg=172  " .js (оранжевый)
highlight StartifyExtMd  guifg=#8ec07c ctermfg=108  " .md (зелёный)
autocmd FileType startify :
  \ syntax match StartifyExtVim /\.vim\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtPy  /\.py\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtJs  /\.js\($\|\[\)/ containedin=StartifyFile |
  \ syntax match StartifyExtMd  /\.md\($\|\[\)/ containedin=StartifyFile

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:NERDTreeShowIcons = 1
function! NERDTreeRenderNodeCustom(item)
  let icon = WebDevIconsGetNerdTreeFileNodeSymbol(a:item)
  let name = a:item.name
  return icon . name
endfunction
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsNerdTreeCustomRender = 1
let g:nerdtree_auto_opened = 0
let g:NERDTreeLimitedSyntax = 0
let g:NERDTreeSyntaxEnabled = 1
nnoremap <C-f> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
function! s:MaybeNERDTreeFind()
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
  let g:nerdtree_auto_opened = 1
  execute 'NERDTreeFind'
endfunction
augroup NERDTreeAutoFind
  autocmd!
  autocmd VimEnter * call s:MaybeNERDTreeFind()
  autocmd BufReadPost * call s:MaybeNERDTreeFind()
augroup END
autocmd BufWritePost * if &ft == 'nerdtree' | silent NERDTreeSyntaxRefresh | endif
let g:NERDTreeSyntaxDisableDefaultExtensions = 0
let g:NERDTreeSyntaxEnabledExtensions = ['js', 'py', 'vim', 'md', 'txt']
highlight NERDTreeFileExtension_js  guifg=#F0DB4F ctermfg=220  " JavaScript
highlight NERDTreeFileExtension_py  guifg=#3572A5 ctermfg=67   " Python
highlight NERDTreeFileExtension_vim guifg=#199F4B ctermfg=35   " Vimscript
highlight NERDTreeFileExtension_md  guifg=#FF79C6 ctermfg=212   " Markdown
highlight nerdtreeFileExtensionLabel_js    guifg=#E5C07B
highlight nerdtreeFileExtensionLabel_html  guifg=#E06C75
highlight nerdtreeFileExtensionLabel_vim   guifg=#98C379
highlight nerdtreeFileExtensionLabel_md    guifg=#FFFFFF
highlight nerdtreeFileExtensionLabel_json  guifg=#E5C07B
augroup NerdTreeCursorHide
  autocmd!
  autocmd FileType nerdtree set guicursor=n:block-blinkon0
  autocmd BufLeave * if &ft == 'nerdtree' | set guicursor=a:block-blinkon0 | endif
augroup END

highlight CursorLine ctermbg=0 guibg=#2e2e2e cterm=none gui=none
highlight CursorLineNr ctermbg=235 guibg=#2c313c ctermfg=214 guifg=#FFA500
set hlsearch
nohlsearch

