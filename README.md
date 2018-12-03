# Docker for RabbitMQ with MQTT and managment plugins enabled.

## Enabling Plugins

Creating a Dockerfile will have them enabled at runtime. To see the full list of plugins present on the image rabbitmq-plugins list

### Example
```
FROM rabbitmq:3.7-management
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_federation_management rabbitmq_stomp
```
You can also mount a file at `/etc/rabbitmq/enabled_plugins` with contents as an erlang list of atoms ending with a period.

Example enabled_plugins

`[rabbitmq_federation_management,rabbitmq_management,rabbitmq_mqtt,rabbitmq_stomp]`.

### Our Dockerfile 

```
FROM rabbitmq:latest
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_management
```

### How to build and run the docker container

Run this command to build (pull and enable plungins) the RabbitMQ messaging server ('<YOUR-NAME>/' is optional)
```
$ docker build -t <YOUR-NAME>/<YOUR-REPO> .
```

Run this command to run the container ('<YOUR-NAME>/' is optional)
```
$ docker run -d -p 1883:1883 -p 15672:15672 --name rabbitmq -e RABBITMQ_DEFAULT_USER=<YOUR-USERNAME> -e RABBITMQ_DEFAULT_PASS=<YOUR-PASSWORD>  -v rabbitmq_data:/var/lib/rabbitmq <YOUR-NAME>/<YOUR-REPO>
```

### Example
Build command:
```
$ docker build -t pataridis/rabbitmq-mqtt .
```
Run command:
```
$ docker run -d -p 1883:1883 -p 15672:15672 --name rabbitmq -e RABBITMQ_DEFAULT_USER=pataridis -e RABBITMQ_DEFAULT_PASS=password  -v rabbitmq_data:/var/lib/rabbitmq pataridis/rabbitmq-mqtt
```
