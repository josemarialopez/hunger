# hunger
Hunger app

## Requirements
* Docker
* Docker compose 

## Setup
* Execute `docker-compose build`
* Execute `docker-compose run hunger_restaurants_service rails db:seed`
* Introduce the following lines in the file `/etc/hosts`
  ```
  127.0.0.1  hungerapp.net
  127.0.0.1  www.hungerapp.net
  127.0.0.1  app.hungerapp.net
  127.0.0.1  api.hungerapp.net
  ```

## Execute
Execute `docker-compose up`
Now you should be able to access the website at 'http://www.hungerapp.net'
