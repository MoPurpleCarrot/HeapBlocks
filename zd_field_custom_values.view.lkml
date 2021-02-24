view: zd_field_custom_values {
  sql_table_name: zendesk_current.tickets__custom_fields ;;
  drill_fields: [value_id]

  dimension: value_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: field_detail{
    type: string
    sql: ${TABLE}.value__string ;;
  }

  dimension: ship_date{
    type: string
    sql: case when ${zd_ticket_fields.title} = 'Ship Week' THEN ${field_detail}
    else null
    end;;
  }

  dimension: field_id {
    type: number
    sql:${TABLE}._sdc_source_key_id ;;
  }

}
