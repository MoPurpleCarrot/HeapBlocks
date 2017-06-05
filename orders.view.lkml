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

  dimension: month_num {
    type: number
    sql: DATEDIFF('month', ${user_facts.first_order_date}, ${delivery_date}) ;;
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
    sql: ${TABLE}.menu_id ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension: partner_label {
    type: string
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

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}.shipping_carrier ;;
  }

  dimension: shipping_label {
    type: string
    sql: ${TABLE}.shipping_label ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: status_old {
    type: string
    sql: ${TABLE}.status_old ;;
  }

  dimension: stripe_charge_id {
    type: string
    sql: ${TABLE}.stripe_charge_id ;;
  }

  dimension: subscription_id {
    type: number
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
  }

  dimension: days_to_process {
    type: number
    sql: DATEDIFF('day',${created_raw},${delivery_raw}) ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: account_number {
    type: number
    sql: ${TABLE}.account_number ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_revenue {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${price} ;;
  }

  measure: TB12_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: plan
      value: "2"}
    filters: {
      field: status
      value: "3"
    }
  }

  measure: admin_cancel_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: status
      value: "6"
    }
  }
  measure: PC_2_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: plan
      value: "0"}
    filters: {
      field: status
      value: "3"
    }
  }

  measure: PC_4_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: plan
      value: "1"}
    filters: {
      field: status
      value: "3"
    }
  }

  measure: average_revenue {
    type: number
    value_format_name: usd
    sql: ${total_revenue}/NULLIF(${users.count},0) ;;
  }

  measure: average_num_orders {
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${count}/NULLIF(${users.count},0) ;;
  }

  dimension: days_since_created {
    type: number
    sql:  DATEDIFF('day',${users.created_date},${created_date})  ;;
  }

  # 30 day
  dimension: is_30day_since_created {
    type: yesno
    sql: ${days_since_created} <= 30 ;;
  }

  dimension: plan_bucket {
    sql:
      if
      (${plan}=0,"Core",
        if
        (${plan}=1,"Core",
          if
          (${plan}=2,"TB12", "Other")));;
  }

  measure: total_revenue_30day {
    type:  sum
    value_format_name: usd
    sql: ${price} ;;
    filters: {
      field: is_30day_since_created
      value: "Yes"
    }
  }

  measure: average_revenue_30day {
    type: number
    value_format_name: usd
    sql: ${total_revenue_30day}/NULLIF(${users.count},0);;
  }

  # 60 day
  dimension: is_60day_since_created {
    type: yesno
    sql: ${days_since_created} <= 60 ;;
  }

  measure: total_revenue_60day {
    type:  sum
    value_format_name: usd
    sql: ${price} ;;
    filters: {
      field: is_60day_since_created
      value: "Yes"
    }
  }

  measure: average_revenue_60day {
    type: number
    value_format_name: usd
    sql: ${total_revenue_60day}/NULLIF(${users.count},0);;
  }

  # 90 day
  dimension: is_90day_since_created {
    type: yesno
    sql: ${days_since_created} <= 90 ;;
  }

  measure: total_revenue_90day {
    type:  sum
    value_format_name: usd
    sql: ${price} ;;
    filters: {
      field: is_90day_since_created
      value: "Yes"
    }
  }

  measure: average_revenue_90day {
    type: number
    value_format_name: usd
    sql: ${total_revenue_90day}/NULLIF(${users.count},0);;
  }

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
