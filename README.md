# Microservices Node stack

Complete environment for Docker and Docker Compose container development for services initialization abstraction.

It also has the functionality of including shortcuts in **bash**(terminal command interpreter) to facilitate the
execution of commands present in the containers, directly in the terminal of the host. This allows you to perform some
commands like **npm, mongo, etc.** transparently and out of the container.

## Funcionality

Services and Tools:

 * Nginx
 * MongoDB
 * OpenResty
 * Nodejs
   * gulp
   * bower
   * npm

## Requirements

 * Docker >= 1.12
 * Docker Compose >= 1.9

Example for instalation Docker and Docker Compose in Ubuntu:

```
$ sudo curl -sSL https://get.docker.com | sh

$ sudo curl -L "https://github.com/docker/compose/releases/download/1.9.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
$ sudo chmod +x /usr/local/bin/docker-compose
```

## Utilization

Copy the file **.env.example** to **.env** and update variables.

| Variable                 | Description              |
|:------------------------ |:------------------------ |
| MONGO_DATA               | Path for MongDB data |
| NGINX_HOSTS_CONF         | Path config nginx virtual hosts(sites) |
| WWW_DATA                 | Document root path your web application |
| OPENRESTY_NGINX_CONF     | Path for configuration openresty nginx |
| NODE_SERVICES_ENTRYPOINT | Node service entrypoint configuration file |
| JWT_SECRET               | Your JWT secret for authorization |

Important: The **.env.example** file is for example only and should not be edited.

## TODO

 * Update manual and README

## CREDITS

 * Thank you @alhaag - André Luiz Haag - This project is based on the [docker-dev-stack](https://github.com/alhaag/docker-dev-stack) project