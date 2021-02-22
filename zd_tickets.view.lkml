view: zd_tickets {
  sql_table_name: zendesk_current.tickets ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  dimension: ticket_form_id {
    type: number
    sql: ${TABLE}.ticket_form_id ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.via__channel ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.via__source__from__address ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.via__source__from__name ;;
  }

  dimension: ticket_id {
    type: number
    sql: ${TABLE}.via__source__from__ticket_id ;;
  }


  measure: count {
    type: count
    drill_fields: [ticket_id]
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${ticket_id};;
  }

}
