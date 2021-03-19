view: customer_issues {
  sql_table_name: heroku_postgres.customer_issues ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received {
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
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
  }

  dimension: admin_id {
    type: number
    sql: ${TABLE}.admin_id ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: box_type {
    type: string
    sql: ${TABLE}.box_type ;;
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

  dimension: delivery_tnt {
    type: string
    sql: ${TABLE}.delivery_tnt ;;
  }

  dimension: fulfillment_center {
    type: string
    sql: ${TABLE}.fulfillment_center ;;
  }

  dimension: ingredient_id {
    type: number
    sql: ${TABLE}.ingredient_id ;;
  }

  dimension: meal_combo {
    type: string
    sql: ${TABLE}.meal_combo ;;
  }

  dimension: notes {
    type: string
    case_sensitive: no
    drill_fields: [created_date, menus.shipping_date, reason, print_label, meal_combo, notes, orders_data.count, count, credit_transactions.sum_cx_credits, refunds.sum_cx_refunds]
    sql: ${TABLE}.notes ;;
  }

  dimension: number_of_ingredients {
    type: number
    sql: ${TABLE}.number_of_ingredients ;;
  }

  dimension: number_of_skus {
    type: number
    sql: ${TABLE}.number_of_skus ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: passed_five_days_freshness {
    type: string
    sql: ${TABLE}.passed_five_days_freshness ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: print_label {
    type: string
    sql: ${TABLE}.print_label ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: refund_id {
    type: number
    sql: ${TABLE}.refund_id ;;
  }

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}.shipping_carrier ;;
  }

  dimension_group: shipping {
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
    sql: ${TABLE}.shipping_on ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: zendesk_ticket_id {
    type: number
    sql: ${TABLE}.zendesk_ticket_id ;;
  }

  dimension: category {
    type: string
    sql: case
          when ${TABLE}."reason" = 'Arrived After Dinner' then 'Shipping'
          when ${TABLE}."reason" = 'Arrived Late 1+ Days' then 'Shipping'
          when ${TABLE}."reason" = 'Arrived Warm' then 'Shipping'
          when ${TABLE}."reason" = 'Damaged Box' then 'Shipping'
          when ${TABLE}."reason" = 'Delivery Instructions Not Followed' then 'Shipping'
          when ${TABLE}."reason" = 'Didn''t Arrive' then 'Shipping'
          when ${TABLE}."reason" = 'Tape Lifted/Open Box' then 'Shipping'
          when ${TABLE}."reason" = 'Tracking Number Issue' then 'Shipping'
          when ${TABLE}."reason" = 'Container Broken' then 'Shipping'
          when ${TABLE}."reason" = 'Broken Gel Pack' then 'Shipping'

          when ${TABLE}."reason" = 'Damaged' then 'Ingredient'
          when ${TABLE}."reason" = 'Food Poisoning' then 'Ingredient'
          when ${TABLE}."reason" = 'Spoiled' then 'Ingredient'
          when ${TABLE}."reason" = 'Overripe' then 'Ingredient'
          when ${TABLE}."reason" = 'Underripe' then 'Ingredient'
          when ${TABLE}."reason" = 'Damaged Garlic' then 'Ingredient'

          when ${TABLE}."reason" = 'Arrived Passed Expiration Date' then 'Fulfillment'
          when ${TABLE}."reason" = 'Incorrect Measurement' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Ingredient' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Meal' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Snack' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Booklet' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Garlic' then 'Fulfillment'
          when ${TABLE}."reason" = 'Foreign Object' then 'Fulfillment'

          when ${TABLE}."reason" is null then null

          else 'Other'
          end;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      orders_data.count,
      customer_issues.reason,
      products.title,
      customer_issues.print_label,
      customer_issues.meal_combo,
      customer_issues.number_of_skus,
      customer_issues.number_of_ingredients,
      ingredients.name,
      credit_transactions.sum_cx_credits,
      refunds.sum_cx_refunds
    ]
  }


}
