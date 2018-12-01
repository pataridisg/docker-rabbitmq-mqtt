FROM rabbitmq:latest
RUN rabbitmq-plugins enable --offline rabbitmq_mqtt rabbitmq_management