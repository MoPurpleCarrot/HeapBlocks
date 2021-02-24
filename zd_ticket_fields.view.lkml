view: zd_ticket_fields {
  sql_table_name: zendesk_current.ticket_fields ;;
  drill_fields: [value_id]

  dimension: value_id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: field_id {
    primary_key: yes
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }


  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }


  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }


  measure: count {
    type: count
  }
}
