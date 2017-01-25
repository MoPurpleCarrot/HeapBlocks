view: google_analytics_age {
  sql_table_name: google_analytics_age.report ;;

  dimension: rjm_record_hash {
    type: string
    sql: ${TABLE}._rjm_record_hash ;;
  }

  dimension_group: sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."end-date" ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.newusers ;;
  }

  dimension: page_views {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  measure: total_session_duration_in_minutes {
    type: number
    sql: MIN(${session_duration}) / 60 ;;
  }

  measure: total_sessions {
    type: number
    sql: MIN(${sessions}) ;;
  }

  measure: average_session_duration_in_minutes {
    type: number
    value_format_name: decimal_1
    sql: 1.0 * ${total_session_duration_in_minutes} / NULLIF(${total_sessions},0) ;;
  }

  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."start-date" ;;
  }

  dimension: unique_page_views {
    type: number
    sql: ${TABLE}.uniquepageviews ;;
  }

  dimension: user_age_bracket {
    type: string
    sql: ${TABLE}.useragebracket ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: users_count {
    type: number
    sql: MIN(${users}) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
