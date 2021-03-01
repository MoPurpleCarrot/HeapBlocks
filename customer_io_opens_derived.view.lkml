view: customer_io_opens_derived {
  derived_table: {
    sql: select _sdc_batched_at, _sdc_received_at,data__action_id,data__campaign_id, metric, data__newsletter_id
      ,count(distinct data__customer_id) total_user_ids
      from customerio_email.data
      where metric = 'opened'
      group by _sdc_batched_at, _sdc_received_at,data__action_id,data__campaign_id, metric, data__newsletter_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension: message_id {
    type: number
    sql: ${TABLE}.data__action_id ;;
    primary_key: yes
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.data__campaign_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.metric ;;
  }

  dimension: broadcast_id {
    type: string
    sql: ${TABLE}.data__newsletter_id ;;
  }

  dimension: total_user_ids {
    type: number
    sql: ${TABLE}.total_user_ids ;;
  }

  set: detail {
    fields: [
      message_id,
      campaign_id,
      action,
      broadcast_id,
      total_user_ids
    ]
  }
}
