view: zd_field_custom_values {
  sql_table_name: zendesk_current.ticket_fields__custom_field_options ;;
  drill_fields: [field_id]

  dimension: field_id {
    primary_key: yes
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: name{
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: value{
    type: string
    sql: ${TABLE}.value;;
  }


}
