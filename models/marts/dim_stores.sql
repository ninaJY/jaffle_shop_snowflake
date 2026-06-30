select
    store_id,
    store_name,
    opened_at
from {{ ref('stg_stores') }}