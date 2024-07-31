#!/usr/bin/env python3

import sys
import re

lines = []

while True:
    try:
        line = input()
        if line.strip() == "":
            continue

        line = re.sub(r'^\s*\d+\.\s*', '', line)  # Удаление первой цифры с точкой в начале строки
        line = line.lstrip('-*–• ')  # Удаление начальных символов -, *, –, •

        # Удаление начальных и конечных пробелов
        line = line.strip()

        lines.append(line)
    except EOFError:
        break

print("<ul>")
for line in lines:
    # Удаление <p> в начале и </p> в конце строки
    line = line.replace('<p>', '').replace('</p>', '')
    print(f"  <li>{line}</li>")
print("</ul>")
