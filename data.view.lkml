view: live_chat_sessions {
  sql_table_name: live_chat.data ;;

  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}.__sdc_primary_key ;;
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

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: session__agent_responder__email {
    type: string
    sql: ${TABLE}.session__agent_responder__email ;;
  }

  dimension: session__agent_responder__encrypted_id {
    type: string
    sql: ${TABLE}.session__agent_responder__encrypted_id ;;
  }

  dimension: session__agent_responder__is_admin {
    type: yesno
    sql: ${TABLE}.session__agent_responder__is_admin ;;
  }

  dimension: session__agent_responder__name {
    type: string
    sql: ${TABLE}.session__agent_responder__name ;;
  }

  dimension: session__agent_responder__type {
    type: string
    sql: ${TABLE}.session__agent_responder__type ;;
  }

  dimension: session__channel__encrypted_id {
    type: string
    sql: ${TABLE}.session__channel__encrypted_id ;;
  }

  dimension: session__channel__name {
    type: string
    sql: ${TABLE}.session__channel__name ;;
  }

  dimension: session__channel__type {
    type: string
    sql: ${TABLE}.session__channel__type ;;
  }

  dimension: session__channel_name {
    type: string
    sql: ${TABLE}.session__channel_name ;;
  }

  dimension: session__channel_type {
    type: string
    sql: ${TABLE}.session__channel_type ;;
  }

  dimension: session__customer__email {
    type: string
    sql: ${TABLE}.session__customer__email ;;
  }

  dimension: session__customer__name {
    type: string
    sql: ${TABLE}.session__customer__name ;;
  }

  dimension: session__customer__phone_number {
    type: string
    sql: ${TABLE}.session__customer__phone_number ;;
  }

  dimension: session__duration {
    type: number
    sql: ${TABLE}.session__duration ;;
  }

  dimension: session__encrypted_id {
    type: string
    sql: ${TABLE}.session__encrypted_id ;;
  }

  dimension: session__notes {
    type: string
    sql: ${TABLE}.session__notes ;;
  }

  dimension: session__responder {
    type: string
    sql: ${TABLE}.session__responder ;;
  }

  dimension: session__start_time_string {
    type: string
    sql: ${TABLE}.session__start_time ;;
  }

  dimension: session__start_year_number {
    type: number
    sql: substring(${TABLE}.session__start_time,1,4) ;;
  }

  dimension: session__start_month_number {
    type: number
    sql: substring(${TABLE}.session__start_time,6,2) ;;
  }

  dimension: session__start_day_number {
    type: number
    sql: substring(${TABLE}.session__start_time,9,2) ;;
  }

  dimension: session__start {
    type: date
    sql: date(${session__start_year_number},${session__start_month_number},${session__start_day_number}) ;;
  }
  # TURN INTO A TIME



  dimension: session__time_to_first_response {
    type: number
    sql: ${TABLE}.session__time_to_first_response ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  measure: count {
    type: count
    drill_fields: [session__customer__name, session__channel_name, session__channel__name, session__agent_responder__name]
  }

  #BUILD UNIQUE COUNTS

}
