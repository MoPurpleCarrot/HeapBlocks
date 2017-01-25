view: orders {
  sql_table_name: heroku_postgres.orders ;;

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

  dimension: admin_id {
    type: number
    sql: ${TABLE}.admin_id ;;
  }

  dimension: amount_charged {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount_charged ;;
  }

  dimension: cancelled_reason {
    type: string
    sql: ${TABLE}.cancelled_reason ;;
  }

  dimension: coupon_code {
    type: string
    sql: ${TABLE}.coupon_code ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: credit_applied {
    type: number
    value_format_name: usd
    sql: ${TABLE}.credit_applied ;;
  }

  dimension_group: delivery {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.delivery_on ;;
  }

  dimension: is_donated {
    type: yesno
    sql: ${TABLE}.donated ;;
  }

  dimension: menu_id {
    type: number
    hidden: yes
    sql: ${TABLE}.menu_id ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: partner_label {
    type: string
    hidden: yes
    sql: ${TABLE}.partner_label ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.price ;;
  }

  measure: total_revenue {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${price} ;;
  }

  measure: running_total_revenue {
    type: running_total
    sql: ${total_revenue} ;;
  }

  measure: average_revenue {
    type: number
    sql: ${running_total_revenue}/NULLIF(${users.count},0) ;;
  }

  measure: average_revenue_per_user {
    type: number
    value_format_name: usd
    sql: ${total_revenue}/NULLIF(${users.running_total},0) ;;
  }

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}.shipping_carrier ;;
  }

  dimension: shipping_label {
    type: string
    hidden: yes
    sql: ${TABLE}.shipping_label ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: status_old {
    type: string
    sql: ${TABLE}.status_old ;;
    hidden: yes
  }

  dimension: stripe_charge_id {
    type: string
    sql: ${TABLE}.stripe_charge_id ;;
  }

  dimension: subscription_id {
    type: number
    hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  dimension: is_through_partner {
    type: yesno
    sql: ${TABLE}.through_partner ;;
  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}.tracking_number ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden: yes
  }

  dimension: days_to_process {
    type: number
    sql: DATEDIFF('day',${created_raw},${delivery_raw}) ;;
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

  #   - measure: first_count
  #     type: count
  #     sql: ${}

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      created_date,
      delivery_date,
      days_to_process,
      tracking_number,
      recipes.title,
      chefs.name,
      users.name
    ]
  }
}
