# **Resolução desafio QA**

## Intalação

 - Pré-requisitos: ruby 2.4
 - gem install bundler
 - bundler install


## Ambiente de execução

 - Caso desejar é possível subir um servidor selenium local com um node chrome e um firefox
 - para isso é necessário docker e docker-compose instalados

 - na raíz do projeto executar: $ docker-compose up 
 - No arquivo ./config/config.yml alterar remote para true

## Execução

 - Utilizar comandos cucumber para executar o projeto
 - tags: @task_1, @task_2, @api, @app, @get