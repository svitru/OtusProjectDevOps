## Установка кластера GKE используя terraform
 - Переименовать terraform.tfvars.example в terraform.tfvars
 - Исправить в terraform.tfvars значения переменных для своего проекта
 - Выполнить инициализацию terraform в директории ```terraform init```
 - Проверить изменения ```terraform plan```
 - Применить изменения ```terraform apply```
 - Настроить kubectl на работу с контекстом ```gcloud container clusters get-credentials my-gke-cluster --zone europe-west4-c --project %имя проекта%```
 
