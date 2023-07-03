{% macro ACK_COUNT(column_name) %}

    sum(CASE WHEN {{column_name}} = 'RE'   
                AND {{column_name}}= 'AC'
             THEN 1
            ELSE  0
        END )
   
{% endmacro %}
