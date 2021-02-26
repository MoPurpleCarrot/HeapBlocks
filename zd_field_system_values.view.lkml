view: zd_field_system_values {
  sql_table_name: zendesk_current.ticket_fields__system_field_options ;;

  dimension: field_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: options_customfield {
    type: number
    sql: ${TABLE}._sdc_level_0_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
