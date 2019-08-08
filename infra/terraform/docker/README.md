## Установка инстанса GCP с docker-compose используя terraform
 - Переименовать terraform.tfvars.example в terraform.tfvars
 - Сгенерировать ключи для SSH ```ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser -P ""```
 - Исправить в terraform.tfvars значения переменных для своего проекта
 - Выполнить инициализацию terraform в директории ```terraform init```
 - Проверить изменения ```terraform plan```
 - Применить изменения ```terraform apply```
 
