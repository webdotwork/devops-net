Заголовок Задание 3.1
Подзаголовок рещение
1.sudo apt install virtualbox
2.sudo apt-get install vagrant
3.nano .bashrc:
export PS1="(\[$(tput sgr0)\]\[\033[38;5;2m\]\d\[$(tput sgr0)\] \[$(tput sgr0)\]\[\033[38;5;2m\]\A\[$(tput sgr0)\])\h:\u \[$(tput sgr0)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]:\[$(tput sgr0)\]\[\033[38;5;13m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]"
4.nano Vagrantfile:
Vagrant.configure("2") do |config|
 	config.vm.box = "bento/ubuntu-20.04"
	config.vm.network "public_network"
end
5. для ВМ выделено:
CPU:1cpu
RAM:1024mb
HDD:64gb
video:4mb
6.добавить ресурсы:
nano Vagrantfile:
config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpu = "2"
   end
7.попробовали команды для работы с реминалом например touch cd rm rmdir mv cp ls и тд
8.cat .bashrc:
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
ignoreboth в bash используется для работы с историей конкретно не сохранять в истории команды по фильтру заданому этой командой
9.используетя для зарезервированых слов, команд
находиться:
man bash
RESERVED WORDS
       Reserved  words  are words that have a special meaning to the shell.  The following words
       are recognized as reserved when unquoted and either the first word of  a  simple  command
       (see SHELL GRAMMAR below) or the third word of a case or for command:

       !  case  coproc  do done elif else esac fi for function if in select then until while { }
       time [[ ]]
10.touch file-{1..1000}.txt
11.даная конструкция проверяет условие у -d /tmp есть такой катол или нет
12.mkdir /tmp/new_path_dir/ создание директории
   cp /bin/bash /tmp/new_path_dir/ копирование католога
   PATH=/tmp/new_path_dir/:$PATH меняем PATH
   type -a bash
13.Задания at и batch. Тогда как cron используется для назначения повторяющихся задач, команда at используется для назначения одноразового задания на заданное время, а команда batch — для назначения одноразовых задач, которые должны выполняться, когда загрузка системы становится меньше заданного значения.
14. vagrant halt
