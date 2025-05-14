
"--------------------------------------------- Текстовые элементы
vnoremap pp 1"zdi<p><C-R>z</p><ESC>
vnoremap sb "zdi<b><C-R>z</b><ESC>
vnoremap bb "zdi<strong><C-R>z</strong><ESC>
vnoremap si "zdi<i><C-R>z</i><ESC>
vnoremap ii "zdi<em><C-R>z</em><ESC>
vnoremap sq "zdi«<C-R>z»<ESC>

"--------------------------------------------- Заголовки
"
"
"
"
"
"
vnoremap s1 "zdi<h1><C-R>z</h1><ESC>
vnoremap s2 "zdi<h2><C-R>z</h2><ESC>
vnoremap s2t "zdi<h2 class="title"><C-R>z</h2><ESC>
vnoremap s3 "zdi<h3><C-R>z</h3><ESC>
vnoremap s4 "zdi<h4><C-R>z</h4><ESC>
vnoremap s5 "zdi<h5><C-R>z</h5><ESC>
vnoremap s6 "zdi<h6><C-R>z</h6><ESC>"
"
"--------------------------------------------- Ссылки: обычные, target, e-mail, телефон
vnoremap sa "zdi<a href="<esc>maa"><C-R>z</a><ESC>`aa
vnoremap saa "zdi<a href="<C-R>z"><C-R>z</a><ESC>`aa
vnoremap sat "zdi<a href="<esc>maa" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa
vnoremap saat "zdi<a href="https://<C-R>z" target="_blank" rel="nofollow"><C-R>z</a><ESC>`aa

vnoremap s@ "zdi<a href="mailto:<C-R>z"><C-R>z</a><ESC>`aa
vnoremap st "zdi<a href="tel:<C-R>z"><C-R>z</a><ESC>`aa

"--------------------------------------------- html блоки
vnoremap sd 1"zdi<div><cr><C-R>z<cr><C-R> </div><ESC>
vnoremap sdi 1"zdi<div id=""><C-R>z</div><ESC>
vnoremap sdc 1"zdi<div class=""><cr><C-R>z<cr><C-R> </div><ESC>

vnoremap spa "zdi<span class=""><C-R>z</span><ESC>
vnoremap span "zdi<span><C-R>z</span><ESC>

vnoremap sec 1"zdi<section><cr><C-R>z<cr></section><ESC>
vnoremap secc 1"zdi<section class="main"><cr><C-R>z<cr></section><ESC>

"vnoremap nav 1"zdi<nav><cr><C-R>z<cr></nav><ESC>

vnoremap header 1"zdi<header><cr><C-R>z<cr></header><ESC>
vnoremap he 1"zdi<header><cr><C-R>z<cr></header><ESC>
vnoremap hec 1"zdi<header class="header"><cr><C-R>z<cr></header><ESC>

"vnoremap article 1"zdi<article><cr><C-R>z<cr></article><ESC>
"vnoremap art 1"zdi<article><cr><C-R>z<cr></article><ESC>

"vnoremap footer 1"zdi<footer><cr><C-R>z<cr></footer><ESC>
"vnoremap fo 1"zdi<footer><cr><C-R>z<cr></footer><ESC>
"vnoremap foc 1"zdi<footer class="footer"><cr><C-R>z<cr></footer><ESC>

"--------------------------------------------- details
vnoremap details 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>
vnoremap det 1"zdi<details><cr><summary><C-R>z</summary><cr><cr></details><ESC>

"--------------------------------------------- Списки ul
vnoremap sl 1"zdi<li><C-R>z</li><ESC>
"vnoremap sld 1"zdi<dd><C-R>z</dd><ESC>
"vnoremap slt 1"zdi<dt><C-R>z</dt><ESC>
"vnoremap sll 1"zdi<dl><cr><C-R>z<cr></dl><ESC>

"--------------------------------------------- Изображения
vnoremap sw "zdi<img src="images/<C-R>z" alt="" title=""><ESC>
vnoremap swl "zdi<a href="images/<C-R>z" class="iPop-img"><img src="images/<C-R>z" alt="" title=""></a><ESC>
vnoremap swv "zdi<a href="<C-R>z"class="iPop-video"></a><ESC>

