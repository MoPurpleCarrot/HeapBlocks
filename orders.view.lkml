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
    hidden:  yes
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
    timeframes: [time, date, week, month, quarter, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: month_num {
    type: number
    sql: DATEDIFF('month', ${user_facts.first_order_date}, ${delivery_date}) ;;
  }

  dimension: week_num {
    type: number
    sql: DATEDIFF('week', ${user_facts.first_order_date}, ${delivery_date}) ;;
  }

  dimension: weeks_after_registered {
    type: number
    sql: DATEDIFF('week', ${subscriptions.registered_plus4_date}, ${delivery_date}) ;;
  }

  dimension: months_after_registered {
    type: number
    sql: DATEDIFF('month', ${subscriptions.registered_plus4_date}, ${delivery_date}) ;;
  }

  dimension: winback_week_num {
    type: number
    sql: DATEDIFF('week', ${subscriptions.winback_plus4_date}, ${delivery_date}) ;;
  }


  dimension: credit_applied {
    type: number
    value_format_name: usd
    sql: ${TABLE}.credit_applied ;;
  }

  dimension_group: delivery {
    type: time
    timeframes: [time, date, week, month, quarter, raw]
    sql: ${TABLE}.delivery_on ;;
  }

  dimension: is_donated {
    type: yesno
    sql: ${TABLE}.donated ;;
  }

  dimension: default_meals_were_overridden{
    type: yesno
    sql: ${TABLE}.overridden_recipes ;;
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
    hidden:  yes
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

  dimension: plan_price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.plan_price ;;
  }

  dimension: extras_price {
    type: number
    value_format_name: usd
    sql: ${TABLE}.extras_price ;;
  }

  dimension: price_less_extras {
    type: number
    value_format_name: usd
    sql: ${price}-${extras_price} ;;
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

  dimension: billing_status_code {
    type: number
    hidden:  yes
    sql: ${TABLE}.billing_status ;;
  }

  dimension: billing_status {
    type: string
    sql:  CASE WHEN ${billing_status_code} = 0 THEN 'No Billing'
          WHEN ${billing_status_code} = 1 THEN 'Authorized'
          WHEN ${billing_status_code} = 2 THEN 'Auth Error'
          WHEN ${billing_status_code} = 3 THEN 'No Charge'
          WHEN ${billing_status_code} = 4 THEN 'Billed'
          WHEN ${billing_status_code} = 5 THEN 'Unknown'
          WHEN ${billing_status_code} = 6 THEN 'Refunded'
          ELSE NULL
          END
          ;;
  }

  dimension: fulfillment_status_code {
    type: number
    hidden:  yes
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: fulfillment_status {
    type: string
    sql:  CASE WHEN ${fulfillment_status_code} = 0 THEN 'Planned'
          WHEN ${fulfillment_status_code} = 1 THEN 'Confirmed'
          WHEN ${fulfillment_status_code} = 2 THEN 'Delayed Start'
          WHEN ${fulfillment_status_code} = 3 THEN 'Skipped'
          WHEN ${fulfillment_status_code} = 4 THEN 'Cancelled'
          WHEN ${fulfillment_status_code} = 5 THEN 'Suspended'
          WHEN ${fulfillment_status_code} = 6 THEN 'Admin Cancelled'
          WHEN ${fulfillment_status_code} = 7 THEN 'Returning'
          ELSE NULL
          END
          ;;
  }

  dimension: status_old {
    type: string
    sql: ${TABLE}.status_old ;;
  }

  dimension: ship_template_shipping_provider {
    type: string
    sql: ${TABLE}.ship_template_shipping_provider ;;
  }

  dimension: ship_template_fulfillment_center {
    type: string
    sql: ${TABLE}.ship_template_fulfillment_center ;;
  }

  dimension: ship_template_shipping_cost {
    type: number
    sql: ${TABLE}.ship_template_shipping_cost ;;
  }

  dimension: ship_template_TNT {
    type: number
    sql: ${TABLE}.ship_template_TNT ;;
  }

  dimension: ship_template_ship {
    type: date
    sql: ${TABLE}.ship_template_ship_date ;;
  }

  dimension: ship_template_delivery {
    type: date
    sql: ${TABLE}.ship_template_ship_date ;;
  }

  dimension: projected_delivery{
    type: date
    sql: ${TABLE}.projected_delivery_on ;;
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
    hidden:  yes
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

  measure: count_distinct_plan {
    type: count_distinct
    sql: ${plan} ;;
  }


  measure: total_revenue {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${price} ;;
  }

  measure: total_plan_gross_revenue {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${plan_price} ;;
  }

  measure: total_net_revenue_less_extras {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${price_less_extras} ;;
  }

  measure: total_extra_gross_revenue {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${extras_price} ;;
  }

  measure: total_amount_charged {
    type: sum
    value_format_name: usd
    drill_fields: [detail*]
    sql: ${amount_charged} ;;
  }

  measure: total_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: status
      value: "3"
    }
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

  measure: CC_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: plan
      value: "3"}
    filters: {
      field: status
      value: "3"
    }
  }

  measure: QE_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: plan
      value: "4"}
    filters: {
      field: status
      value: "3"
    }
  }

  measure: HP_billed_count {
    type: count
    drill_fields: [detail*]
    filters: {
      field: plan
      value: "5"}
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

  dimension: plan_name {
    type: string
    sql:  CASE WHEN ${plan} = 0 THEN 'Core'
          WHEN ${plan} = 1 THEN 'Family'
          WHEN ${plan} = 2 THEN 'TB12'
          WHEN ${plan} = 3 THEN 'Chefs Choice'
          WHEN ${plan} = 4 THEN 'Quick and Easy'
          WHEN ${plan} = 5 THEN 'High Protein'
          WHEN ${plan} = 6 THEN 'Six Serving'
          WHEN ${plan} = 7 THEN 'Gluten Free'
          ELSE NULL
          END
          ;;
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
      users.name,
      user_with_winback
    ]
  }


  dimension: Orderdate_minus_winbackdate{
    type: number
    sql: datediff( 'day', ${subscriptions.winback_date}, ${created_date}) ;;
  }

  dimension: orderdate_after_winback{
    type: yesno
    sql: ${Orderdate_minus_winbackdate} >= 0 ;;
  }

  measure: count_total_billed_post_winback {
    type: count
    drill_fields: [detail*]
    filters: {
      field: status
      value: "3"
    }
    filters: {
      field:  orderdate_after_winback
      value: "yes"
    }
  }

  dimension: user_with_winback {
    type: yesno
    hidden: yes
    sql: ${subscriptions.winback_date} IS NOT NULL ;;
  }

  measure: average_orders_post_winback {
    type: number
    hidden: yes
    sql: ${count_total_billed_post_winback}/NULLIF(${user_with_winback},0) ;;
  }



}
