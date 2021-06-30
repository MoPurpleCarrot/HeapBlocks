view: customer_io_clicks_derived {
    derived_table: {
      sql: select "timestamp", data__campaign_id, count(distinct event_id) total_clicks
           from customerio_email.data
           where metric = 'clicked'
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

dimension: total_clicks {
  type: number
  sql: ${TABLE}.total_clicks ;;
}

}
