                                                                                                                                    
# .vimrc-TURBO-HTML
vim chips + scripts


#### VIMRC-COMPLIT.sh - build script and copy python script
```HTML
#!/bin/bash
cat base key-ru-fix face cursor statusline search backup content keys html py-script > ~/.vimrc
cp -r script/* ~/.vim
```

- **base** - Basic
- **key-ru-fix** - Russian layout fix
- **face** - Design
- **cursor** - Cursor
- **statusline** - Status line
- **search** - Search
- **backup** - Backup
- **content** - File content
- **keys** - Hotkey combinations
- **html** - css/html
- **py-script** - Python3 scripts for wrapping html



#### Python scripts are placed in
```HTML
/.vim/scripts/li.py
```
### Горячие клавиши в режиме визуального выделения

#### Текст
- `pp` : Оборачивает выделенный текст в тег `<p>`
- `sb` : Оборачивает выделенный текст в тег `<b>`
- `bb` : Оборачивает выделенный текст в тег `<strong>`
- `si` : Оборачивает выделенный текст в тег `<em>`
- `sii` : Оборачивает выделенный текст в тег `<i>`
- `sq` : Оборачивает выделенный текст в кавычки «...»

#### Заголовки
- `s1` : Оборачивает выделенный текст в тег `<h1>`
- `s2` : Оборачивает выделенный текст в тег `<h2>`
- `s2t` : Оборачивает выделенный текст в тег `<h2 class="title">`
- `s3` : Оборачивает выделенный текст в тег `<h3>`
- `s4` : Оборачивает выделенный текст в тег `<h4>`
- `s5` : Оборачивает выделенный текст в тег `<h5>`
- `s6` : Оборачивает выделенный текст в тег `<h6>`

#### Ссылки: обычные, target, e-mail, телефон

- `sa` : Оборачивает выделенный текст в тег `<a href="<esc>maa">`
- `saa` : Оборачивает выделенный текст в тег `<a href="<C-R>z">`
- `sat` : Оборачивает выделенный текст в тег `<a href="https://<C-R>z" target="\_blank" rel="nofollow">`
- `saat` : Оборачивает выделенный текст в тег `<a href="<esc>maa" target="\_blank" rel="nofollow">`
- `s@` : Оборачивает выделенный текст в тег `<a href="mailto:<C-R>z">`
- `st` : Оборачивает выделенный текст в тег `<a href="tel:<C-R>z">`

#### Списки UL/DL

- `sl` : Оборачивает выделенный текст в тег `<li>`
- `sld` : Оборачивает выделенный текст в тег `<dd>`
- `slt` : Оборачивает выделенный текст в тег `<dt>`
- `sll` : Оборачивает выделенный текст в тег `<dl>`

#### Изображения

- `sw` : Оборачивает выделенный текст в тег `<img src="images/<C-R>z" alt="" title="">`
- `swl` : Оборачивает выделенный текст в тег `<a href="images/<C-R>z" class="iPop-img"><img src="images/<C-R>z" alt="" title=""></a>`
- `swv` : Оборачивает выделенный текст в тег `<a href="<C-R>z" class="iPop-video"></a>`

#### Комментарии

- `ss` : Оборачивает выделенный текст в тег `<!--<C-R>z -->`
- `sc` : Оборачивает выделенный текст в тег `/*<C-R>z*/`
- `sx` : Оборачивает выделенный текст в тег `/*--------------------<C-R>z--------------------*/`

#### Таблицы

- `stt` : Оборачивает выделенный текст в тег `<table>`
- `std` : Оборачивает выделенный текст в тег `<td>`
- `str` : Оборачивает выделенный текст в тег `<tr>`
- `sth` : Оборачивает выделенный текст в тег `<th>`

#### Hot key insert

media phone - **\phon**
```HTML
@media (max-width: 769px)
```
media pad - **\pad** 
```HTML
@media (min-width: 769px) and (max-width: 1024px)
```
media pad portrait - **\padp**
```HTML
@media  (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait)
```
media notebook - **\note**
```HTML
@media only screen and (max-width: 1650px)
```
media square - **\square**
```HTML
@media screen and (min-width: 1025px) and (max-width: 1400px)
```

