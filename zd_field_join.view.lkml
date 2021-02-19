view: zd_field_join {
  sql_table_name: zendesk_current.tickets__custom_fields ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_level_0_id ;;
  }

  dimension: field_detail{
    type: string
    sql: ${TABLE}.value__string ;;

  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
