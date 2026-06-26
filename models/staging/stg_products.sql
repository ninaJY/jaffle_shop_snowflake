with source as (
    select * from {{ source('jaffle_shop', 'raw_products') }}
),

renamed as (
    select
        sku         as product_id,
        name        as product_name,
        price,
        type
    from source
)

select * from renamed