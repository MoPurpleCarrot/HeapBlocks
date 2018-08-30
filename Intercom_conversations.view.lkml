view: Intercom_conversations {
  sql_table_name: intercom_full_integration.conversations ;;

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

  dimension: assignee__id {
    type: string
    sql: ${TABLE}.assignee__id ;;
  }

  dimension: assignee__type {
    type: string
    sql: ${TABLE}.assignee__type ;;
  }

  dimension: conversation_message__author__id {
    type: string
    sql: ${TABLE}.conversation_message__author__id ;;
  }

  dimension: conversation_message__author__type {
    type: string
    sql: ${TABLE}.conversation_message__author__type ;;
  }

  dimension: conversation_message__body {
    type: string
    sql: ${TABLE}.conversation_message__body ;;
  }

  dimension: conversation_message__id {
    type: string
    sql: ${TABLE}.conversation_message__id ;;
  }

  dimension: conversation_message__subject {
    type: string
    sql: ${TABLE}.conversation_message__subject ;;
  }

  dimension: conversation_message__type {
    type: string
    sql: ${TABLE}.conversation_message__type ;;
  }

  dimension: conversation_message__url {
    type: string
    sql: ${TABLE}.conversation_message__url ;;
  }

  dimension: conversation_rating__created_at {
    type: number
    sql: ${TABLE}.conversation_rating__created_at ;;
  }

  dimension: conversation_rating__customer__id {
    type: string
    sql: ${TABLE}.conversation_rating__customer__id ;;
  }

  dimension: conversation_rating__customer__type {
    type: string
    sql: ${TABLE}.conversation_rating__customer__type ;;
  }

  dimension: conversation_rating__rating {
    type: number
    sql: ${TABLE}.conversation_rating__rating ;;
  }

  dimension: conversation_rating__remark {
    type: string
    sql: ${TABLE}.conversation_rating__remark ;;
  }

  dimension: conversation_rating__teammate__id {
    type: number
    sql: ${TABLE}.conversation_rating__teammate__id ;;
  }

  dimension: conversation_rating__teammate__type {
    type: string
    sql: ${TABLE}.conversation_rating__teammate__type ;;
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

  dimension: open {
    type: yesno
    sql: ${TABLE}.open ;;
  }

  dimension: read {
    type: yesno
    sql: ${TABLE}.read ;;
  }

  dimension: snoozed_until {
    type: number
    sql: ${TABLE}.snoozed_until ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: tags__type {
    type: string
    sql: ${TABLE}.tags__type ;;
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

  dimension: user__id {
    type: string
    sql: ${TABLE}.user__id ;;
  }

  dimension: user__type {
    type: string
    sql: ${TABLE}.user__type ;;
  }

  dimension: waiting_since {
    type: number
    sql: ${TABLE}.waiting_since ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_distinct {
    type: count_distinct
    sql:  ${user__id} ;;
  }

  dimension: Registereddate_minus_chatdate {
    type: number
    sql: datediff( 'day', ${created_date}, ${subscriptions.registered_at_date}) ;;
  }

  dimension: Accountcreateddate_minus_chatdate {
    type: number
    sql: datediff( 'day', ${created_date}, ${users.created_date}) ;;
  }



  dimension: Convoccreated_minus_firstresponse {
    type: number
    sql:  datediff('hour', ${Intercom_conversation_parts.created_raw}, ${created_raw}) ;;
  }


 dimension: time_to_first_response_test {
   case: {
    when: {
      sql:${TABLE}.Intercom_conversation_parts.author__type = 'admin', MIN${Convoccreated_minus_firstresponse} ;;

    }
    }
    }


  dimension: time_to_first_response{
    type: date_hour
    sql: if(${Intercom_conversation_parts.author__type} = 'admin', MIN${Convoccreated_minus_firstresponse}, null) ;;
  }

  measure: Average_time_to_response {
    type: average
    sql: ${time_to_first_response} ;;
    }



}
