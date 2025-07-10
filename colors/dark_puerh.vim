" ======================
" DARK PUERH FOR ME  - fermented tea color scheme
" 熟普洱 - 深色发酵茶 inspired theme
" ======================
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'dark_puerh'

let s:bg_main =           '#1e1e2e' " Основной фон
let s:my_black =          '#000000' " Череный
let s:my_white =          '#ffffff' " Белый

let s:my_gray_darker =    '#2c313c'
let s:my_gray_dark =      '#4d4d4d'
let s:my_gray =           '#666666'
let s:my_gray_light =     '#7f7f8c'
let s:my_gray_lighter =   '#a8a8a8'
let s:my_gray_lightest =  '#c6c6c6'

let s:my_purple =         '#af5faf' " Пурпурный

let s:my_green =          '#6b8e24' " Зеленый
let s:my_green_light =    '#89fb98' " Бледно зеленый
let s:my_pale =           '#A6E3A1' " Светло зеленый
let s:my_khaki =          '#bdb76b' " Хаки

let s:my_blue_steel =     '#5f87af' " Сталистый
let s:my_blue_sky =       '#75a0ff' " Небесно-голубой
let s:my_blue =           '#70b3c7' " Голубой
let s:my_marine =         '#94e2d5' " Цвет морской волны

let s:my_red =            '#ff0000' " Красный
let s:my_red_indian =     '#cd5c5c' " Индейский красный
let s:my_coral =          '#ffa0a0' " Коралл
let s:my_orange =         '#FFA500' " Оранжевый
let s:my_peru =           '#cd853f' " Коричневый
let s:my_peach =          '#fab387' " Персиковый
let s:my_gold =           '#ffde9b' " Золотой
let s:my_yellow_light =   '#f0e68c' " Желтый светлый
let s:my_yellow =         '#eeee00' " Желтый



" Функция для установки стилей
function! s:hi(group, fg, bg, gui, cterm)
  execute 'highlight ' . a:group
        \ . ' guifg=' . a:fg
        \ . ' guibg=' . a:bg
        \ . ' gui=' . a:gui
        \ . ' cterm=' . a:cterm
endfunction

" Основные элементы
call s:hi("Normal", s:my_white, s:bg_main, "NONE", "NONE")

" Связи между группами
hi! link Terminal Normal
hi! link LineNrAbove LineNr
hi! link LineNrBelow LineNr
hi! link CurSearch Search
hi! link CursorLineFold CursorLine
hi! link CursorLineSign CursorLine
hi! link EndOfBuffer NonText

" Полный список стилей
"call s:hi(группа подсветки, цвет текста, цвет фона, GUI-стиль, терминальный стиль)

" === Окна/Статус ===
" Основная строка состояния (активное окно)
call s:hi("StatusLine", s:my_gray_darker, s:my_gray_lightest, "NONE", "NONE")
" Строка состояния неактивного окна
call s:hi("StatusLineNC", s:my_gray_light, s:my_gray_lightest, "NONE", "NONE")
" Строка состояния терминала (активный)
call s:hi("StatusLineTerm", s:my_gray_darker, s:my_gray_lightest, "NONE", "NONE")
" Строка состояния терминала (неактивный)
call s:hi("StatusLineTermNC", s:my_white, s:my_black, "NONE", "NONE")
" Вертикальные разделители окон
call s:hi("VertSplit", s:my_gray_darker, s:bg_main, "NONE", "NONE")

" === Меню/Вкладки ===
" Выпадающее меню (фон)
call s:hi("Pmenu", s:my_white, s:my_gray, "NONE", "NONE")
" Выбранный элемент меню
call s:hi("PmenuSel", s:my_gray_darker, s:my_yellow_light, "NONE", "NONE")
" Полоса прокрутки меню
call s:hi("PmenuSbar", "NONE", s:bg_main, "NONE", "NONE")
" Ползунок прокрутки меню
call s:hi("PmenuThumb", "NONE", s:my_gray_lightest, "NONE", "NONE")
" Неактивные вкладки
call s:hi("TabLine", s:my_gray_darker, s:my_gray_lightest, "NONE", "NONE")
" Фон линии вкладок
call s:hi("TabLineFill", "NONE", s:my_gray_lightest, "NONE", "NONE")
" Активная вкладка
call s:hi("TabLineSel", s:my_gray_darker, s:my_yellow_light, "NONE", "NONE")

" === Панели инструментов ===
" Фон панели инструментов
call s:hi("ToolbarLine", "NONE", s:my_gray, "NONE", "NONE")
" Кнопки на панели инструментов
call s:hi("ToolbarButton", s:my_gray_darker, s:my_gold, "bold", "bold")

" === Текст/Символы ===
" Символы конца буфера (~)
call s:hi("NonText", s:my_blue, "NONE", "NONE", "NONE")
" Специальные символы (например, пробелы)
call s:hi("SpecialKey", s:my_green_light, "NONE", "NONE", "NONE")
" Свернутый текст
call s:hi("Folded", s:my_yellow, s:my_gray_dark, "NONE", "NONE")

" === Выделение ===
" Визуальное выделение
call s:hi("Visual", s:my_yellow_light, s:my_green, "NONE", "NONE")
" Визуальное выделение (не полностью)
call s:hi("VisualNOS", s:my_yellow_light, s:my_blue, "NONE", "NONE")

