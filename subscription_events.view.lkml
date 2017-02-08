view: subscription_events {
  sql_table_name: heroku_postgres.subscription_events ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: last_event {
    type: number
    sql: max(extract(epoch from ${created_raw}) * 1000::bigint + ${event_type}) - max(extract(epoch from ${created_raw}) * 1000::bigint)
    ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: event_type {
    type: number
    sql: ${TABLE}.event_type ;;
  }

  dimension: event {
    type: string
    sql:  CASE WHEN ${event_type} = 0 THEN 'Inactive'
    WHEN ${event_type} = 1 THEN 'Active'
    WHEN ${event_type} = 2 THEN 'Cancelled'
    WHEN ${event_type} = 3 THEN 'Paused'
    WHEN ${event_type} = 4 THEN 'Skipped'
    WHEN ${event_type} = 5 THEN 'Suspended'
    ELSE NULL
    END
    ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, users.business_name, users.first_name, users.id, users.last_name]
  }
}
