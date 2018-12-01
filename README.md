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
