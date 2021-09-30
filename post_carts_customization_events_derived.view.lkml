view: post_cart_customization_events_derived {
  derived_table: {
    sql: with cartrank as(
      select user_id, id cart_id, DATE(carts.created_at) created_at
      ,row_number() over(partition by user_id order by DATE(carts.created_at) ) cart_rank
      from heroku_postgres.carts
      where fulfillment_status= 0
      group by user_id, id, created_at)
      ,cust as(
      select events.created_at, name, subscription_id, user_id
      ,json_extract_path_text(data, 'cart_id') cart_id
      ,json_extract_path_text(data, 'ship_week') ship_week
      ,json_extract_path_text(data, 'delivery_date') delivery_date
      from heroku_postgres.events
      join heroku_postgres.subscriptions on subscriptions.id=events.subscription_id
      where name = 'cart_meals_swapped')
      select a.*, b.cart_rank
      from cust a
      join cartrank b on b.user_id=a.user_id and b.cart_id=a.cart_id
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

  dimension_group: delivery {
    type: time
    timeframes: [time, date, week, month, day_of_week]
    hidden:  yes
    sql: ${TABLE}.delivery_date ;;
  }

  dimension: delivery_date_mon_start{
    type: date
    convert_tz: no
    hidden:  yes
    sql: case
    when ${delivery_day_of_week} = 'Sunday' THEN dateadd(d, 1, ${delivery_date})
    when ${delivery_day_of_week} = 'Monday' THEN ${delivery_date}
    when ${delivery_day_of_week} = 'Tuesday' THEN dateadd(d, -1, ${delivery_date})
    when ${delivery_day_of_week} = 'Wednesday' THEN dateadd(d, -2, ${delivery_date})
    when ${delivery_day_of_week} = 'Thursday' THEN dateadd(d, -3, ${delivery_date})
    when ${delivery_day_of_week} = 'Friday' THEN dateadd(d, -4, ${delivery_date})
    when ${delivery_day_of_week} = 'Saturday' THEN dateadd(d, -5, ${delivery_date})
    END;;
}
  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: cart_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.cart_id ;;
  }

  dimension: ship_week {
    type: date
    sql: coalesce(${TABLE}.ship_week, delivery_date_mon_start) ;;
  }

  dimension: cart_rank {
    type: number
    sql: ${TABLE}.cart_rank ;;
  }
  set: detail {
    fields: [created_at_time,delivery_date,delivery_date_mon_start, name, user_id, cart_id, ship_week, cart_rank]
  }
}
