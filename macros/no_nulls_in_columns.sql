{% macro rename_segments(column_name) %}
  case 
    when {{column_name}} in ('HOUSEHOLD','BUILDING','AUTOMOBILE')
      then 'segment_1'
    else 'segment_2'
  end
{% endmacro %}