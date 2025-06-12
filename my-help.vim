
"................ mod

"перевести в верхний регистр первую букву предложения
:%s/[.!?]\_s\+\a/\U&\E/g

"раздельные слова и цифры оборачиваем только цифры
:%s,\(\d\+\),<td>\1</td>,g



#/*--------------------Python--------------------*/

python3 -m venv my_local_python
"python3.13 -m venv my_local_python
pip install -r requirements.txt

alias pp="source ~/my_local_python/bin/activate"
alias ppp="python3"
alias pv3="echo " $(python3 --version) | $(pip3 --version)""


pip freeze > requirements.txt



