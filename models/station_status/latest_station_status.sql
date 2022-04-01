{{config(
        materialized='view',
        schema='MART'
    )
}}



select *
from {{ ref('stg_station_status') }}
qualify row_number() over (partition by station_id order by last_reported desc nulls last) = 1
