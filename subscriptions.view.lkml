view: subscriptions {
  sql_table_name: heroku_postgres.subscriptions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }

  dimension_group: sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: yes
  }

  dimension: sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
  }

  dimension: billed_or_bill_error_orders_count {
    type: number
    sql: ${TABLE}.billed_or_bill_error_orders_count ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: status_code {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: cc_exp_month {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_exp_month ;;
  }

  dimension: cc_exp_year {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_exp_year ;;
  }

  dimension: cc_last_four {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_last_four ;;
  }

  dimension: cc_type {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_type ;;
  }

  dimension: stripe_customer_id {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_customer_id ;;
  }

  dimension: stripe_token {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_token ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden: yes
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.business_name,
      users.first_name,
      users.id,
      users.last_name,
      orders.count
    ]
  }
}
