view: events {
  sql_table_name: heroku_postgres.events ;;
  drill_fields: [followed_up_event_id]

  dimension: followed_up_event_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.followed_up_event_id ;;
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

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
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

  dimension: data_json {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source {
    type: number
    sql: ${TABLE}.source ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: order_id{
    type: string
    sql: json_extract_path_text(${TABLE}.data, 'order_id') ;;
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

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data;;
}
  measure: count_followed_up_events{
    type: count
    drill_fields: [followed_up_event_id, name]
  }
  measure: count_events {
    type: count_distinct
    sql: ${id} ;;
  }
}
