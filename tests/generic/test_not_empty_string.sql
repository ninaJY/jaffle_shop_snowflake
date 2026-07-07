{% test not_empty_string(model, column_name) %}

select {{ column_name }}
from {{ model }}
where trim({{ column_name }}) = ''

{% endtest %}