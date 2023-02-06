{% snapshot orders_hard_delete %}

    {{
        config(
          tags=["sp2"],
          target_database='dbt_db',
          target_schema='snapshot',
          unique_key='id',
          strategy='timestamp',
          updated_at='updated_at',
          invalidate_hard_deletes=True,
        )
    }}

    select * from {{ source('SHIPPING_DATA', 'src_cust_orders') }}

{% endsnapshot %}