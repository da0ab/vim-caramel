#!/usr/bin/env python3

import sys

def wrap_in_paragraphs(text):
    lines = text.split('\n')
    wrapped_text = ''
    is_in_paragraph = False

    for line in lines:
        line = line.strip()
        if line:
            if is_in_paragraph:
                wrapped_text += f'\n{line}'
            else:
                wrapped_text += f'<div>{line}'
                is_in_paragraph = True
        else:
            if is_in_paragraph:
                wrapped_text += '</div>\n\n'
                is_in_paragraph = False

    if is_in_paragraph:
        wrapped_text += '</div>'

    return wrapped_text

if __name__ == "__main__":
    selected_text = sys.stdin.read()
    wrapped_text = wrap_in_paragraphs(selected_text)
    sys.stdout.write(wrapped_text)
