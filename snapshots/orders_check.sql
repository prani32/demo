{% snapshot snapshot_orders %}
    {{
        config(
          target_database = 'dbt_db' ,
          target_schema='snapshot',
          strategy='check',
          unique_key='id',
          check_cols = 'all',
          invalidate_hard_deletes=False
        )
    }}
    select * from {{ source('shipping_data', 'SRC_ORDERS') }}
{% endsnapshot %}