" === Номера строк ===
" Номера строк
call s:hi("LineNr", s:my_gray_dark, "NONE", "NONE", "NONE")
" Колонка сворачивания
call s:hi("FoldColumn", s:my_gray_lighter, s:bg_main, "NONE", "NONE")

" === Курсор ===
" Линия курсора
call s:hi("CursorLine", "NONE", s:my_gray_darker, "NONE", "NONE")
" Колонка курсора
call s:hi("CursorColumn", "NONE", s:my_gray, "NONE", "NONE")
" Номер строки с курсором
call s:hi("CursorLineNr", s:my_orange, s:my_gray_darker, "bold", "bold")

" === Быстрое исправление ===
" Линия быстрого исправления
call s:hi("QuickFixLine", s:my_gray_darker, s:my_yellow_light, "NONE", "NONE")

" === Колонка знаков ===
" Колонка для знаков (git, ошибки, маркеры)
call s:hi("SignColumn", "NONE", "NONE", "NONE", "NONE")

" === Специальные стили ===
" Подчеркнутый текст
call s:hi("Underlined", s:my_blue_sky, "NONE", "underline", "underline")

" === Ошибки/Предупреждения ===
" Ошибки
call s:hi("Error", s:my_red, s:my_white, "reverse", "reverse")
" Сообщения об ошибках
call s:hi("ErrorMsg", s:my_red, s:my_white, "reverse", "reverse")
" Сообщения режимов (-- INSERT --)
call s:hi("ModeMsg", s:my_gold, "NONE", "bold", "bold")
" Предупреждения
call s:hi("WarningMsg", s:my_red_indian, "NONE", "bold", "bold")
" Дополнительные сообщения
call s:hi("MoreMsg", s:my_green_light, "NONE", "bold", "bold")
" Вопросы
call s:hi("Question", s:my_pale, "NONE", "bold", "bold")
" TODO-комментарии
call s:hi("Todo", s:my_red, s:my_yellow, "NONE", "NONE")

" === Поиск/Совпадения ===
" Парные скобки
call s:hi("MatchParen", s:my_gray_light, s:my_khaki, "NONE", "NONE")
" Результаты поиска
call s:hi("Search", s:my_yellow_light, s:my_gray_light, "NONE", "NONE")
" Инкрементальный поиск
call s:hi("IncSearch", s:my_yellow_light, s:my_peru, "NONE", "NONE")
" Дикое меню (автодополнение)
call s:hi("WildMenu", s:my_gray_darker, s:my_yellow, "NONE", "NONE")

" === Колонки ===
" Цветная колонка (например, >80 символов)
call s:hi("ColorColumn", s:my_white, s:my_red_indian, "NONE", "NONE")

" === Курсоры ===
" Основной курсор
call s:hi("Cursor", s:my_gray_darker, s:my_yellow_light, "NONE", "NONE")
" Локализованный курсор
call s:hi("lCursor", s:my_gray_darker, s:my_red, "NONE", "NONE")

" === Отладка ===
" Точка выполнения при отладке
call s:hi("debugPC", s:my_gray, "NONE", "reverse", "reverse")
" Точки останова
call s:hi("debugBreakpoint", s:my_coral, "NONE", "reverse", "reverse")

" === Проверка орфографии ===
" Ошибки орфографии
call s:hi("SpellBad", s:my_red_indian, "NONE", "undercurl", "underline")
" Прописные буквы
call s:hi("SpellCap", s:my_blue_sky, "NONE", "undercurl", "underline")
" Локальные ошибки орфографии
call s:hi("SpellLocal", s:my_gold, "NONE", "undercurl", "underline")
" Редкие ошибки орфографии
call s:hi("SpellRare", s:my_green_light, "NONE", "undercurl", "underline")

" === Синтаксис ===
" Комментарии
call s:hi("Comment", s:my_blue, "NONE", "NONE", "NONE")
" Идентификаторы
call s:hi("Identifier", s:my_pale, "NONE", "NONE", "NONE")
" Операторы/ключевые слова
call s:hi("Statement", s:my_yellow_light, "NONE", "bold", "bold")
" Константы
call s:hi("Constant", s:my_coral, "NONE", "NONE", "NONE")
" Препроцессор
call s:hi("PreProc", s:my_red_indian, "NONE", "NONE", "NONE")
" Типы
call s:hi("Type", s:my_khaki, "NONE", "bold", "bold")
" Специальные символы
call s:hi("Special", s:my_gold, "NONE", "NONE", "NONE")
" Директории
call s:hi("Directory", s:my_blue, "NONE", "NONE", "NONE")
" Скрытый текст
call s:hi("Conceal", s:my_gray, "NONE", "NONE", "NONE")
" Игнорируемый текст
call s:hi("Ignore", "NONE", "NONE", "NONE", "NONE")
" Заголовки
call s:hi("Title", s:my_red_indian, "NONE", "bold", "bold")

" === Diff ===
" Добавленные строки
call s:hi("DiffAdd", s:my_white, s:my_green, "NONE", "NONE")
" Измененные строки
call s:hi("DiffChange", s:my_white, s:my_blue_steel, "NONE", "NONE")
" Текст изменений
call s:hi("DiffText", s:my_black, s:my_gray_lightest, "NONE", "NONE")
" Удаленные строки
call s:hi("DiffDelete", s:my_white, s:my_purple, "NONE", "NONE")

" Гарантия темного фона
if synIDattr(synIDtrans(hlID('Normal')), 'bg') != s:bg_main
  hi Normal guibg=#1E1E2E
endif
