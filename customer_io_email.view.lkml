view: customer_io_email {
  sql_table_name: customerio_email.data ;;

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

  dimension: message_id {
    type: number
    sql: ${TABLE}.data__action_id ;;
  }


  dimension: campaign_id {
    type: number
    sql: ${TABLE}.data__campaign_id ;;
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.data__customer_id ;;
  }


  dimension: user_email {
    type: string
    sql: ${TABLE}.data__recipient ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.data__subject ;;
  }


  dimension: broadcast_id {
    type: string
    sql: ${TABLE}.newsletter_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.object_type ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [time, date, week, month, raw]
    datatype: epoch
    sql: ${TABLE}.timestamp ;;
  }


  measure: count {
    type: count
    drill_fields: []
  }
}
