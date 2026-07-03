{% snapshot orders_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='order_id',
        strategy='check',
        check_cols=['order_total', 'subtotal', 'tax_paid'],
    )
}}

select
    id              as order_id,
    customer        as customer_id,
    ordered_at      as order_date,
    store_id,
    subtotal,
    tax_paid,
    order_total
from {{ source('jaffle_shop', 'raw_orders') }}

{% endsnapshot %}