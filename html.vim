" ===== html =====

" Текстовые элементы
vnoremap pp 1"zdi<p><C-R>z</p><ESC>
vnoremap bb "zdi<strong><C-R>z</strong><ESC>
vnoremap sb "zdi<b><C-R>z</b><ESC>
vnoremap ii "zdi<em><C-R>z</em><ESC>
vnoremap si "zdi<i><C-R>z</i><ESC>
vnoremap sq "zdi«<C-R>z»<ESC>

" Заголовки
vnoremap s1 "zdi<h1><C-R>z</h1><ESC>
vnoremap s2 "zdi<h2><C-R>z</h2><ESC>
vnoremap s2t "zdi<h2 class="title"><C-R>z</h2><ESC>
vnoremap s3 "zdi<h3><C-R>z</h3><ESC>
vnoremap s4 "zdi<h4><C-R>z</h4><ESC>
vnoremap s5 "zdi<h5><C-R>z</h5><ESC>
vnoremap s6 "zdi<h6><C-R>z</h6><ESC>"

" Ссылки обычные
vnoremap sa "zdi<a href="<esc>maa"><C-R>z</a><ESC>`aa
vnoremap saa "zdi<a href="<C-R>z"><C-R>z</a><ESC>`aa

" Ссылки target
vnoremap sat "zdi<a href="<esc>maa" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap saat "zdi<a href="https://<C-R>z" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa

" e-mail
vnoremap s@ "zdi<a href="mailto:<C-R>z"><C-R>z</a><Esc>

" Телефон
vnoremap st "zdi<a href="tel:<C-R>z"><C-R>z</a><ESC>

" html блоки
vnoremap sd 1"zdi<div><cr><C-R>z<cr><C-R> </div><ESC>
vnoremap sdi 1"zdi<div id=""><C-R>z</div><ESC>
vnoremap sdc 1"zdi<div class=""><cr><C-R>z<cr><C-R> </div><ESC>

vnoremap spa "zdi<span class=""><C-R>z</span><ESC>
vnoremap span "zdi<span><C-R>z</span><ESC>

vnoremap sec 1"zdi<section><cr><C-R>z<cr></section><ESC>
vnoremap secc 1"zdi<section class="main"><cr><C-R>z<cr></section><ESC>


" details
vnoremap details 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>
vnoremap det 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>

" Списки ul
vnoremap sl 1"zdi<li><C-R>z</li><ESC>

" Изображения
vnoremap sw "zdi<img src="images/<C-R>z" alt="" title=""><ESC>
vnoremap swl "zdi<a href="images/<C-R>z" class="iPop-img"><img src="images/<C-R>z" alt="" title=""></a><ESC>
vnoremap swv "zdi<a href="<C-R>z"class="iPop-video"></a><ESC>

" Комментарии
vnoremap ss 1"zdi<!--<C-R>z --><ESC>
vnoremap sc 1"zdi/*<C-R>z*/<ESC>
vnoremap sx 1"zdi/*-------------------- <C-R>z --------------------*/<ESC>
vnoremap sv 1"zdi" ===== <C-R>z =====<ESC>

" Пустой HTML
inoremap \x0 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr></body><cr></html>

inoremap \x5 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1"><cr><meta name="format-detection" content="telephone=no"><cr><link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><script type="text/javascript" src="js/vendor.min.js?v=0.0.1"></script><cr><cr><script type="text/javascript" src="js/ProTo.min.js?v=0.0.1"></script><cr><cr></body><cr></html>

inoremap \seo <cr><meta name="description" content=""><cr><meta name="keywords" content=""><cr><meta name="author" content=""><cr><meta name="copyright" lang="ru" content=""><cr><meta name="robots" content="all"><cr>

" Быстрая добавка
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

" HTML/CSS/bash/python
inoremap \sh #!/bin/bash
inoremap \py #!/usr/bin/env python3<cr># -*- coding: utf-8 -*-
inoremap \s <style type="text/css"><cr><cr></style>
inoremap \j <script type="text/javascript" src="js"><cr><cr></script>
inoremap \css <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">

