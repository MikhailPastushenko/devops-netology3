## Домашнее задание к занятию 10 «Jenkins» ##

### Подготовка к выполнению ###

#### 1. Создать два VM: для jenkins-master и jenkins-agent. ####

![img.png](img.png)

#### 2. Установить Jenkins при помощи playbook. ####

![img_1.png](img_1.png)

#### 3.Запустить и проверить работоспособность. ####

![img_2.png](img_2.png)

#### 4. Сделать первоначальную настройку. ####

![img_3.png](img_3.png)

![img_4.png](img_4.png)

### Основная часть ###

#### 1. Сделать Freestyle Job, который будет запускать molecule test из любого вашего репозитория с ролью. ####

![img_5.png](img_5.png)

Сама molecule не отрабатывает из за питоновских библиотек. Пробовал переустанавливать разные версии, но не удалось исправить к сожалению. Но к теме jenkins это непосредственного отношения не имеет :) 

#### 2. Сделать Declarative Pipeline Job, который будет запускать molecule test из любого вашего репозитория с ролью ####

![img_6.png](img_6.png)

![img_7.png](img_7.png)

#### 3. Перенести Declarative Pipeline в репозиторий в файл Jenkinsfile ####

![img_8.png](img_8.png)

#### 4. Создать Multibranch Pipeline на запуск Jenkinsfile из репозитория. ####

![img_9.png](img_9.png)

![img_10.png](img_10.png)

#### 5. Создать Scripted Pipeline, наполнить его скриптом из pipeline. ####

#### 6. Внести необходимые изменения, чтобы Pipeline запускал ansible-playbook без флагов --check --diff, если не установлен параметр при запуске джобы (prod_run = True). По умолчанию параметр имеет значение False и запускает прогон с флагами --check --diff. ####

#### 7. Проверить работоспособность, исправить ошибки, исправленный Pipeline вложить в репозиторий в файл ScriptedJenkinsfile ####

https://github.com/MikhailPastushenko/9.4/blob/main/Jenkinsfile

![img_11.png](img_11.png)
