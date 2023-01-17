{% snapshot orders_snapshot %}

{{
    config(
      target_database='dbt_db',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='updated_at',
    )
}}

select * from {{ source('shipping_data', 'dim_orders') }}

{% endsnapshot %}