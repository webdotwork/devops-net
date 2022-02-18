Заголовок: Задание 3.1

Подзаголовок: рещение

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
for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
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


Заголовок: Задание 3.2

1 CD встроеная в bash shell команда 
встроенные команды быстрее чем внешние 
потому что не создают новые процесы

2.wc -l подсчет совпадений сток в файле
grep 1 netology.md | wc -l подсчет сколько раз втречается 1 в файле
аналог wc -l для grep это ключик -с(count)
grep 1 netology.md -c

3.PID 1 присвоен процессу systemd — подсистема инициализации и управления службами
4.ls % 2>/dev/pts/1 

5.cat < file.txt > new_file.txt

6.можно вывести ответ команды ls -l > /dev/tty3 просмотреть результат можно переключившись на соответвующий tty

7.23:16@tgit:bash 5>&1 # открыли дискриптор 5 передали его поток в stdout 
  23:16@tgit:echo netology > /proc/$$/fd/5 # вывели stdout поток из 5 дискриптора
  netology
  23:17@tgit:exec 5>&- # закрыли дискриптор
  23:17@tgit:echo netology > /proc/$$/fd/5 #получили ошибку 
  bash: /proc/15350/fd/5: No such file or directory

8.vagrant@vagrant:~$ ls -wz 3>&2 2>&1 1>&3 | cat > file.txt
  vagrant@vagrant:~$ cat file.txt
  ls: invalid line width: ‘z’

9.в данном файле хранятся переменные среды процеса
можно вызвать внешную команду printenv 

10. /proc/30636/cmdline исполняемый файл с заданам PID
     /proc/30636/exe  ссылка на исполняемый файл

11.sse4_2

12. При подключению к терминалу по ssh не выделяется TTY 

13. для работы перехваченного процема в новом терминале пришлось поменять /proc/sys/kernel/yama/ptrace_scope в занчение 0
далее запускаем в одно терминале испольняемый файл через команду ps aux | grep имя программы находим PID и переходим в новый терминал и перехватываем процес reptyr PID


14. tee читает из стандартного ввода и записывает как в стандартный вывод

Задание 3.3

1. chdir("/tmp")

2. stat("/home/tgit/.magic.mgc", 0x7ffc233a97a0) = -1 ENOENT (No such file or directory)
   stat("/home/tgit/.magic", 0x7ffc233a97a0) = -1 ENOENT (No such file or directory)
   openat(AT_FDCWD, "/etc/magic.mgc", O_RDONLY) = -1 ENOENT (No such file or directory)
   stat("/etc/magic", {st_mode=S_IFREG|0644, st_size=111, ...}) = 0
   openat(AT_FDCWD, "/etc/magic", O_RDONLY) = 3
   fstat(3, {st_mode=S_IFREG|0644, st_size=111, ...}) = 0
   read(3, "# Magic local data for file(1) c"..., 4096) = 111
   read(3, "", 4096)

3. т.к мы знаем pid запущенного процесса можно сделать kill по этому процессу
 
4. зомби процессы не используют системные ресурсы

5. root@vagrant:~# /usr/sbin/opensnoop-bpfcc
   PID    COMM               FD ERR PATH
   868    vminfo              4   0 /var/run/utmp
   647    dbus-daemon        -1   2 /usr/local/share/dbus-1/system-services
   647    dbus-daemon        19   0 /usr/share/dbus-1/system-services
   647    dbus-daemon        -1   2 /lib/dbus-1/system-services
   647    dbus-daemon        19   0 /var/lib/snapd/dbus-1/system-services/
   657    irqbalance          6   0 /proc/interrupts
   657    irqbalance          6   0 /proc/stat

6. Part of the utsname information is also accessible  via  /proc/sys/ker‐
       nel/{ostype, hostname, osrelease, version, domainname}.

7. Команда test вычисляет код ответа на основе выражения, переданного через параметры командной строки.
   Конструкции могут быть записаны в несколько строк, или в одну с использованием разделителя ";".
   Последовательности команд. Возвращают код ответа последней выполненной команды.
   ; - оператор безусловного последовательного выполнения команд
   && оператор И. Правая часть не выполняется если левая выполнилась неуспешно
   set - Change the value of shell attributes and positional parameters, or
    display the names and values of shell variables. 
   -e Exit immediately if a command exits with a non-zero status.
   && совместно с set -e  команда выполниться т.к в случае успешного выполнения && оно равно 0 set -e не должен отработать

8.  -e  Exit immediately if a command exits with a non-zero status.
    -u  Treat unset variables as an error when substituting.
    -x  Print commands and their arguments as they are executed.
    -o pipefail состояние последней команды, которая должна выйти с ненулевым статусом, или ноль, если ни одна команда не вышла с ненулевым статусом.
    Хорошо подходит для отладки bash скриптов
9. S спящие процесы
   R действующие процесы
   I фоновые  процесы
 
 Задание 3.4
 
 1. После установки node_explorer на локал хосте машины в браузере открываются список метрик
    ![image](https://user-images.githubusercontent.com/40559167/154747441-71293b77-bde7-4c05-bbaa-b583ae54b170.png)



