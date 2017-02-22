view: paused_and_cancelled_users {
  sql_table_name: skip_and_active_users.tracker2 ;;

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

  dimension: cancelled {
    type: number
    sql: ${TABLE}.cancelled ;;
    hidden: yes
  }

  measure: cancelled_status {
    type: sum
    sql: ${cancelled} ;;
  }

  measure: first_cancelled {
    type: number
    sql: min(extract(epoch from ${date_raw}) * 1000::bigint + ${cancelled}) - min(extract(epoch from ${date_raw}) * 1000::bigint)
      ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: paused {
    type: number
    sql: ${TABLE}.paused ;;
    hidden: yes
  }

  measure: paused_status {
    type: sum
    sql: ${paused} ;;
  }

  measure: first_paused {
    type: number
    sql: min(extract(epoch from ${date_raw}) * 1000::bigint + ${paused}) - min(extract(epoch from ${date_raw}) * 1000::bigint)
      ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
