view: customer_io_opens_derived {
  derived_table: {
    sql: select "timestamp", data__campaign_id, count(distinct event_id) total_opens
           from customerio_email.data
           where metric = 'opened'
           group by "timestamp", data__campaign_id
               ;;
  }

  dimension_group: timestamp {
    type: time
    timeframes: [time, date, week, month, raw]
    datatype: epoch
    sql: ${TABLE}.timestamp ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.data__campaign_id ;;
    primary_key: yes
  }

  dimension: total_opens {
    type: number
    sql: ${TABLE}.total_opens ;;
  }

}
