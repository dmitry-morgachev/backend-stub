import os


CELERY_BROKER_URL = os.environ.get('BROKER_URL', 'amqp://user:password@rabbitmq:5672/my_vhost')
CELERY_IGNORE_RESULT = True
CELERY_ACCEPT_CONTENT = ['application/json']
CELERY_RESULT_SERIALIZER = 'json'
CELERY_TASK_SERIALIZER = 'json'
