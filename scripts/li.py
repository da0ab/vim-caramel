#!/usr/bin/env python3

import re

lines = []
inside_ul_block = False  # Флаг для отслеживания, находимся ли мы внутри блока <ul>

while True:
    try:
        line = input()
        if line.strip() == "":
            continue

        # Игнорируем строки, содержащие только теги <ul> или </ul>
        if re.match(r'^\s*<ul>\s*$', line) or re.match(r'^\s*</ul>\s*$', line):
            continue
        # Удаляем <p> и </p>, если они внутри строки
        line = re.sub(r'<p>(.*?)</p>', r'\1', line)

        # Удаление начальной нумерации
        line = re.sub(r'^\s*\d+\.\s*', '', line)

        # Удаляем пробелы в начале строки
        line = re.sub(r'^\s+', '', line)  # Удаляем начальные пробелы

        # Удаляем все не-буквенные символы до первой буквы
        line = re.sub(r'^[^\w]+', '', line)  # Удаляем не-буквенные и не-цифровые символы

        # Удаляем пробелы еще раз до первой буквы
        line = re.sub(r'^\s+', '', line)  # Удаляем начальные пробелы

        # Удаляем цифры, которые могут идти в начале
        line = re.sub(r'^\d+', '', line)  # Удаляем начальные цифры

        # Удаление начальных и конечных пробелов
        line = line.strip()

        # Удаляем <br> и </br> на конце строки
        line = re.sub(r'<br\s*/?>$', '', line)        # Если строка пустая после обработки, пропускаем её
        if line:
            lines.append(line)
    except EOFError:
        break

# Формирование корректного HTML-вывода
print("<ul>")
for line in lines:
    # Убедимся, что внутри <li> не создаётся вложенный <li>
    if line.startswith("<li>") and line.endswith("</li>"):
        line = re.sub(r'^<li>(.*?)</li>$', r'\1', line)  # Убираем лишние <li></li> внутри строки
    print(f"  <li>{line}</li>")
print("</ul>")
