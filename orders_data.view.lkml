view: orders_data {
  # this is specifically for the ops report explore - it's a duplicate of the orders table wihtout some specific fields (primarily ones that reference the users table)
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
      hidden: yes
    }

    dimension: amount_charged {
      type: number
      value_format_name: usd
      sql: ${TABLE}.amount_charged ;;
      hidden: yes
    }

    dimension: cancelled_reason {
      type: string
      sql: ${TABLE}.cancelled_reason ;;
      hidden:  yes
    }

    dimension: coupon_code {
      type: string
      sql: ${TABLE}.coupon_code ;;
      hidden:  yes
    }

    dimension: coupon_id {
      type: number
      sql: ${TABLE}.coupon_id ;;
      hidden:  yes
    }

    dimension_group: created {
      type: time
      timeframes: [time, date, week, month, quarter, raw]
      sql: ${TABLE}.created_at ;;
      hidden:  yes
    }

    dimension: customer_id {
      type: number
      sql: ${TABLE}.customer_id ;;
      hidden:  yes
    }


    dimension: weeks_after_registered {
      type: number
      sql: DATEDIFF('week', ${subscriptions.registered_plus4_date}, ${delivery_date}) ;;
      hidden: yes
    }

    dimension: months_after_registered {
      type: number
      sql: DATEDIFF('month', ${subscriptions.registered_plus4_date}, ${delivery_date}) ;;
      hidden: yes
    }

    dimension: winback_week_num {
      type: number
      sql: DATEDIFF('week', ${subscriptions.winback_plus4_date}, ${delivery_date}) ;;
      hidden: yes
    }


    dimension: credit_applied {
      type: number
      value_format_name: usd
      sql: ${TABLE}.credit_applied ;;
      hidden:  yes
    }

    dimension_group: delivery {
      type: time
      timeframes: [time, date, week, month, quarter, raw]
      sql: ${TABLE}.delivery_on ;;
    }

    dimension: is_donated {
      type: yesno
      sql: ${TABLE}.donated ;;
      hidden:  yes
    }

    dimension: default_meals_were_overridden{
      type: yesno
      sql: ${TABLE}.overridden_recipes ;;
      hidden:  yes
    }

    dimension: menu_id {
      type: number
      sql: ${TABLE}.menu_id ;;
      hidden:  yes
    }

    dimension: order_number {
      type: number
      sql: ${TABLE}.order_number ;;
      hidden:  yes
    }

    dimension: partner_label {
      type: string
      sql: ${TABLE}.partner_label ;;
      hidden:  yes
    }

    dimension: plan {
      type: number
      sql: ${TABLE}.plan ;;
      hidden:  yes
    }

    dimension: price {
      type: number
      value_format_name: usd
      sql: ${TABLE}.price ;;
      hidden: yes
    }

    dimension: plan_price {
      type: number
      value_format_name: usd
      sql: ${TABLE}.plan_price ;;
      hidden: yes
    }

    dimension: extras_price {
      type: number
      value_format_name: usd
      sql: ${TABLE}.extras_price ;;
      hidden: yes
    }

    dimension: price_less_extras {
      type: number
      value_format_name: usd
      sql: ${price}-${extras_price} ;;
      hidden:  yes
    }

    dimension: shipping_carrier {
      type: string
      sql: ${TABLE}.shipping_carrier ;;
      hidden:  yes
    }

    dimension: shipping_label {
      type: string
      sql: ${TABLE}.shipping_label ;;
      hidden:  yes
    }

    dimension: shipping_address_full {
      type: string
      sql: ${TABLE}.shipping_address ;;
    }

  dimension: shipping_zip {
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'zip') ;;
  }
  dimension: shipping_city {
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'city') ;;
  }
  dimension: shipping_state {
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'state') ;;
  }
  dimension: shipping_address{
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'address') ;;
  }
  dimension: shipping_address2{
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'address2') ;;
  }
  dimension: shipping_first_name{
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'first_name') ;;
  }
  dimension: shipping_last_name{
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'last_name') ;;
  }
  dimension: shipping_delivery_instructions{
    type: string
    sql: json_extract_path_text(${TABLE}.shipping_address, 'delivery_instructions') ;;
  }

    dimension: status {
      type: number
      sql: ${TABLE}.status ;;
      hidden:  yes
    }

    dimension: billing_status_code {
      type: number
      sql: ${TABLE}.billing_status ;;
      hidden:  yes
    }


    dimension: billing_status {
      type: string
      sql:  CASE WHEN ${billing_status_code} = 0 THEN 'No Billing'
          WHEN ${billing_status_code} = 1 THEN 'Authorized'
          WHEN ${billing_status_code} = 2 THEN 'Auth Error'
          WHEN ${billing_status_code} = 3 THEN 'No Charge'
          WHEN ${billing_status_code} = 4 THEN 'Billed'
          WHEN ${billing_status_code} = 5 THEN 'Bill Error'
          WHEN ${billing_status_code} = 6 THEN 'Refunded'
          ELSE NULL
          END
          ;;
    }

    dimension: fulfillment_status_code {
      type: number
      sql: ${TABLE}.fulfillment_status ;;
      hidden:  yes
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

    dimension: active_fulfillment_status {
      type: string
      sql:  CASE WHEN ${fulfillment_status_code} = 0 THEN 'Active'
          WHEN ${fulfillment_status_code} = 1 THEN 'Active'
          WHEN ${fulfillment_status_code} = 2 THEN 'Active'
          WHEN ${fulfillment_status_code} = 3 THEN 'Active'
          WHEN ${fulfillment_status_code} = 4 THEN 'Cancelled'
          WHEN ${fulfillment_status_code} = 5 THEN 'Cancelled'
          WHEN ${fulfillment_status_code} = 6 THEN 'Cancelled'
          WHEN ${fulfillment_status_code} = 7 THEN 'Active'
          ELSE NULL
          END
          ;;
      hidden: yes
    }


    dimension: status_old {
      type: string
      sql: ${TABLE}.status_old ;;
      hidden:  yes
    }

    dimension: ship_template_shipping_provider {
      type: string
      sql: ${TABLE}.ship_template_shipping_provider ;;
      case_sensitive: no
    }

    dimension: ship_template_fulfillment_center {
      type: string
      sql: ${TABLE}.ship_template_fulfillment_center ;;
    }

    dimension: ship_template_shipping_cost {
      type: number
      sql: ${TABLE}.ship_template_shipping_cost ;;
      hidden:  yes
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
      hidden:  yes
    }

    dimension: stripe_charge_id {
      type: string
      sql: ${TABLE}.stripe_charge_id ;;
      hidden:  yes
    }

    dimension: subscription_id {
      type: number
      sql: ${TABLE}.subscription_id ;;
      hidden:  yes
    }

    dimension: is_through_partner {
      type: yesno
      sql: ${TABLE}.through_partner ;;
      hidden:  yes
    }

    dimension: test_account {
      type: yesno
      sql: ${TABLE}.test_account ;;
      hidden:  yes
    }

    dimension: tracking_number {
      type: string
      sql: ${TABLE}.tracking_number ;;
    }

    dimension_group: updated {
      type: time
      timeframes: [time, date, week, month]
      sql: ${TABLE}.updated_at ;;
      hidden:  yes
    }

    dimension: days_to_process {
      type: number
      sql: DATEDIFF('day',${created_raw},${delivery_raw}) ;;
      hidden:  yes
    }

    dimension: user_id {
      type: number
      sql: ${TABLE}.user_id ;;
      hidden:  yes
    }

    dimension: account_number {
      type: number
      sql: ${TABLE}.account_number ;;
      hidden:  yes
    }

    dimension: sales_tax {
      type: number
      sql: ${TABLE}.tax_amount ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    measure: count_distinct_plan {
      type: count_distinct
      sql: ${plan} ;;
      hidden: yes
    }

    measure: total_revenue {
      type: sum
      value_format_name: usd
      drill_fields: [detail*]
      sql: ${price} ;;
      hidden: yes
    }

    measure: billed_net_revenue {
      type: sum
      value_format_name: usd
      drill_fields: [detail*]
      sql: ${price} ;;
      hidden: yes
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
      hidden:  yes
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
      filters: {
        field: status
        value: "3"
      }
      sql: ${amount_charged} ;;
    }

    measure: total_billed_net_revenue {
      type: sum
      value_format_name: usd
      drill_fields: [detail*]
      filters: {
        field: status
        value: "3"
      }
      sql: ${price} ;;
      hidden: yes
    }

    measure: total_billed_count {
      type: count
      drill_fields: [detail*]
      filters: {
        field: status
        value: "3"
      }
      hidden: yes
    }

    measure: total_active_status_count {
      type: count
      drill_fields: [detail*]
      filters: {
        field: active_fulfillment_status
        value: "Active"
      }
      hidden: yes
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
      hidden:  yes
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
      hidden:  yes
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
      hidden:  yes
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
      hidden:  yes
    }

    measure: admin_cancel_count {
      type: count
      drill_fields: [detail*]
      filters: {
        field: status
        value: "6"
      }
      hidden:  yes
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
      hidden:  yes
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
      hidden:  yes
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
          WHEN ${plan} = 8 THEN 'Four Serving'
          WHEN ${plan} = 9 THEN 'Seasonal Box'
          WHEN ${plan} = 10 THEN 'Prepared'
          ELSE NULL
          END
          ;;
    }
    dimension: prepared_pilot_plan {
      type: string
      sql:  CASE WHEN ${plan} < 9 THEN 'Meal Kit'
          WHEN ${plan} = 10 THEN 'Prepared'
          ELSE NULL
          END
          ;;
    }

    dimension: default_plan_meal_num {
      type: number
      sql:  case when ${plan} = 8 then 4
          when ${plan} = 6 then 2
          else 3
          end
    ;;
      hidden:  yes
    }

    measure: total_default_plan_meal {
      type: sum
      sql:  ${default_plan_meal_num} ;;
      hidden: yes
    }

    measure: total_sales_tax {
      type: sum
      sql:  ${sales_tax} ;;
    }





    # ----- Sets of fields for drilling ------
    set: detail {
      fields: [
        orders_data.id,
        customer_issues.category,
        customer_issues.reason,
        credit_transactions.sum_cx_credits,
        refunds.sum_cx_refunds
      ]
    }


    dimension: Orderdate_minus_winbackdate{
      type: number
      sql: datediff( 'day', ${subscriptions.winback_date}, ${created_date}) ;;
      hidden:  yes
    }

    dimension: orderdate_after_winback{
      type: yesno
      sql: ${Orderdate_minus_winbackdate} >= 0 ;;
      hidden:  yes
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
      hidden:  yes
    }

    dimension: user_with_winback {
      type: yesno
      sql: ${subscriptions.winback_date} IS NOT NULL ;;
      hidden: yes
    }

    dimension_group: deleted_at {
      type: time
      timeframes: [time, date, week, month]
      sql: ${TABLE}.deleted_at ;;
      hidden: yes
    }

    dimension: state{
      map_layer_name: us_states
      sql: json_extract_path_text(${TABLE}.shipping_address, 'state') ;;
    }

  dimension: box_size {
    type: string
    sql: ${TABLE}.box_size ;;
  }

  dimension: week_num {
    type: number
    sql: DATEDIFF('week', ${user_facts.first_order_date}, ${delivery_date}) ;;
  }

  }
