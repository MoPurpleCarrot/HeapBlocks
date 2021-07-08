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
    hidden: yes
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
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
  }

  dimension: message_id {
    type: number
    sql: ${TABLE}.data__action_id ;;
    primary_key: yes
  }


  dimension: campaign_id {
    type: number
    sql: ${TABLE}.data__campaign_id ;;
  }


  dimension: user_id {
    type: string
    sql: ${TABLE}.data__customer_id ;;
    hidden: yes
  }


  dimension: user_email {
    type: string
    sql: ${TABLE}.data__recipient ;;
    hidden: yes
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.data__subject ;;
  }


  dimension: broadcast_newsletter_id {
    type: string
    sql: ${TABLE}.data__newsletter_id ;;
  }

  dimension: broadcast_api_id {
    type: string
    sql: ${TABLE}.data__broadcast_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: data__delivery_id {
    type: number
    sql: ${TABLE}.data__delivery_id ;;
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

  dimension: customization_emails {
    type: string
    sql:  CASE WHEN ${message_id} = 1001995 THEN '0 Messages - SMS'
          WHEN ${message_id} = 1001996 THEN '0 Messages - Email'
          WHEN ${message_id} = 1002005 THEN '1 Message - SMS'
          WHEN ${message_id} = 1002030 THEN '1 Message - Email'
          WHEN ${message_id} = 1002007 THEN '2 Messages - SMS'
          WHEN ${message_id} = 1002031 THEN '2 Messages - Email'
          WHEN ${message_id} = 1002021 THEN '2 Messages - SMS'
          WHEN ${message_id} = 1002028 THEN '2 Messages - Email'
          WHEN ${message_id} = 1002008 THEN '3 Messages - SMS'
          WHEN ${message_id} = 1002032 THEN '3 Messages - Email'
          WHEN ${message_id} = 1002023 THEN '3 Messages - SMS'
          WHEN ${message_id} = 1002029 THEN '3 Messages - Email'
          ELSE NULL
          END
          ;;
    hidden: yes
  }

  dimension: loyalty_test {
    type: string
    sql:  CASE WHEN ${campaign_id} = 1000397 or ${campaign_id} = 1000399 or ${campaign_id} = 1000398 THEN 'Receiving Loyalty Emails'
          ELSE 'Not Receiving Loyalty Emails'
          END
          ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: count_users_loyalty {
    type: count_distinct
    sql: CASE WHEN (${campaign_id} = 1000397 or ${campaign_id} = 1000399 or ${campaign_id} = 1000398) AND ${action} = 'sent' THEN ${user_id}
    ELSE NULL
    END;;
    hidden: yes
  }

  measure: count_per_user{
    type: number
    sql: ${count}/${count_users_loyalty} ;;
  }

}
