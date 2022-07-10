# Самоконтроль выполненения задания

1. Где расположен файл с `some_fact` из второго пункта задания?
Файл расположен:
group_vars/all/example.yml

2. Какая команда нужна для запуска вашего `playbook` на окружении `test.yml`?
Команда для запуска playbook на окружении test.yml:
sudo ansible-playbook site.yml -i inventory/prod.yml

3. Какой командой можно зашифровать файл?
Зашифровать файл можно командой:
ansible-vault encrypt file_name

4. Какой командой можно расшифровать файл?
Расшифровать файл можно коммнадой:
ansible-vault decrypt file_name

5. Можно ли посмотреть содержимое зашифрованного файла без команды расшифровки файла? Если можно, то как?
Для просмотра зашифрованного файла можно использовать команду:
ansible-vault view file_name

6. Как выглядит команда запуска `playbook`, если переменные зашифрованы?
Для запуска playbook с зашифрованными данными используем ключ --ask-vault-pass:
sudo ansible-playbook site.yml -i inventory/prod.yml --ask-vault-pass

7. Как называется модуль подключения к host на windows?
Модуль подключения к хост на виндовс:
winrm

8. Приведите полный текст команды для поиска информации в документации ansible для модуля подключений ssh:
ansible-doc -t connection ssh

9. Какой параметр из модуля подключения `ssh` необходим для того, чтобы определить пользователя, под которым необходимо совершать подключение?
- remote_user
        User name with which to login to the remote server, normally set by the remote_user keyword.
        If no user is supplied, Ansible will let the SSH client binary choose the user as it normally.
        