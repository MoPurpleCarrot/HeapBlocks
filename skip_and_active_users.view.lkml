view: skip_and_active_users {
  sql_table_name: skip_and_active_users.tracker ;;

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

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
    hidden: yes
  }

  measure: active_status {
    type: sum
    sql: ${active} ;;
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

  dimension_group: menu_end {
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
    sql: ${TABLE}.menu_end_date ;;
  }

  dimension: skip {
    type: number
    sql: ${TABLE}.skip ;;
    hidden: yes
  }

  measure: skip_status {
    type: sum_distinct
    sql: ${skip} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
