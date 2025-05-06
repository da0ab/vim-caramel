import os
import shutil

# Получаем путь к файлу ~/.vimrc
vimrc_path = os.path.expanduser("~/.vimrc")

# Проверяем, существует ли файл ~/.vimrc
if os.path.exists(vimrc_path):
    # Если существует, переименовываем его в ~/.vimrc~
    shutil.move(vimrc_path, vimrc_path + "~")
    print(f"Файл {vimrc_path} был переименован в {vimrc_path}~")

# Список файлов для добавления в ~/.vimrc
files_to_add = [
    "base",
    "key-ru-fix",
    "face",
    "cursor",
    "statusline",
    "search",
    "backup",
    "content",
    "keys",
    "html",
    "py-script",
    "plugins"
]

# Открываем новый ~/.vimrc для записи
with open(vimrc_path, 'w') as vimrc_file:
    for filename in files_to_add:
        file_path = os.path.join(os.getcwd(), filename)
        if os.path.isfile(file_path):
            # Если файл существует, добавляем его содержимое в ~/.vimrc
            with open(file_path, 'r') as f:
                content = f.read()
                vimrc_file.write(content + "\n")  # Добавляем содержимое файла и перевод строки
                print(f"Добавлено содержимое {filename} в {vimrc_path}")
        else:
            print(f"Файл {filename} не найден. Пропускаем.")

print("Сборка файлов завершена.")
