{% snapshot snapshot_orders %}
    {{
        config(
          tags=["sp1"],
          target_database = 'dbt_db' ,
          target_schema='snapshot',
          strategy='check',
          unique_key='id',
          check_cols = 'all',
          invalidate_hard_deletes=False
        )
    }}
    select * from {{ source('SHIPPING_DATA', 'SRC_ORDERS') }}
{% endsnapshot %}