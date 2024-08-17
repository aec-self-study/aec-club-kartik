{% test email_format(model, column_name) %}
    SELECT *
    FROM {{model}}
    WHERE NOT regexp_contains({{column_name}}, r'@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+')
{% endtest %}