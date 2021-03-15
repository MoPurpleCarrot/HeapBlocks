view: customization_events_derived {
  derived_table: {
    sql: select created_at, name, subscription_id, json_extract_path_text(data, 'order_id') order_id, json_extract_path_text(data, 'ship_week') ship_week
      from heroku_postgres.events
      where name = 'meals_swapped'
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
    type: string
    sql: ${TABLE}.ship_week ;;
  }

  set: detail {
    fields: [created_at_time, name, subscription_id, order_id, ship_week]
  }
}
