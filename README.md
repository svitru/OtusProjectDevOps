# Проект по курсу "DevOps практики и инструменты"

Этапы работ, которые удалось успеть воплотить:
 - [x] Создание тестового окружения средствами Terraform: написан манифест для получения интсанса в GCP с провижинерами установки docker, docker-compose
 - [x] Получение исходников микросервисного приложения, обзор кода
 - [x] Написание Dockerfile'ов, создание образов контейнеров
 - [x] Написание docker-compose.yml для запуска микросервисного приложения в тестовой среде GCP. 
 - [x] Тестирование запуска приложения, БД и очереди сообщений и их взаимодействия. Всё ок.
 - [x] Создание ресурсов кластера k8s средствами Terraform
 - [x] Написание chart'ов приложение
 - [x] Деплой приложения в среде k8s средствами helm
 - [ ] Подключение мониторинга Prometheus к метрикам приложения

Что предстоит осуществить:
 - [ ] Создание среды GitLab, перенос репозитория, настройка среды
 - [ ] Настроить процесс CI/CD для билда изменений приложения, тестирования и деплоя приложения в рабочей среде
 
## Запуск приложения в тестовой среде:
 - Предварительно сгенерировать пару из приватного и публичного ключей
 - Открыть в GCP файрволе SSH и 8001 порты (впоследствии добавятся в ресурсы terraform)
 - Создание среды командами **terraform** из директории infra/terraform/docker/:
   - На основании terraform.tfvars.example создать файл terraform.tfvars и задать значения переменных проекта GCP и пути к ключам
   - ```terraform init```
   - ```terraform plan```
   - ```terraform apply```
 - Залогинившись на инстансе получить репозиторий (на текущий момент неавтоматизировано)
 - Переименовать src/.env.example в src/.env и задать значения переменных
 - Выполнить из директории src (впоследствии вынесется в отдельную директорию):
   - ```docker-compose up -d```
 - Открыть в браузере <http://EXT-IP:8001>, где EXT-IP - внешний адрес инстанса GCP

## Запуск приложения в среде kubernetes:
 - Из директории infra/terraform/gke-cluster/ установить среду kubernetes:
   - На основании terraform.tfvars.example создать файл terraform.tfvars и задать значения переменных проекта GCP
   - Произвести инициализацию **terraform**: ```terraform init```
   - Проанализировать изменения применяемых terraform'ом: ```terraform plan```
   - Создать кластер: ```terraform apply```
 - Подключить кластер в качестве основного контекста **kubectl**: ```gcloud container clusters get-credentials my-gke-cluster --zone europe-west4-c --project %имя проекта%```
 - Установить приложение в кластер из директории kubernetes/charts/:
   - Произвести инициализацию **helm** установив серверную часть **tiller**: ```helm init```
   - Установить приложение: ```helm install app/ --name app-1```
 - Дождаться выдачу внешнего ip-адреса балансировщику searcher: ```kubectl get svc app-1-searcher```
 - Открыть в браузере <http://EXT-IP:8000>, где EXT-IP - внешний адрес присвоенный балансировщику

## Changelog:
 - Создание репозитория
 - Создание манифестов terraform для тестовой среды GCP
 - Добавление провижинеров в манифест для установки docker, docker-compose в тестовой среде
 - Создание docker-compose.yml файла с mongo и rabbitmq
 - Вставка искодных кодов приложения searcher_crawler в репозиторий
 - Создание Dockerfile для приложения searcher_crawler
 - Вставка искодных кодов приложения ui в репозиторий
 - Создание Dockerfile для приложения ui
 - Запуск контейнеров приложений в docker-compose
 - Параметризация приложений в docker-compose.yml
 - Добавление инфраструктуры GKE средствами terraform
 - Добавление описание использования инструмента IaC - terraform
 - Создание chart'ов приложения в kubernetes/
 - Запуск приложения через ```helm install```
 - Добавление chart'а Prometheus'а, настройка метрик
 - Статический IP для балансировщика nginx
 - Развёртывание Gitlab из Helm chart'а, настройка проекта
