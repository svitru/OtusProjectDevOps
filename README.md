# Проект по курсу "DevOps практики и инструменты"

Этапы работ, которые удалось успеть воплотить:
 - [x] Создание тестового окружения средствами Terraform: написан манифест для получения интсанса в GCP с провижинерами установки docker, docker-compose
 - [x] Получение исходников микросервисного приложения, обзор кода
 - [x] Написание Dockerfile'ов, создание образов контейнеров
 - [x] Написание docker-compose.yml для запуска микросервисного приложения в тестовой среде GCP. 
 - [x] Тестирование запуска приложения, БД и очереди сообщений и их взаимодействия. Всё ок.

Что предстоит осуществить:
 - [ ] Создание среды GitLab, перенос репозитория, настройка среды
 - [ ] Настроить процесс CI/CD для билда изменений приложения, тестирования и деплоя приложения в рабочей среде
 - [ ] Подключение логирования и мониторинга для получения обратной связи от приложения

## Запуск приложения в тестовой среде:
 - Предварительно сгенерировать пару из приватного и публичного ключей
 - Открыть в GCP файрволе SSH и 8001 порты (впоследствии добавятся в ресурсы terraform)
 - На основании terraform.tfvars.example создать файл значений переменных проекта GCP и пути у ключам
 - Создание среды командами **terraform** из директории infra/terraform:
   - ```terraform plan```
   - ```terraform apply```
 - Залогинившись на инстансе получить репозиторий (на текущий момент неавтоматизировано)
 - Выполнить из директории src (впоследствии вынесется в отдельную директорию):
   - ```docker-compose up -d```
 - Открыть в браузере <http://EXT-IP:8001>, где EXT-IP - внешний адрес инстанса GCP
 
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
