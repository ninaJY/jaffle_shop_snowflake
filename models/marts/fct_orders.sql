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
),

customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        customers.customer_name,
        orders.order_date,
        orders.store_id,
        orders.subtotal,
        orders.tax_paid,
        orders.order_total
    from orders
    left join customers using (customer_id)
)

select * from final