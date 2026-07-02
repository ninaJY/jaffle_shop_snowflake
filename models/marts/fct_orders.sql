{{
    config(
        materialized='incremental',
        unique_key='order_id'
    )
}}

with int_orders as (
    select * from {{ ref('int_orders_joined') }}

    {% if is_incremental() %}
        where order_date > (select max(order_date) from {{ this }})
    {% endif %}
)

select * from int_orders