view: gift_purchases {
  sql_table_name: heroku_postgres.gift_purchases ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: gift_id {
    type: number
    sql: ${TABLE}.gift_id ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: purchaser_email {
    type: string
    sql: ${TABLE}.purchaser_email ;;
  }

  dimension: purchaser_name {
    type: string
    sql: ${TABLE}.purchaser_name ;;
  }

  dimension: recipient_email {
    type: string
    sql: ${TABLE}.recipient_email ;;
  }

  dimension: recipient_name {
    type: string
    sql: ${TABLE}.recipient_name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: status_string {
    type: string
    sql: ${TABLE}.status_string ;;
  }

  dimension: stripe_charge_id {
    type: string
    sql: ${TABLE}.stripe_charge_id ;;
  }

  dimension: stripe_token {
    type: string
    sql: ${TABLE}.stripe_token ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}.token ;;
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: value_applied {
    type: number
    sql: ${TABLE}.value_applied ;;
  }

  dimension: value_refunded {
    type: number
    sql: ${TABLE}.value_refunded ;;
  }

  measure: count {
    type: count
    drill_fields: [id, purchaser_name, recipient_name, gift_redemptions.count]
  }

  measure: total_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }

  measure: redeemed_unapplied_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    filters: {
      field: status
      value: "3"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }

  measure: partially_applied_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    filters: {
      field: status
      value: "4"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }

  measure: fully_applied_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    filters: {
      field: status
      value: "5"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }
}
