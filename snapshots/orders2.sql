{% snapshot snapshot_orders_update %}

{{
    config(
      target_database='dbt_db',
      target_schema='snapshot',
      unique_key='id',

      strategy='timestamp',
      updated_at='order_date',
    )
}}

select * from {{ source('shipping_data', 'orders') }}

{% endsnapshot %}