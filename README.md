# Azure DevOps and Automation

1. Вам необходимо получить список ресурсов из конкретной подписки либо ресурсной группы Azure.
Скрипт должен соответствовать следующим условиям:
  * Скрипт должен быть написан на Powershell
  * Должен иметься механизм выбора конкретной подписки либо ресурсной группы
  * Список ресурсов должен быть выведен в csv файл в формате resourceGroup/name/type/tagList
  * Необходима опция удаления ресурсов без тегов

2. Вам необходимо создать Powershell для добавления auto shutdown для виртуальных машин в конкретной ресурсной группе. Скрипт должен проверить включен ли auto shutdown для виртуальных машин и в случае отсутствия сконфигурировать его для автоматического выключения в 8 PM Eastern Time.

3. Вам необходимо зарегистрировать Azure DevOps проект и создать Self-Hosted Agent для деплоймента приложений и выполнения Terraform. 
  * Создайте Agent Pool My-AKS-Pool. 
  * Задеплойте агент AKS-Agent на Azure Kubernetes Service.
  * Агент должен билдить .NET Core приложений
  * Агент должен иметь возможность создавать ресурсы с помощью Terraform

4. Вам необходимо создать пайплайн для деплоймента .NET приложения с базой данных и создания необходимой для него инфраструктуры.(https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-dotnet-sqldatabase приложение и пример конфигурации можно найти в данной статье).
  * Инфраструктура должна быть создана с использованием Terraform/ ARM templates/ Bicep
  * Название ресурсов и ресурсных групп должны быть заданы переменными
  * Пайплайн должен быть написан на Yaml
  * Создание инфраструктуры, билд и деплоймент приложения необходимо выделить в отдельные stages
  * Каждый stage должен быть шаблонизирован
  * Любые чувствительные данные (Connection string для БД) должны быть скрыты с использованием переменных в самом Azure DevOps либо key vault.

5. Вам необходимо создать  YAML пайплайн для создания Azure Kubernetes Service кластера и деплоймента приложения (https://github.com/MicrosoftDocs/pipelines-javascript-docker)
  * Инфраструктура должна быть создана с использованием Powershell
  * Создание инфраструктуры, билд и деплоймент приложения необходимо выделить в отдельные stages
  * Каждый stage должен быть шаблонизирован
