view: customer_io_opens_derived {
  derived_table: {
    sql: select data__action_id, data__campaign_id, metric, data__newsletter_id
      ,count(*) opens
      from customerio_email.data
      where metric = 'opened'
      group by data__action_id,data__campaign_id, metric, data__newsletter_id
       ;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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
    type: number
    sql: ${TABLE}.data__newsletter_id ;;
  }

  dimension: opens {
    type: number
    sql: ${TABLE}.opens ;;
  }

  set: detail {
    fields: [message_id, campaign_id, action, broadcast_id, opens]
  }
}
