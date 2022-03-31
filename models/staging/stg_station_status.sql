{{config(
        materialized='view',
        schema='BASE'
    )
}}

select f.value
from {{ source('station', 'station_status') }}, lateral flatten(input => V:data) f

