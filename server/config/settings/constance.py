CONSTANCE_BACKEND = 'constance.backends.database.DatabaseBackend'
CONSTANCE_CONFIG = {
    'NOTIFICATION_FEEDBACK_EMAIL': (
        '',
        'Почтовый ящик для уведомлений с обратной связи',
        str
    ),
}

CONSTANCE_CONFIG_FIELDSETS = {
    'Настройки почтового ящика для уведомлений': (
        'NOTIFICATION_FEEDBACK_EMAIL',
    ),
}
