{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

with orders as (
    select * from {{ ref('stg_orders') }}

    {% if is_incremental() %}
        where order_date > (select max(order_date) from {{ this }})
    {% endif %}
)

select
    order_id,
    customer_id,
    store_id,
    order_date,
    subtotal,
    tax_paid,
    order_total
from orders