## Установка инстанса GCP с docker-compose используя terraform
 - Сгенерировать ключи для SSH ```ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser -P ""```
 - Переименовать terraform.tfvars.example в terraform.tfvars
 - Исправить в terraform.tfvars значения переменных для своего проекта
 - Выполнить инициализацию terraform в директории ```terraform init```
 - Проверить изменения ```terraform plan```
 - Применить изменения ```terraform apply```
 - Для получения SSH-доступа добавляем ключи в ssh-agent:
   - ```eval $(ssh-agent)```
   - ```ssh-add ~/.ssh/appuser```
   - проверяем ```ssh-add -L```
 - Подключаемся ```ssh appuser@IP```, где IP - внешний ip-адрес, который можно узнать командой ```terraform show | grep nat_ip```
  
