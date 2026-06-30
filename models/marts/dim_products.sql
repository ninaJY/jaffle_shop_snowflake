select
    product_id,
    product_name,
    price,
    type
from {{ ref('stg_products') }}