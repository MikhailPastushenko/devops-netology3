# Домашнее задание к занятию «Troubleshooting» #

## Задание 1. При деплое приложение web-consumer не может подключиться к auth-db. Необходимо это исправить ##

#### 1. Установить приложение по команде ####

 ```kubectl apply -f https://raw.githubusercontent.com/netology-code/kuber-homeworks/main/3.5/files/task.yaml```

![img.png](img.png)

Отсутствуют неймспейсы web и data, указанные в манифесте. Создаём их 

![img_1.png](img_1.png)

#### 2. Выявить проблему и описать. ####

Проверяем, поднялись ли поды

![img_2.png](img_2.png)

Поднялись

Проверяем подключение 

![img_3.png](img_3.png)

Смотрим логи пода 

![img_4.png](img_4.png)

в логах ошибка разрешения имени сервиса, так как указано неполное имя. По полному имени подключение есть

![img_5.png](img_5.png)

#### 3. Исправить проблему, описать, что сделано. ####

Указываем полное имя сервиса в описании деплоймента

![img_6.png](img_6.png)

#### 4. Продемонстрировать, что проблема решена. ####

Смотрим логи пода - ошибок больше нет

![img_7.png](img_7.png)




