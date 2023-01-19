{% macro ACK_COUNT(column_name) %}
select
    sum(CASE WHEN {{column_name}} = 'RE'   
                AND {{column_name}}= 'AC'
             THEN TRUE 
            ELSE false
        END )
   
{% endmacro %}
