view: customer_io {
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

  dimension: data__action_id {
    type: number
    sql: ${TABLE}.data__action_id ;;
  }

  dimension: data__broadcast_id {
    type: number
    sql: ${TABLE}.data__broadcast_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.data__campaign_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.data__customer_id ;;
  }

  dimension: delivery_id {
    type: string
    sql: ${TABLE}.data__delivery_id ;;
  }

  dimension: journey_id {
    type: string
    sql: ${TABLE}.data__journey_id ;;
  }

  dimension: user_email {
    type: string
    sql: ${TABLE}.data__recipient ;;
  }

  dimension: data__subject {
    type: string
    sql: ${TABLE}.data__subject ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}.object_type ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
