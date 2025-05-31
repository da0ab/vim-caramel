def css_suggestions(prefix):
    items = [
        'font-weight: normal;',
        'font-weight: bold;',
        'font-weight: bolder;',
        'font-weight: lighter;',
        'color: red;',
        'color: blue;',
        'background-color: black;',
        'background-color: white;',
        'display: flex;',
        'display: block;',
        'var(--main-color);',
    ]
    return [item for item in items if item.startswith(prefix)]