"--------------------------------------------- Комментарии
vnoremap ss 1"zdi<!--<C-R>z --><ESC>
vnoremap sc 1"zdi/*<C-R>z*/<ESC>
vnoremap sx 1"zdi/*--------------------<C-R>z--------------------*/<ESC>

"--------------------------------------------- Таблицы
"vnoremap stt 1"zdi<table><C-R>z</table><ESC>
vnoremap std 1"zdi<td><C-R>z</td><ESC>
vnoremap str 1"zdi<tr><C-R>z</tr><ESC>
vnoremap sth 1"zdi<th><C-R>z</th><ESC>
inoremap \col colspan="2"
inoremap \row rowspan="2"

"--------------------------------------------- пустой HTML
inoremap \x0 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1.0, user-scalable=no"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr><cr></body><cr></html>

inoremap \x5 <!DOCTYPE html><cr><html lang="ru"><cr><html><cr><head><cr><meta charset="utf-8"><cr><meta name="viewport" content="width=device-width, initial-scale=1"><cr><meta name="format-detection" content="telephone=no"><cr><link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1"><cr><title></title><cr></head><cr><body><cr><cr><cr><cr><cr><cr><cr><cr><cr><script type="text/javascript" src="js/vendor.min.js?v=0.0.1"></script><cr><cr><script type="text/javascript" src="js/ProTo.min.js?v=0.0.1"></script><cr><cr></body><cr></html>

inoremap \seo <cr><meta name="description" content=""><cr><meta name="keywords" content=""><cr><meta name="author" content=""><cr><meta name="copyright" lang="ru" content=""><cr><meta name="robots" content="all"><cr>

"--------------------------------------------- Быстрая добавка
inoremap <C-Enter> <br>
inoremap \a <a id="" class="anchor"></a>
inoremap \<Space> &nbsp;
inoremap \i <C-Space>id=""
inoremap \c <C-Space>class=""
inoremap \w width:;
inoremap \h height:;
inoremap \l <cr><hr><cr>
inoremap \-  –
inoremap \co &copy;
inoremap \p -webkit-
inoremap \v var(--);
inoremap \ve ?v=0.0.1
inoremap \ff color: #fff;
inoremap \b border: 1px solid #ddd;
inoremap \1  <C-Space>!important
inoremap \fw font-weight: bold;
inoremap \bg background: transparent url(../images/) no-repeat center;
inoremap \cov background-size: cover;
inoremap \ts text-shadow: 0 0 10px #d1d1d1
inoremap \grid display: grid;<cr>grid-template-columns: 1fr 2fr;

"--------------------------------------------- Формы
inoremap \texter <cr><textarea rows="3" placeholder=""></textarea><cr>
inoremap \input <cr><input type="text" placeholder=""><cr>
inoremap \radio <label class="radio"><cr>  <input type="radio"><cr></label>
inoremap \chek <label class="checkbox"><cr><input type="checkbox"><cr></label>
"vnoremap so "zdi<option><C-R>z</option><ESC>

"--------------------------------------------- @media
inoremap \phon /*phone*/<cr> @media (max-width: 769px) {<cr><cr>}
inoremap \pad  /*pad*/<cr> @media (min-width: 769px) and (max-width: 1024px){<cr><cr>}
inoremap \padp /*pad portrait*/<cr> @media  (min-width : 768px) and (max-width: 1024px) and (orientation: portrait) {<cr><cr>}
inoremap \note  /*notebook*/<cr> @media only screen and (max-width: 1650px){<cr><cr>}
inoremap \squar /*square*/<cr> @media screen and (min-width: 1025px) and (max-width: 1400px)

"--------------------------------------------- HTML/CSS/bash/python
inoremap \sh #!/bin/bash
inoremap \py #!/usr/bin/env python3<cr># -*- coding: utf-8 -*-
inoremap \s <style type="text/css"><cr><cr></style>
inoremap \j <script type="text/javascript" src="js"><cr><cr></script>
inoremap \css <link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">

