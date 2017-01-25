view: google_analytics_conversion {
  sql_table_name: google_analytics_conversion.report ;;

  dimension: _rjm_record_hash {
    type: string
    sql: ${TABLE}._rjm_record_hash ;;
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

  dimension_group: enddate {
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
    sql: ${TABLE}."end-date" ;;
  }

  dimension: goalabandonsall {
    type: number
    sql: ${TABLE}.goalabandonsall ;;
  }

  dimension: goalcompletionsall {
    type: number
    sql: ${TABLE}.goalcompletionsall ;;
  }

  dimension: goalstartsall {
    type: number
    sql: ${TABLE}.goalstartsall ;;
  }

  dimension: goalvalueall {
    type: number
    sql: ${TABLE}.goalvalueall ;;
  }

  dimension: itemquantity {
    type: number
    sql: ${TABLE}.itemquantity ;;
  }

  dimension: itemrevenue {
    type: number
    sql: ${TABLE}.itemrevenue ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension_group: startdate {
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
    sql: ${TABLE}."start-date" ;;
  }

  dimension: transactionrevenue {
    type: number
    sql: ${TABLE}.transactionrevenue ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: average_order_value {
    type: number
    sql: ${transactionrevenue} / NULLIF(${transactions},0) ;;
  }
}
