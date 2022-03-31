{{config(
        materialized='table',
        schema='BASE'
    )
}}

select
f.value:capacity as capacity ,
f.value:eightd_has_key_dispenser as eightd_has_key_dispenser,
f.value:eightd_station_services as eightd_station_services,
f.value:electric_bike_surcharge_waiver as electric_bike_surcharge_waiver,
f.value:external_id as external_id,
f.value:has_kiosk as has_kiosk,
f.value:lat as lat,
f.value:legacy_id as legacy_id,
f.value:lon as lon,
f.value:name as name,
f.value:region_id as region_id,
f.value:rental_methods as rental_methods,
f.value:rental_uris as rental_uris,
f.value:short_name as short_name,
f.value:station_id as station_id,
f.value:station_type as station_type

from {{ source('station', 'station_information') }}, lateral flatten(input => V:data.stations) f

