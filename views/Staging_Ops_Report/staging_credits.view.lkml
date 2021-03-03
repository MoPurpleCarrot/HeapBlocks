view: staging_credits {
  sql_table_name: public.credit_transactions ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: action {
    type: number
    sql: ${TABLE}."action" ;;
  }

  dimension: admin_id {
    type: number
    sql: ${TABLE}."admin_id" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
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
    sql: ${TABLE}."created_at" ;;
  }

  dimension: credit_transaction_group_id {
    type: number
    sql: ${TABLE}."credit_transaction_group_id" ;;
  }

  dimension: customer_issue_id {
    type: number
    sql: ${TABLE}."customer_issue_id" ;;
  }

  dimension: cx_reason {
    type: string
    sql: ${TABLE}."cx_reason" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}."source_id" ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}."source_type" ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}."updated_at" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
