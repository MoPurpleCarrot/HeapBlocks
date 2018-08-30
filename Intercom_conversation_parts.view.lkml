view: Intercom_conversation_parts {
  sql_table_name: intercom_full_integration.conversations__conversation_parts ;;

  dimension: id {
    primary_key: yes
    type: string
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

  dimension: _sdc_level_0_id {
    type: number
    sql: ${TABLE}._sdc_level_0_id ;;
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

  dimension: _sdc_source_key_id {
    type: string
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: assigned_to__id {
    type: string
    sql: ${TABLE}.assigned_to__id ;;
  }

  dimension: assigned_to__type {
    type: string
    sql: ${TABLE}.assigned_to__type ;;
  }

  dimension: author__id {
    type: string
    sql: ${TABLE}.author__id ;;
  }

  dimension: author__type {
    type: string
    sql: ${TABLE}.author__type ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension_group: notified {
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
    sql: ${TABLE}.notified_at ;;
  }

  dimension: part_type {
    type: string
    sql: ${TABLE}.part_type ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
