# Домашнее задание к занятию «Организация сети» #

## Задание 1. Yandex Cloud ##

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.

 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.
3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.


### Решение ###

Устанавливаем и настраиваем утилиту yc

![img.png](img.png)

![img_1.png](img_1.png)


Устанавливаем и настраиваем terraform

![img_2.png](img_2.png)

Создаём переменные и описываем их в файле variables.tf  https://github.com/MikhailPastushenko/devops-netology3/blob/main/15.1/variables.tf

![img_4.png](img_4.png)

Описываем провайдер yandex в файле provider.tf https://github.com/MikhailPastushenko/devops-netology3/blob/main/15.1/provider.tf

![img_5.png](img_5.png)

![img_6.png](img_6.png)

В файле main.tf описываем ресурсы https://github.com/MikhailPastushenko/devops-netology3/blob/main/15.1/main.tf

![img_7.png](img_7.png)

Результат `terraform plan`

![img_8.png](img_8.png)

Результат `terraform apply`

![img_9.png](img_9.png)

Созданные ресурсы

![img_10.png](img_10.png)

![img_3.png](img_3.png)

Подключаемся к ВМ с публичным IP и проверяем наличие интернета 

![img_11.png](img_11.png)

Подключаемся к ВМ с внутренним IP и проверяем наличие интернета 

![img_14.png](img_14.png)









