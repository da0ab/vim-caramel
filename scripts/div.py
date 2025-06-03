#!/usr/bin/env python3

import sys

def wrap_in_paragraphs(text):
    lines = text.split('\n')
    wrapped_text = []
    current_paragraph = []

    for line in lines:
        stripped_line = line.strip()
        if stripped_line:
            current_paragraph.append(line)
        else:
            if current_paragraph:
                wrapped_text.append('<div>' + '\n'.join(current_paragraph) + '</div>')
                current_paragraph = []
            wrapped_text.append('')

    if current_paragraph:
        wrapped_text.append('<div>' + '\n'.join(current_paragraph) + '</div>')

    return '\n'.join(wrapped_text)

if __name__ == "__main__":
    selected_text = sys.stdin.read()
    wrapped_text = wrap_in_paragraphs(selected_text)
    sys.stdout.write(wrapped_text)
