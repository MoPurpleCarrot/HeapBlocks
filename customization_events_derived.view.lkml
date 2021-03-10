view: customization_events_derived {
  derived_table: {
    sql: select name, created_at,subscription_id, data
      from heroku_postgres.events
      where name = 'meals_swapped'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: order_id {
    sql: cast(json_extract_path(${TABLE}.data, 'order_id') as number) ;;
  }

  dimension: ship_week {
    sql: cast(json_extract_path(${TABLE}.data, 'ship_week') as date) ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  set: detail {
    fields: [name, created_at_time, subscription_id, data]
  }
}
