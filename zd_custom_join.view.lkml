view: zd_custom_join {
  sql_table_name: zendesk_current.tickets__custom_fields ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }


  dimension: value__string {
    type: string
    sql: ${TABLE}.value__string ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
