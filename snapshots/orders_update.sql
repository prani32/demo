{% snapshot snapshot_orders_update %}

{{
    config(
      tags=["sp3"],
      target_database='dbt_db',
      target_schema='snapshot',
      unique_key='id',
      strategy='timestamp',
      updated_at='updated_at'
    )
}}

select * from {{ source('SHIPPING_DATA', 'src_cust_orders') }}

{% endsnapshot %}