#!/bin/bash
#chmod +x install_vim.sh

#!/bin/bash

# Установка gvim
echo "Устанавливаем gvim..."
sudo apt update
sudo apt install -y vim-gtk3  # или vim-gnome, в зависимости от вашей системы

# Создаем необходимые директории
echo "Создаем необходимые директории..."
mkdir -p ~/.vim/tmp
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/scripts  # Создаем директорию scripts

# Клонируем необходимые репозитории
echo "Клонируем vim-pathogen в autoload..."
git clone https://github.com/tpope/vim-pathogen.git ~/.vim/autoload/pathogen.vim

echo "Клонируем плагины в bundle..."
git clone https://github.com/mhinz/vim-startify.git ~/.vim/bundle/vim-startify
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/tiagofumo/vim-nerdtree-syntax-highlight.git ~/.vim/bundle/vim-nerdtree-syntax-highlight
git clone https://github.com/ryanoasis/vim-devicons.git ~/.vim/bundle/vim-devicons

echo "Клонируем цветовую схему в colors..."
git clone https://github.com/fugalh/desert.vim.git ~/.vim/colors/desert

# Загружаем .vimrc и другие файлы
echo "Скачиваем .vimrc..."
curl -o ~/.vimrc https://raw.githubusercontent.com/da0ab/.vimrc-TURBO-HTML/master/.vimrc

echo "Скачиваем start-help.vim..."
curl -o ~/.vim/start-help.vim https://raw.githubusercontent.com/da0ab/.vimrc-TURBO-HTML/master/start-help.vim

# Загружаем скрипты
echo "Скачиваем скрипты..."
curl -L https://github.com/da0ab/.vimrc-TURBO-HTML/archive/refs/heads/master.zip -o /tmp/scripts.zip
unzip -o /tmp/scripts.zip -d /tmp
mv /tmp/.vimrc-TURBO-HTML-master/scripts/* ~/.vim/scripts/
rm -rf /tmp/.vimrc-TURBO-HTML-master /tmp/scripts.zip  # Убираем временные файлы

echo "Установка завершена! Пожалуйста, запустите gvim и проверьте настройки."
