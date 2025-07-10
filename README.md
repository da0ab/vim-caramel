# .vimrc-caramel

### F горячие клавиши

- `F1` : Сохранить
- `F1 + ESC` .vimrc : При сохранении .vimrc автоподхватывание нового конфига
- `F2` : Выделить строчку без символа переноса в конце
- `F3` : Выделить содержимое тега под курсором
- `F4` : Выделить тег под курсором
- `F5` :
- `F6 + ENTER`  Удалить все пустые строки:
- `Shift + F6 + ENTER` : Удалить множественные пустые строки, оставить одну
- `F7` : html клинер /Python скрипт/
- `F8` : Выбор кодировки из `utf8 win-1251 cp866 koi8-r koi8-u`
- `F9` : Отобразить/скрыть меню
- `F10` : **Оборачивалка тегом**: по нажатию выделяет строку, далее ввести первое слово - **тег**, второе слово - **class**, для оборачивания строк, разделенные пробелами перед именем тега ввести `>`
- `F11` : Снипеты с подсказками, что бы увидеть полный список нажать `Tab`
- `F12` : NERDTree

### Базовые сочетания горячих клавиш

- `C-q` :  Выход без сохранения
- `Space` : Пробел в нормальном режиме перелистывает страницы
- `Shift + Space` : Пробел в нормальном режиме перелистывает страницы обратно
- `<` и `>` : Смещаем блоки
- `C+c` и `C+V` :  Копировние/вставка
- `C-a` : Выделить все
- `C-d` : Дублирование текущей строки
- `C-x` : Вырезать текущую строку
- `m-,` : Таб влево
- `m-.` : Таб вправо
- `m-2` : Таб по номеру

### Горячие клавиши для оборачивание выделенного в режиме визуального выделения

#### Текстовые элементы

- `pp` : Оборачивает выделенный текст в тег `<p>`
- `sp` : Оборачивание нескольких абзацев/предложений в `<p>` /Python скрипт/
- `sb` : Оборачивает выделенный текст в тег `<b></b>`
- `bb` : Оборачивает выделенный текст в тег `<strong></strong>`
- `ii` : Оборачивает выделенный текст в тег `<em></em>`
- `si` : Оборачивает выделенный текст в тег `<i></i>`
- `sq` : Оборачивает выделенный текст в кавычки `«...»`

#### Заголовки

- `s1` : Оборачивает выделенный текст в тег `<h1></h1>`
- `s2` : Оборачивает выделенный текст в тег `<h2></h2>`
- `s2t` : Оборачивает выделенный текст в тег `<h2 class="title"></h2>`
- `s3` : Оборачивает выделенный текст в тег `<h3></h3>`
- `s4` : Оборачивает выделенный текст в тег `<h4></h4>`
- `s5` : Оборачивает выделенный текст в тег `<h5></h5>`
- `s6` : Оборачивает выделенный текст в тег `<h6></h6>`

#### Ссылки: обычные, target, e-mail, телефон

- `sa` : Оборачивает выделенный текст в тег `<a href="">my-site.com</a>`
- `saa` : Оборачивает выделенный текст в тег `<a href="my-site.com">my-site.com</a>`
- `sat` : Оборачивает выделенный текст в тег `<a href="" target="_blank" rel="nofollow">my-site.com</a>`
- `saat` : Оборачивает выделенный текст в тег `<a href="https://my-site.com" target="_blank" rel="nofollow">my-site.com</a>`
- `s@` : Оборачивает выделенный текст в тег `<a href="mailto:my@box.com">mailto:my@box.com</a>`
- `st` : Оборачивает выделенный текст в тег `<a href="tel:+7 999 000 000">+7 999 000 000</a>`

#### html блоки

- `sd`  : Оборачивает выделенный текст в тег `<div>`
<!--- `sdd` : Оборачивание нескольких абзацев/предложений в`<div>` /Python скрипт/ -->
- `sdi` : Оборачивает выделенный текст в тег `<div id="">`
- `sdc` : Оборачивает выделенный текст в тег `<div class="">`
- `spa` : Оборачивает выделенный текст в тег `<span class="">`
- `span` : Оборачивает выделенный текст в тег `<span>`
- `sec`  : Оборачивает выделенный текст в тег `<section>`
- `secc` : Оборачивает выделенный текст в тег `<section class="main">`

#### details

- `details` или `det` : Оборачивает выделенный текст в тег `<details><summary>Заголовок</summary> </details>`

#### Списки ul

- `su` : Оборачивание в список группы строк (разделение переносом) /Python скрипт/
- `sl` : Оборачивает выделенный текст в тег `<li>`

#### Изображения

- `sw`  : Оборачивает выделенный текст в тег `<img src="images/pic.jpg" alt="" title="">`
- `swl` : Оборачивает выделенный текст в тег `<a href="images/pic.jpg" class="iPop-img"><img src="images/pic.jpg" alt="" title=""></a>`
- `swv` : Оборачивает выделенный текст в тег `<a href="pic.jpg" class="iPop-video"></a>`

