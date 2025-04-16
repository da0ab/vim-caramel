                                                                                                                                    
# .vimrc-TURBO-HTML
vim chips + scripts


#### VIMRC-COMPLIT.sh - build script and copy python script
```HTML
#!/bin/bash
cat base key-ru-fix face cursor statusline search backup content keys html py-script > ~/.vimrc
cp -r script/* ~/.vim
```

- **base** - Basic
- **key-ru-fix** - Russian layout fix
- **face** - Design
- **cursor** - Cursor
- **statusline** - Status line
- **search** - Search
- **backup** - Backup
- **content** - File content
- **keys** - Hotkey combinations
- **html** - css/html
- **py-script** - Python3 scripts for wrapping html



#### Python scripts are placed in
```HTML
/.vim/scripts/li.py
```


#### Hot key insert

media phone - **\phone**
```HTML
@media (max-width: 769px)
```
media pad - **\pad** 
```HTML
@media (min-width: 769px) and (max-width: 1024px)
```
media pad portrait - **\padp**
```HTML
@media  (min-device-width : 768px) and (max-device-width : 1024px) and (orientation : portrait)
```
media notebook - **\note**
```HTML
@media only screen and (max-width: 1650px)
```
media square - **\square**
```HTML
@media screen and (min-width: 1025px) and (max-width: 1400px)
```

