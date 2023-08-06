# Домашнее задание к занятию «Установка Kubernetes» #

## Задание 1. Установить кластер k8s с 1 master node ##

Сначала попробовал установить через kubeadm 

![img.png](img.png)

![img_1.png](img_1.png)

![img_2.png](img_2.png)

![img_3.png](img_3.png)

![img_4.png](img_4.png)

![img_5.png](img_5.png)

Но добиться того, чтобы worker'ы стали Ready, не удалось. На мастере также служба kubelet постоянно отваливается (connection refused). 
В общем, ситуация примерно такая же, как была на лекции, поэтому попробовал также через kubespray


![img_7.png](img_7.png)

![img_8.png](img_8.png)

![img_9.png](img_9.png)

![img_10.png](img_10.png)

![img_12.png](img_12.png)

![img_13.png](img_13.png)