#### Комментарии

- `ss` : Оборачивает выделенный текст в  `<!-- текст -->`
- `sc` : Оборачивает выделенный текст в  `/*текст*/`
- `sx` : Оборачивает выделенный текст в  `/*-------------------- текст --------------------*/`
- `sv` : Оборачивает выделенный текст в  `" ===== текст =====`

### Горячие клавиши для быстрого добавления

#### Быстрая добавка

- `<C-Enter>` : Вставляет `<br>`
- `\a`        : Вставляет `<a id="" class="anchor"></a>`
- `\<Space>`  : Вставляет `&nbsp;`
- `\i`        : Вставляет `id=""`
- `\c`        : Вставляет `class=""`
- `\w`        : Вставляет `width:;`
- `\h`        : Вставляет `height:;`
- `\l`        : Вставляет `<hr>`
- `\v`        : Вставляет `var(--);`
- `\–`        : Вставляет `–;`
- `\ve`       : Вставляет `?v=0.0.1`
- `\ff`       : Вставляет `color: #fff;`
- `\b`        : Вставляет `border: 1px solid #ddd;`
- `\1`        : Вставляет `!important`
- `\fw`       : Вставляет `font-weight: bold;`
- `\bg`       : Вставляет `background: transparent url(../images/) no-repeat center;`

#### HTML/CSS/bash/python

- `\sh` : Вставляет `#!/bin/bash`
- `\py` : Вставляет `#!/usr/bin/env python3<cr># -*- coding: utf-8 -*-`
- `\s` : Вставляет `<style type="text/css"> </style>`
- `\j` : Вставляет `<script type="text/javascript" src="js"> </script>`
- `\css` : Вставляет `<link rel="stylesheet" href="css/ProTo.min.css?v=0.0.1">`

#### Leader сочетания `.`

- `LEADER l` : Подсказки по Leader
- `LEADER t` : Вставка дата времени вида `-----/ 01 АПРЕЛЯ 2025 • 09:14:51 ПЯТНИЦА /-----`
- `LEADER h` : Открыть памятку vim`ра
- `LEADER v` : Редактировать .vimrc
---

####  Статус строка

```HTML
Строки: всего ∙  курсор на строке ∙ % строк | Символы: всего ∙  в строке ∙ курсор на символе | Кодировка
```

### Тема dark_puerh.vim

[dark_puerh.vim](https://github.com/da0ab/dark_puerh.vim)

### Инсталляционный скрипт

``install_vim-caramel.sh``

#### Python скрипты размещены в

```HTML
~/.vim/scripts/
```
####  Python скрипт сборки и копирования

- **vimrc-complit.py**  - собирает и записывает ~/.vimrc.compiled делая бекап ~/.vimrc~ удаляет комментарии


### Плагины

- [vim-pathogen](https://github.com/tpope/vim-pathogen/)
- [vim-startify](https://github.com/mhinz/vim-startify/)
- [NERDTree](https://github.com/preservim/nerdtree/)
- [vim-nerdtree-syntax-highlight](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight)
- [vim-devicons](https://github.com/ryanoasis/vim-devicons)
- [vim-css-color](https://github.com/ap/vim-css-color)
- [vim-signature](https://github.com/kshenoy/vim-signature)
- [Nerd Fonts](https://www.nerdfonts.com/font-downloads)

``git clone https://github.com/mhinz/vim-startify.git ~/.vim/bundle/vim-startify``

``git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree``

``git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git ~/.vim/bundle/vim-nerdtree-syntax-highlight``

``git clone https://github.com/ryanoasis/vim-devicons.git ~/.vim/bundle/vim-devicons``

``git clone https://github.com/ap/vim-css-color.git ~/.vim/bundle/vim-devicons``

``git clone https://github.com/kshenoy/vim-signature.git ~/.vim/bundle/vim-signature``




#### Файлы

``
├── 01-core.vim
├── 02-backup_swap.vim
├── 03-cursor_behavior.vim
├── 04-completion.vim
├── 05-text_editing.vim
├── 06-ui_statusline.vim
├── 07-ui_search.vim
├── 08-ui_appearance.vim
├── 09-key_russian_layout.vim
├── 10-key_mappings.vim
├── 11-key_mappings-html.vim
├── 12-key_mappings-py-script.vim
├── plugins
│   ├── 01-pathogen.vim
│   ├── 03-nerdtree.vim
│   ├── 04-vim-signature.vim
│   └── 05-vim-startify.vim
├── _scripts_
│   ├── clean_html.py
│   ├── div.py
│   ├── li.py
│   └── p.py
├── _dict_
│   ├── universal-css.dict
│   └── css.dict
├── help
│   ├── my-help.vim
│   └── start-help.vim
├── py-script.vim
├── install_vim-caramel.sh
└── vimrc-complit.py
``



