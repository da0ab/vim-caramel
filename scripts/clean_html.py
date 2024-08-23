# pip3 install beautifulsoup4
import sys
import re
from bs4 import BeautifulSoup
from bs4.element import Comment

def clean_html(html_content):
    # Парсинг HTML
    soup = BeautifulSoup(html_content, 'html.parser')

    # Удаление указанных тегов вместе с содержимым
    tags_to_remove = ['style', 'xml']
    for tag_name in tags_to_remove:
        for tag in soup.find_all(tag_name):
            tag.decompose()

    # Удаление комментариев
    comments = soup.findAll(text=lambda text: isinstance(text, Comment))
    for comment in comments:
        comment.extract()

    # Удаление атрибутов class, align, lang, style и других
    for tag in soup.find_all(True):
        tag.attrs = {key: value for key, value in tag.attrs.items() if key not in ['class', 'align', 'lang', 'style', 'type', 'border', 'cellpadding', 'cellspacing', 'nowrap','background','bgcolor','bordercolor','height','width']}

    # Удаление всех div, span, font и других тегов, сохраняя их содержимое
    for tag in soup.find_all(['div', 'span', 'font', 'meta', 'html', 'head', 'body', 'title', 'tbody', 'link']):
        tag.unwrap()

    # Замена <b> на <strong>
    for b_tag in soup.find_all('b'):
        b_tag.name = 'strong'

    # Поиск всех тегов <td>
    for td_tag in soup.find_all('td'):
        # Удаление всех тегов <p> внутри <td>
        for p_tag in td_tag.find_all('p'):
            p_tag.unwrap()  # Удаляем тег <p>, сохраняя его содержимое


    # Удаление лишних переносов внутри <p> внутри любых тегов
    for tag in soup.find_all('p'):
        for element in tag.find_all(text=True):
            element.replace_with(re.sub(r'\s*\n\s*', ' ', element))


    # Удаление пустых <p> тегов
    for p_tag in soup.find_all('p'):
        if not p_tag.get_text(strip=True):  # Проверка пустого текста внутри <p>
            p_tag.decompose()

    # Преобразование обратно в строку
    text = str(soup)

    # Удаление последовательностей </strong><strong>
    text = re.sub(r'</strong>\s*<strong>', '', text)
    text = re.sub(r'</i>\s*<i>', '', text)
    text = re.sub(r'</em>\s*<em>', '', text)

    # Заменить «<strong> на <strong>«
    text = re.sub(r'«\s*<strong>', r'<strong>«', text)

    # Заменить </strong>» на »</strong>
    text = re.sub(r'</strong>\s*»', r'»</strong>', text)


    # Список знаков препинания, которые нужно обработать
    #punctuation_marks = r'[.,:;»]'
# Находим все теги, кроме тегов <a>
    for tag in soup.find_all(True, recursive=False):
        if tag.name != 'a':  # Игнорируем теги <a>
            for elem in tag.find_all(text=True):  # Извлекаем текст из тега
                new_text = ''
                for char in elem:
                    if char in [',', '.', ':', ';', '»']:  # Знаки пунктуации, после которых нужно добавить пробел
                        new_text += char + ' '
                    else:
                        new_text += char
                elem.replace_with(new_text)
    text = str(soup)

    # Текстовые замены
    text = text.replace('&laquo;', '«')
    text = text.replace('&raquo;', '»')
    text = text.replace('&ndash;', '–')
    text = text.replace('&nbsp;', ' ')
    #text = text.replace('. ”', '.”')
    #text = text.replace(', ”', ',”')
    #text = text.replace('. "', '."')
    #text = text.replace(', "', ',"')
    #text = text.replace('. . .', '...')
    #text = text.replace(' :', ':')
    #text = text.replace(' »', '»')
    #text = text.replace(' ,', ',')
    #text = text.replace('<br />', '<br>')
    #text = text.replace('<br/>', '<br>')
    return text

# Чтение входного содержимого
html_content = sys.stdin.read()
cleaned_html = clean_html(html_content)
print(cleaned_html)

