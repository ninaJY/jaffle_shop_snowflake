with date_spine as (

    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2020-01-01' as date)",
        end_date="cast('2030-12-31' as date)"
    ) }}

),

renamed as (

    select
        date_day as date_day,
        extract(year from date_day) as year,
        extract(month from date_day) as month,
        extract(day from date_day) as day,
        extract(quarter from date_day) as quarter,
        extract(dayofweek from date_day) as day_of_week,
        {{ is_weekend('extract(dayofweek from date_day)') }} as is_weekend,
        to_char(date_day, 'Day') as day_name,
        to_char(date_day, 'Month') as month_name

    from date_spine

)

select * from renamed
