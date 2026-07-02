with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

stores as (
    select * from {{ ref('stg_stores') }}
),

final as (
    select
        orders.order_id,
        orders.customer_id,
        customers.customer_name,
        orders.store_id,
        stores.store_name,
        orders.order_date,
        orders.subtotal,
        orders.tax_paid,
        orders.order_total
    from orders
    left join customers using (customer_id)
    left join stores using (store_id)
)

select * from final