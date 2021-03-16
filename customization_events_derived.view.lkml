view: customization_events_derived {
  derived_table: {
    sql: with orderrank as(
select subscription_id, id order_id, DATE(orders.created_at) created_at
,row_number() over(partition by subscription_id order by DATE(orders.created_at) ) order_rank
from heroku_postgres.orders
where status= 3
group by subscription_id, id, created_at)
,cust as(
select created_at, name, subscription_id, json_extract_path_text(data, 'order_id') order_id, json_extract_path_text(data, 'ship_week') ship_week
from heroku_postgres.events
where name = 'meals_swapped')
select a.*, b.order_rank
from cust a
join orderrank b on b.subscription_id=a.subscription_id and b.order_id=a.order_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    timeframes: [time, date, week, month, day_of_week]
    sql: ${TABLE}.created_at ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: ship_week {
    type: date
    sql: ${TABLE}.ship_week ;;
  }

  dimension: order_rank {
    type: number
    sql: ${TABLE}.order_rank ;;
  }
  set: detail {
    fields: [created_at_time, name, subscription_id, order_id, ship_week, order_rank]
  }
}
