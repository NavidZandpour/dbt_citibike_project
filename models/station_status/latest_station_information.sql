{{config(
        materialized='table',
        schema='MART'
    )
}}


with station_information as  (
    select * from {{ ref('stg_station_information' )}}
),

latest_station_status as (
    select *
    from {{ ref('latest_station_status') }}
   
),

final as (

    select 
    eightd_has_available_keys ,
    is_installed ,
    is_renting,
    is_returnings,
    last_reported ,
    num_bikes_available,
    num_bikes_disabled,
    num_docks_available,
    num_docks_disabled,
    num_ebikes_available,
    station_status,
    capacity ,
    eightd_has_key_dispenser,
    eightd_station_services,
    electric_bike_surcharge_waiver,
    external_id,
    has_kiosk,
    lat,
    lon,
    name,
    region_id,
    rental_methods,
    rental_uris,
    short_name,
    s.station_id,
    station_type

    from latest_station_status s
    left join station_information i
    on s.station_id = i.station_id
)

select * from final