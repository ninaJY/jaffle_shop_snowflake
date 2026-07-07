-- verify slim ci only runs modified model and downstream

with source as (
    select * from {{ source('jaffle_shop', 'raw_orders') }}
),

renamed as (
    select
        id              as order_id,
        customer        as customer_id,
        ordered_at      as order_date,
        store_id,
        subtotal,
        tax_paid,
        order_total
    from source
)

select * from renamed