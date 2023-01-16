{% snapshot orders_snapshot_check %}
    {{
        config(
          target_database = 'dbt_db' ,
          target_schema='dbt_schema',
          strategy='check',
          unique_key='id',
          check_cols = 'all'
        )
    }}
    select * from {{ source('shipping_data', 'orders') }}
{% endsnapshot %}