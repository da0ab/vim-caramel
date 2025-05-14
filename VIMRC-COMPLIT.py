import os
import shutil

# Получаем путь к файлу ~/.vimrc
vimrc_path = os.path.expanduser("~/.vimrc")
script_dir = os.getcwd()  # Директория, где находится скрипт

# Проверяем, существует ли файл ~/.vimrc
if os.path.exists(vimrc_path):
    # Если существует, переименовываем его в ~/.vimrc~
    shutil.move(vimrc_path, vimrc_path + "~")
    print(f"Файл {vimrc_path} был переименован в {vimrc_path}~")

# Список файлов для добавления в ~/.vimrc
files_to_add = [
    "base.vim",
    "key-ru-fix.vim",
    "face.vim",
    "cursor.vim",
    "statusline.vim",
    "search.vim",
    "backup.vim",
    "content.vim",
    "keys.vim",
    "html.vim",
    "py-script.vim",
    "plugins.vim"
]

# Открываем новый ~/.vimrc для записи
with open(vimrc_path, 'w') as vimrc_file:
    for filename in files_to_add:
        file_path = os.path.join(script_dir, filename)
        if os.path.isfile(file_path):
            # Если файл существует, добавляем его содержимое в ~/.vimrc
            with open(file_path, 'r') as f:
                content = f.read()
                vimrc_file.write(content + "\n")  # Добавляем содержимое файла и перевод строки
                print(f"Добавлено содержимое {filename} в {vimrc_path}")
        else:
            print(f"Файл {filename} не найден. Пропускаем.")

# Копирование my-help.vim в ~/.vim/
src_help = os.path.join(script_dir, "my-help.vim")
dst_dir = os.path.expanduser("~/.vim")
dst_help = os.path.join(dst_dir, "my-help.vim")

if os.path.isfile(src_help):
    os.makedirs(dst_dir, exist_ok=True)
    shutil.copy2(src_help, dst_help)
    print(f"Файл my-help.vim скопирован в {dst_help}")
else:
    print("Файл my-help.vim не найден. Пропускаем копирование.")

# Копирование собранного .vimrc в директорию скрипта
if os.path.exists(vimrc_path):
    shutil.copy2(vimrc_path, os.path.join(script_dir, ".vimrc"))
    print(f"Файл {vimrc_path} скопирован в директорию скрипта {script_dir}")
else:
    print(f"Файл {vimrc_path} не найден. Не удалось скопировать в директорию скрипта.")

print("Сборка файлов завершена.")
