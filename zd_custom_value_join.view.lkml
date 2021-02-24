view: zd_custom_value_join {
  sql_table_name: zendesk_current.tickets__custom_fields__value ;;


  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }

}
