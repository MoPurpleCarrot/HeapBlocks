view: zd_custom_fields{
  sql_table_name: zendesk_current.tickets__custom_fields ;;
  drill_fields: [field_id]

  dimension: field_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: customfield_options {
    type: number
    sql: ${TABLE}._sdc_level_0_id ;;
  }
  dimension: ticket_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: field_detail {
    type: string
    sql: ${TABLE}.value__string ;;
  }

  dimension: ship_week{
    type: string
    sql: case when ${zd_ticket_fields.title} = 'Ship Week' THEN ${field_detail}
          else null
          end;;
  }

  dimension: shipped_from{
    type: string
    sql: case when ${zd_ticket_fields.title} = 'Shipped From' THEN ${field_detail}
          else null
          end;;
  }
  dimension: shipping_partner{
    type: string
    sql: case when ${zd_ticket_fields.title} = 'Shipping Partner' THEN ${field_detail}
          else null
          end;;
  }
  dimension: primary_interaction_reason{
    type: string
    sql: case when ${zd_ticket_fields.title} = '1) Primary Interaction Reason' THEN ${field_detail}
          else null
          end;;
  }


  measure: count {
    type: count
    drill_fields: [field_id]
  }
}
