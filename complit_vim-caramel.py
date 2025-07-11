import os
import shutil

# === Настройки ===
REMOVE_COMMENTS = True        # Удалять строки-комментарии (начинающиеся с " или " ")
REMOVE_EMPTY_LINES = True     # Удалять пустые строки
# ==================

# Получаем путь к файлу ~/.vimrc
vimrc_path = os.path.expanduser("~/.vimrc.compiled")
script_dir = os.getcwd()  # Директория, где находится скрипт

# Переименовываем старый .vimrc (если есть)
if os.path.exists(vimrc_path):
    shutil.move(vimrc_path, vimrc_path + "~")
    print(f"Файл {vimrc_path} был переименован в {vimrc_path}~")

# Список файлов для добавления в ~/.vimrc.compiled
files_to_add = [
    "01-core.vim",
    "02-backup_swap.vim",
    "03-cursor_behavior.vim",
    "04-completion.vim",
    "05-text_editing.vim",
    "06-ui_statusline.vim",
    "07-ui_search.vim",
    "08-ui_appearance.vim",
    "09-key_russian_layout.vim",
    "10-key_mappings.vim",
    "11-key_mappings-html.vim",
    "12-key_mappings-py-script.vim",
    "plugins/01-pathogen.vim",
    "plugins/03-nerdtree.vim",
    "plugins/04-vim-signature.vim",
    "plugins/05-vim-startify.vim"
]

def process_lines(lines):
    result = []
    for line in lines:
        stripped = line.strip()
        if REMOVE_COMMENTS and stripped.startswith('"'):
            continue
        if REMOVE_EMPTY_LINES and stripped == '':
            continue
        result.append(line)
    return result

# Открываем новый ~/.vimrc для записи
with open(vimrc_path, 'w') as vimrc_file:
    for filename in files_to_add:
        file_path = os.path.join(script_dir, filename)
        if os.path.isfile(file_path):
            with open(file_path, 'r') as f:
                lines = f.readlines()
                processed_lines = process_lines(lines)
                vimrc_file.writelines(processed_lines)
                vimrc_file.write("\n")  # Разделитель между файлами
                print(f"Добавлено содержимое {filename} в {vimrc_path}")
        else:
            print(f"Файл {filename} не найден. Пропускаем.")

# === Универсальное копирование файлов в ~/.vim ===

def copy_files(copy_map):
    vim_dir = os.path.expanduser("~/.vim")
    for src_rel, dst_rel in copy_map:
        src_path = os.path.join(script_dir, src_rel)
        dst_path = os.path.join(vim_dir, dst_rel)
        dst_subdir = os.path.dirname(dst_path)
        os.makedirs(dst_subdir, exist_ok=True)
        if os.path.isfile(src_path):
            shutil.copy2(src_path, dst_path)
            print(f"Файл {src_rel} скопирован в {dst_path}")
        else:
            print(f"Файл {src_rel} не найден. Пропускаем копирование.")

# Файлы для копирования: (относительный путь из проекта, относительный путь в ~/.vim)
files_to_copy = [
    ("my-help.vim", "help/my-help.vim"),
    ("start-help.vim", "help/start-help.vim"),
    ("dict/css.dict", "dict/css.dict"),
    ("scripts/div.py", "scripts/div.py"),
    ("scripts/li.py", "scripts/li.py"),
    ("scripts/p.py", "scripts/p.py"),
    ("scripts/clean_html.py", "scripts/clean_html.py"),
    ("dict/universal-css.dict", "dict/universal-css.dict"),
    ("colors/dark_puerh.vim", "colors/dark_puerh.vim"),
]

copy_files(files_to_copy)

# Копирование итогового .vimrc обратно в директорию скрипта
dst_vimrc = os.path.join(script_dir, ".vimrc.compiled")
if os.path.exists(vimrc_path):
    shutil.copy2(vimrc_path, dst_vimrc)
    print(f"Файл {vimrc_path} скопирован в директорию скрипта {script_dir}")
else:
    print(f"Файл {vimrc_path} не найден. Не удалось скопировать в директорию скрипта.")

print("Сборка файлов завершена.")

