view: customer_io_opens_derived {
  derived_table: {
    sql: select data__campaign_id
      ,count(*) opens
      from customerio_email.data
      where metric = 'opened'
      group by data__campaign_id

 ;;
  }


  dimension: campaign_id {
    type: number
    sql: ${TABLE}.data__campaign_id ;;
  }

  measure: total_opens {
    type: number
    sql: ${TABLE}.opens ;;
  }


}
