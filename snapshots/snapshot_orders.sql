{% snapshot snapshot_orders %}
    {{
        config(
          target_database = 'dbt_db' ,
          target_schema='snapshot',
          strategy='check',
          unique_key='id',
          check_cols = 'all'
        )
    }}
    select * from {{ source('shipping_data', 'orders') }}
{% endsnapshot %}