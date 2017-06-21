view: heap_events {
  sql_table_name: main_production.all_events ;;

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_table_name {
    type: string
    sql: ${TABLE}.event_table_name ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [event_table_name]
  }
}
