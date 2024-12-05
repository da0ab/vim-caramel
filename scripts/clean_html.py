# pip3 install beautifulsoup4

import sys
import re
from bs4 import BeautifulSoup
from bs4.element import Comment

def clean_html(html_content):
    # Парсинг HTML
    soup = BeautifulSoup(html_content, 'html.parser')

    # Удаление ненужных тегов с содержимым
    tags_to_remove = ['style', 'xml']
    for tag_name in tags_to_remove:
        for tag in soup.find_all(tag_name):
            tag.decompose()

    # Удаление комментариев
    comments = soup.findAll(text=lambda text: isinstance(text, Comment))
    for comment in comments:
        comment.extract()

    # Удаление ненужных атрибутов
    for tag in soup.find_all(True):
        tag.attrs = {key: value for key, value in tag.attrs.items() if key not in ['class', 'align', 'lang', 'style']}

    # Удаление ненужных тегов, сохраняя содержимое
    for tag in soup.find_all(['div', 'span', 'font', 'meta', 'html', 'head', 'body', 'title', 'tbody', 'link']):
        tag.unwrap()

    # Замена <b> на <strong>
    for b_tag in soup.find_all('b'):
        b_tag.name = 'strong'

    # Замена <u> на <strong>
    for b_tag in soup.find_all('u'):
        b_tag.name = 'strong'

    # Приведение списков в порядок
    for ul in soup.find_all('ul'):
        # Обрабатываем каждый элемент списка
        for li in ul.find_all('li', recursive=False):
            # Если внутри <li> есть <p>, перемещаем текст в сам <li>
            p_tag = li.find('p')
            if p_tag:
                li.string = p_tag.get_text(strip=True)
                p_tag.decompose()

    # Обрабатываем висячие <p> внутри <ul>, превращая их в <li>
        for p_tag in ul.find_all('p', recursive=False):
            new_li = soup.new_tag('li')
            new_li.string = p_tag.get_text(strip=True)
            p_tag.replace_with(new_li)

    # Удаление пустых тегов <p></p>
    for p_tag in soup.find_all('p'):
        if not p_tag.get_text(strip=True):  # Проверка пустого текста внутри <p>
            p_tag.decompose()


    # Удаление пустых <li> тегов
    for li_tag in soup.find_all('li'):
        if not li_tag.get_text(strip=True):  # Проверка пустого текста внутри <li>
            li_tag.decompose()

    # Удаление лишних переносов внутри <li>
    for li_tag in soup.find_all('li'):
    # Убираем все переносы строк и лишние пробелы внутри <li>
        li_tag.string = re.sub(r'\s+', ' ', li_tag.get_text(strip=True))

    # Удаление лишних переносов внутри <p> внутри любых тегов
    for tag in soup.find_all('p'):
        for element in tag.find_all(text=True):
            element.replace_with(re.sub(r'\s*\n\s*', ' ', element))

    # Преобразование обратно в строку
    text = str(soup)

    # Удаление пустых строк после преобразования
    # Убираем пустые строки, состоящие только из пробелов или пустых тегов
    text = re.sub(r'\n\s*\n', '\n', text)

    # Удаление лишних пробелов в начале и конце строки
    text = text.strip()

    # Замена кавычек и других текстовых символов
    text = text.replace('&laquo;', '«')
    text = text.replace('&raquo;', '»')
    text = text.replace('&ndash;', '–')
    text = text.replace('&nbsp;', ' ')
    text = text.replace('</strong>: ', ':</strong> ')
    return text

# Чтение входного содержимого
html_content = sys.stdin.read()
cleaned_html = clean_html(html_content)
print(cleaned_html)
