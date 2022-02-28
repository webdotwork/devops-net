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

3. отправим файл в dev/null

cat /dev/null > /proc/PID/fd/номер дискриптора
 
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
    
    создал пользователя 
    sudo useradd node_exporter -s /sbin/nologin
    
    в каталоге /etc/systemd/system/node_exporter.service создал unit файл
    
    [Unit]
    
    Description=Node Exporter
    
    [Service]
    
    User=node_exporter
    
    EnvironmentFile=/etc/sysconfig/node_exporter
    
    ExecStart=/usr/sbin/node_exporter $OPTIONS
    
    [Install]
    
    WantedBy=multi-user.target
    
    создал файл с опциями
    
    sudo mkdir -p /etc/sysconfig
    
    sudo touch /etc/sysconfig/node_exporter
    
    cat /etc/sysconfig/node_exporter
    
    OPTIONS="--collector.textfile.directory /var/lib/node_exporter/textfile_collector" 
    
    после перзагрузки демона работают команды
    
    sudo systemctl stop node_exporter
    
    sudo systemctl start node_exporter
    
    после ребута системы service запускается автоматом

 2. #node cpu seconds total counter
 
    #node disk info
    
    #node disk read time seconds counter
    
    #node disk write time  seconds counter
    
    #node filesystem avail bytes
    
    #node memory MemTotal bytes
    
    #node memory MemFree bytes
    
    #node network receive bytes total
    
    #node network transmit bytes total
    
 3. ![image](https://user-images.githubusercontent.com/40559167/154756621-86673a8c-5192-4c53-84c7-bccafc8d2401.png)

 4. да можно грепнуть по virt*
 
    dmesg |grep virt*
    
    [    0.126100] Booting paravirtualized kernel on VMware hypervisor
    
    [    1.763145]   with environment:
    
    [    2.152630] VMware vmxnet3 virtual NIC driver - version 1.5.0.0-k-NAPI
    
    [    6.149708] systemd[1]: Detected virtualization vmware.
    
  
 5. nr_open - жесткий лимит на открытые дескрипторы
    file-nr - показывает выделенные дескрипторы
    исполняемый file: /proc/sys/fs/nr_open
    переменная окружения variable: fs.nr_open
    ulimit -a мягкий лимит
    ulimit -aH жесткий лимит
    /sbin/sysctl fs.nr_open показывает что в ситсеме выделено fs.nr_open = 1048576
    максимальный размер cat /proc/sys/fs/file-max
    
 6. ![image](https://user-images.githubusercontent.com/40559167/154845101-a5580165-108e-4c14-894f-7b74b00a2ea1.png)

 
    
 7. :(){ :|: & };: - функция форк

    В этой короткой строке определена функция командной оболочки, которая создает свои собственные копии. Процесс постоянно воспроизводит       себя, и его копии постоянно размножаться, быстро занимая все свое процессорное время и всю память. Это может привести к остановке           компьютера. Это, в большей степени, атака вида denial-of-service (отказ в обслуживании). 
    
   задать кол во процессов можно ulimit -u
   
   
 Задание 3.5
 
 1. Sparse - это компьютерный программный инструмент, предназначенный для поиска возможных ошибок кодирования в ядре Linux
    Разреженные – это специальные файлы, которые с большей эффективностью используют файловую систему, они не позволяют ФС занимать         свободное дисковое пространство носителя, когда разделы не заполнены. То есть, «пустое место» будет задействовано только при             необходимости. Пустая информация в виде нулей, будет хранится в блоке метаданных ФС. Поэтому, разреженные файлы изначально занимают     меньший объем носителя, чем их реальный объем.
    
    ![image](https://user-images.githubusercontent.com/40559167/154852449-8ce48efd-2003-4b6a-9e02-b5a47d192b74.png)

    ls -l file Просмотр логического размера файла
    du -c file Проверить, сколько блоков памяти фактически занимает файл.
    od -c file Просмотр содержимого файлового хранилища
    
  2. 19:19@tgit:touch file
  
     19:20@tgit:ln file FILE
     
     19:20@tgit:ls -ilH
     
total 88
4980789 drwxr-xr-x 6 tgit tgit  4096 фев 19 02:15  Desktop

4980793 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Documents

4980790 drwxr-xr-x 2 tgit tgit  4096 янв 31 21:56  Downloads

4984305 -rw-rw-r-- 2 tgit tgit     0 фев 20 19:20  file

4984305 -rw-rw-r-- 2 tgit tgit     0 фев 20 19:20  FILE

4980794 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Music

4984234 -rwxrwxr-x 1 tgit tgit    48 фев 10 22:40  new

4980795 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Pictures

4980792 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Public

4980791 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Templates

4984236 -rw-rw-r-- 1 tgit tgit 42721 фев 17 23:22  trace1.log

4980796 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Videos


4984094 drwx------ 3 tgit tgit  4096 фев 18 21:16 'VirtualBox VMs'

    19:20@tgit:chmod g-w FILE
    
    19:22@tgit:ls -ilH
    
total 88
4980789 drwxr-xr-x 6 tgit tgit  4096 фев 19 02:15  Desktop

4980793 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Documents

4980790 drwxr-xr-x 2 tgit tgit  4096 янв 31 21:56  Downloads

4984305 -rw-r--r-- 2 tgit tgit     0 фев 20 19:20  file

4984305 -rw-r--r-- 2 tgit tgit     0 фев 20 19:20  FILE

4980794 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Music

4984234 -rwxrwxr-x 1 tgit tgit    48 фев 10 22:40  new

4980795 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Pictures

4980792 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Public

4980791 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Templates

4984236 -rw-rw-r-- 1 tgit tgit 42721 фев 17 23:22  trace1.log

4980796 drwxr-xr-x 2 tgit tgit  4096 янв 17 20:40  Videos

4984094 drwx------ 3 tgit tgit  4096 фев 18 21:16 'VirtualBox VMs'

при смене прав у одного файла меняются права и у другого т.к ссылка жесткая

![image](https://user-images.githubusercontent.com/40559167/154852865-f120319c-f78e-409f-99a5-6bf23c11ef0d.png)

3. vagrant@vagrant:~$ lsblk

NAME                      MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT

loop0                       7:0    0 55.4M  1 loop /snap/core18/2128

loop2                       7:2    0 70.3M  1 loop /snap/lxd/21029

loop3                       7:3    0 43.6M  1 loop /snap/snapd/14978

loop4                       7:4    0 55.5M  1 loop /snap/core18/2284

loop5                       7:5    0 61.9M  1 loop /snap/core20/1328

loop6                       7:6    0 67.2M  1 loop /snap/lxd/21835

sda                         8:0    0   64G  0 disk
├─sda1                      8:1    0    1M  0 part
├─sda2                      8:2    0    1G  0 part /boot
└─sda3                      8:3    0   63G  0 part
  └─ubuntu--vg-ubuntu--lv 253:0    0 31.5G  0 lvm  /
sdb                         8:16   0  2.5G  0 disk
sdc                         8:32   0  2.5G  0 disk

4. fdisk /dev/sdb
   
   Device     Boot   Start     End Sectors  Size Id Type
   /dev/sdb1          2048 4196351 4194304    2G 83 Linux
   /dev/sdb2       4196352 5242879 1046528  511M 83 Linux
   
 5. sudo sfdisk -d /dev/sdb | sfdisk /dev/sdc
   Device     Boot   Start     End Sectors  Size Id Type
   /dev/sdc1          2048 4196351 4194304    2G 83 Linux
   /dev/sdc2       4196352 5242879 1046528  511M 83 Linux
   
 6. sudo mdadm --create --verbose /dev/md1 -l 1 -n 2 /dev/sd{b1,c1}
    ![image](https://user-images.githubusercontent.com/40559167/155005929-39bec2c7-1db5-45a9-b689-7c12f3abc54f.png)

 7. sudo mdadm --create --verbose /dev/md0 -l 0 -n 2 /dev/sd{b2,c2}
    ![image](https://user-images.githubusercontent.com/40559167/155006776-0a7ea8b0-9d35-44d2-9d17-0b3ae5162510.png)

8. vagrant@vagrant:~$ sudo pvcreate /dev/md1

  Physical volume "/dev/md1" successfully created.
  
  vagrant@vagrant:~$ sudo pvcreate /dev/md0
  
  Physical volume "/dev/md0" successfully created.
  
  vagrant@vagrant:~$ sudo pvscan
  
  PV /dev/sda3   VG ubuntu-vg       lvm2 [<63.00 GiB / <31.50 GiB free]
  PV /dev/md0                       lvm2 [1018.00 MiB]
  PV /dev/md1                       lvm2 [<2.00 GiB]
  Total: 3 [<65.99 GiB] / in use: 1 [<63.00 GiB] / in no VG: 2 [2.99 GiB]
  ![image](https://user-images.githubusercontent.com/40559167/155027396-c8f9ea27-7693-4ab9-aa76-39bfa4691c9a.png)

 9.  sudo vgcreate volume-group /dev/md1 /dev/md0
 
     sudo vgdisplay 
     
     sudo vgs
     
     ![image](https://user-images.githubusercontent.com/40559167/155319682-4a9001b8-9077-4ec7-b579-f10bce374c8f.png)

10. sudo lvcreate -n LVRAID0 -L 100M volume-group /dev/md0
    
    sudo lvs
    
    ![image](https://user-images.githubusercontent.com/40559167/155320019-976671e2-00bc-4cf3-b907-a97ceabde80e.png)
    
 11. mkfs.ext4 /dev/volume-group/LVRAID0
 
     fsck -N /dev/volume-group/LVRAID0
     
     ![image](https://user-images.githubusercontent.com/40559167/155321123-2b9a790e-e79b-41a1-8df9-1a0233d19c1a.png)

     ![image](https://user-images.githubusercontent.com/40559167/155321074-36570a39-0189-4a75-a368-bef584642ebe.png)

12.  sudo wget https://mirror.yandex.ru/ubuntu/ls-lR.gz -O /tmp/new/test.gz

     ![image](https://user-images.githubusercontent.com/40559167/155322164-3db0ef68-df4a-4343-8505-7c9b4cfe7a4a.png)

 


14. ![image](https://user-images.githubusercontent.com/40559167/155322249-24b6ab1b-8b35-43cb-ac17-3f4c5b8f2713.png)

15. gzip -t /tmp/new/test.gz | echo $?
    0
   ![image](https://user-images.githubusercontent.com/40559167/155325145-289db541-f563-405d-8949-eb4cf86ae016.png)

16. sudo pvmove -b /dev/md0 /dev/md1
    ![image](https://user-images.githubusercontent.com/40559167/155325313-b0ab7d45-d70f-4f30-a915-9516ce92bf34.png)

    
 17.  sudo mdadm /dev/md1 --fail /dev/sdb1
    
 18. ![image](https://user-images.githubusercontent.com/40559167/155325950-556ab41c-2e08-4958-aba5-cc71f82b3c9b.png)


19.     gzip -t /tmp/new/test.gz | echo $?
        ![image](https://user-images.githubusercontent.com/40559167/155326188-04f1e8b0-cedd-4e46-b29f-af8baad1d775.png)

20. ![image](https://user-images.githubusercontent.com/40559167/155326968-e952ff29-ae5c-4f67-b21c-b4649194f08a.png)


  Задание 3.6
  
  1. 301 Moved Permanently - перенаправляет нас на location: https://stackoverflow.com/questions
    ![image](https://user-images.githubusercontent.com/40559167/155333767-62852782-e71e-4034-9071-000100de4760.png)  
    
  2.Request URL: https://stackoverflow.com/
    Request Method: GET
    Status Code: 200 
    Remote Address: 151.101.193.69:443
    Referrer Policy: no-referrer-when-downgrade
    
   ![image](https://user-images.githubusercontent.com/40559167/155341281-47070a30-3050-4967-81b1-2662abe57843.png)

  
  3. 2ip.ru
     1**.2**.1**.1**
  
  4. netname:        RU-RUSPHONE
  
  
  5. vagrant@vagrant:~$ traceroute -An 8.8.8.8
traceroute to 8.8.8.8 (8.8.8.8), 30 hops max, 60 byte packets

 1  10.0.2.2 [*]  0.492 ms  0.417 ms  0.372 ms
 2  10.0.40.1 [*]  0.341 ms  0.308 ms  0.294 ms
 3  *.4*.*.1* [AS**5]  0.591 ms  0.607 ms  0.926 ms
 4  *7.3*.*.2* [AS*1]  0.852 ms  0.867 ms  0.723 ms
 5  *.4*.*.4* [AS*9]  1.995 ms  2.006 ms  1.680 ms
 6  * * *
 7  ------------  2.507 ms 108.170.250.33 [AS300]  3.273 ms 108.170.250.129 [AS2222]  2.606 ms
 8  1--------3 [AS00000]  2.581 ms 108.170.250.83 [AS0000]  33.960 ms 108.170.250.146 [AS122229]  2.301 ms
 9  1-----------4 [AS222226]  17.471 ms * *
10  ---------4 [AS33388]  20.148 ms 2------0 [AS33339]  16.760 ms --------4 [AS33339]  28.452 ms
11  2----------9 [AS33339]  28.373 ms 2------3 [AS15169]  29.274 ms 2-------3 [AS3333]  28.648 ms
12  * * *
13  * * *
14  * * *
15  * * *
16  * * *
17  * * *
18  * * *
19  * * *
20  * * *
21  * 8.8.8.8 [AS----]  15.480 ms  14.208 ms
     
  
6. mtr -zn 8.8.8.8 большие задежки
  AS565674  2------------1
10. (waiting for reply)
11. (waiting for reply)
12. (waiting for reply)
13. (waiting for reply)
14. (waiting for reply)
15. (waiting for reply)
16. (waiting for reply)
17. (waiting for reply)
18. (waiting for reply)
19. AS15169  8.8.8.8

   7. dig +trace @8.8.8.8 gmail.com

   gmail.com.              300     IN      A       100.100.103.108
   
   dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
  

   8. dig -x 8.8.8.8

   ![image](https://user-images.githubusercontent.com/40559167/155595530-edffb29a-bb14-4f3d-b06c-ed188bbdca99.png)
   
   
   Задание 3.7
   
   1. ip a
      ls /sys/class/net
      cat /proc/net/dev
      ![image](https://user-images.githubusercontent.com/40559167/155804609-6d7b30a7-d7f1-4022-b922-8a1692ac6f98.png)

   2. ip -4 neighbor show

   3. команда vconfig она позволяет  создавать и удалять устройства VLAN в ядре с поддержкой VLAN
      vconfig add eth0 5
      cat /proc/net/vlan/eth0.5
      
      командой ip 
      ip link add link eth0 name eth0.10 type vlan id 10
      ip -d link show eth0.10
    
    4. Bonding – это объединение сетевых интерфейсов по определенному типу агрегации, Служит для увеличения пропускной способности и/или отказоустойчивость сети.
        Mode-0(balance-rr) – Данный режим используется по умолчанию. 
	Balance-rr обеспечивается балансировку нагрузки и отказоустойчивость
	Mode-1(active-backup) – Один из интерфейсов работает в активном режиме, остальные в ожидающем
	Mode-2(balance-xor) – Передача пакетов распределяется по типу входящего и исходящего трафика по формуле ((MAC src) XOR (MAC dest)) % число интерфейсов. 
	ode-3(broadcast) – Происходит передача во все объединенные интерфейсы, тем самым обеспечивая отказоустойчивость. Рекомендуется только для использования MULTICAST               трафика.
	Mode-4(802.3ad) – динамическое объединение одинаковых портов. В данном режиме можно значительно увеличить пропускную способность входящего так и исходящего трафика. 
	Mode-5(balance-tlb) – Адаптивная балансировки нагрузки трафика. Входящий трафик получается только активным интерфейсом, исходящий распределяется в зависимости от               текущей загрузки канала каждого интерфейса. 
	Mode-6(balance-alb) – Адаптивная балансировка нагрузки. Отличается более совершенным алгоритмом балансировки нагрузки чем Mode-5).
        $ sudo modprobe bonding
	$ sudo ip link add bond0 type bond mode 802.3ad
        $ sudo ip link set eth0 master bond0
        $ sudo ip link set eth1 master bond0
	nano /etc/network/interfaces
	$ sudo nano /etc/network/interfaces
        # The primary network interface
        auto bond0
        iface bond0 inet static
        address 192.168.1.150
        netmask 255.255.255.0    
        gateway 192.168.1.1
        dns-nameservers 192.168.1.1 8.8.8.8
        dns-search domain.local
        slaves eth0 eth1
        bond_mode 0
        bond-miimon 100
        bond_downdelay 200
        bound_updelay 200
	$ sudo systemctl restart networking.service
    
    
    5. в сети с маской /29 - 8 адресов
       в подсети с маской /24 помещается 32 подсети с /29 маской
       10.10.10.0/24
       10.10.10.1-6/29
       10.10.10.7-12/29
       
    6. 100.64.0.0 — 100.127.255.255 (маска подсети 255.192.0.0 или /10)
       100.64.40.0/26
       100.64.40.1	
       100.64.40.62
       
       
    7. arp -a
       arp -d 192.168.1.1 - удалить из таблицы ARP запись для IP-адреса 192.168.1.1

       arp -d 192.168.1.* - удалить из таблицы ARP записи для диапазона IP-адресов 192.168.1.1 - 192.168.1.254

       arp -d 192.168.1.1 192.168.1.56 удаление записи из таблицы ARP для IP-адреса 192.168.1.1 на сетевом интерфейсе 192.168.1.56

       arp -d * - полная очистка таблицы ARP. Аналогично - arp -d без параметров. Если имеется несколько сетевых интерфейсов, то очистка может быть выполнена только для одного        из них - arp -d * 192.168.0.56.

  Задание 3.8
      telnet route-views.routeviews.org      
      Username: rviews      
      show ip route 89.20.43.177
      ![image](https://user-images.githubusercontent.com/40559167/156033305-dedb7666-75c8-4aa5-8586-d0c7aed4f079.png)
      
      show bgp 89.20.43.177
      ![image](https://user-images.githubusercontent.com/40559167/156033536-578eabf8-d37d-4544-bceb-02c3fa73c1a6.png)

      
