{{config(
        materialized='view',
        schema='BASE'
    )
}}

select 
    f.value:eightd_has_available_keys as eightd_has_available_keys ,
    f.value:is_installed as is_installed ,
    f.value:is_renting as is_renting,
    f.value:is_returning as is_returnings,
    f.value:last_reported::timestamp as last_reported ,
    f.value:legacy_id as legacy_id ,
    f.value:num_bikes_available as num_bikes_available,
    f.value:num_bikes_disabled as num_bikes_disabled,
    f.value:num_docks_available as num_docks_available,
    f.value:num_docks_disabled as num_docks_disabled,
    f.value:num_ebikes_available as num_ebikes_available,
    f.value:station_id as station_id,
    f.value:station_status as station_status
from {{ source('station', 'station_status') }}, table(flatten(V:data:stations)) f

