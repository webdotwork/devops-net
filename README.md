# devops-net
ПРОИГНОРИРОВАНЫ БУДУТ ФАЙЛЫ:
НАХОДЯЩИЕСЯ В ДИРЕКТОРИИ **/.terraform/*
ЛЮБЫЕ ФАЙЛЫ ОКАНЧИВАЮЩИЕСЯ НА .tfstate 
ЛЮБЫЙ ФАЙЛЫ СОДЕРЖУЮЩИЕ В ТЕЛЕ .tfstate.
КРЕШ ЛОГ ФАЙЛЫ crash.log
ТАК ЖЕ КРЕШ РЕПОТЫ crash.*.log
ФАЙЛЫ ОКАНЧИВАЮЩИЕСЯ НА .tfvars
ФАЙЛЫ override.tf И override.tf.json
ФАЙЛЫ СОДЕРЖУЩИЕ В ТЕЛЕ _override.tf И _override.tf.json
ФАЙЛЫ КОНФИГУРАЦИИ КОМАНД ЛАЙН .terraformrc И terraform.rc

https://itfb.com.ua/posle-udaleniya-fayla-mesto-ne-osvobodilos-linux/

gvfs-fuse-daemon
  367  gvfs-tree 
  368  gvfs-tree | grep fuse
  369  clear
  370  mount
  371  nano fuse.conf 
  372  sudo nano fuse.conf 
  373  sudo addgroup ubivan fuse
  374  groups
  375  newgrp fuse
  376  sudo groupadd fuse
  377  newgrp fuse
  378  groups
  379  newgrp fuse
  380  sudo addgroup ubivan fuse
  381  newgrp fuse
  382  groups
  383  cat /etc/fuse.conf
  384  fusermount -zu $HOME/.gvfs
  385  mount |grep gvfs
  386  umount /run/user/1000/gvfs
  387  sudo umount /run/user/1000/gvfs
  388  mount |grep gvfs
  389  killall gvfsd-fuse
  390  /usr/lib/gvfs/gvfsd-fuse -o allow_root $HOME/.gvfs
  391  /usr/lib/gvfs/gvfsd-fuse -o allow_root /run/user/1000/gvfs
  392  mount |grep gvfs
  393  ps aux | grep nano
  394  lsof -p 5049
  395  ls -l /proc/5049/fd
  396  su -


https://askubuntu.com/questions/401454/how-to-get-sudo-access-to-shares-mounted-by-gigolo/401509#401509
