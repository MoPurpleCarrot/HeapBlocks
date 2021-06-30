view: customer_io_conversions_derived {
    derived_table: {
      sql: select timestamp, data__campaign_id, count(distinct event_id) total_conversions
           from customerio_email.data
           where metric = 'converted'
           group by timestamp, data__campaign_id
               ;;
      persist_for: "24 hours"
      indexes: ["data__campaign_id"]
      distribution_style:  all
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

  dimension: total_conversions {
    type: number
    sql: ${TABLE}.total_conversions ;;
  }
  }
