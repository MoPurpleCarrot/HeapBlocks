view: staging_orders {
  sql_table_name: public.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: account_designation {
    type: number
    sql: ${TABLE}."account_designation" ;;
  }

  dimension: admin_id {
    type: number
    sql: ${TABLE}."admin_id" ;;
  }

  dimension: amount_charged {
    type: number
    sql: ${TABLE}."amount_charged" ;;
  }

  dimension: billing_status {
    type: number
    sql: ${TABLE}."billing_status" ;;
  }

  dimension: box_size {
    type: string
    sql: ${TABLE}."box_size" ;;
  }

  dimension: cancelled_reason {
    type: string
    sql: ${TABLE}."cancelled_reason" ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}."coupon_id" ;;
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

  dimension: credit_applied {
    type: number
    sql: ${TABLE}."credit_applied" ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."customer_id" ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}."deleted_at" ;;
  }

  dimension_group: delivery {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."delivery_on" ;;
  }

  dimension: donated {
    type: yesno
    sql: ${TABLE}."donated" ;;
  }

  dimension: donation_charity {
    type: string
    sql: ${TABLE}."donation_charity" ;;
  }

  dimension: extras_price {
    type: number
    sql: ${TABLE}."extras_price" ;;
  }

  dimension: free_box_used {
    type: yesno
    sql: ${TABLE}."free_box_used" ;;
  }

  dimension: fulfillment_status {
    type: number
    sql: ${TABLE}."fulfillment_status" ;;
  }

  dimension: giveaway_id {
    type: number
    sql: ${TABLE}."giveaway_id" ;;
  }

  dimension: max_point_value {
    type: number
    sql: ${TABLE}."max_point_value" ;;
  }

  dimension: menu_id {
    type: number
    sql: ${TABLE}."menu_id" ;;
  }

  dimension: overridden_plan {
    type: yesno
    sql: ${TABLE}."overridden_plan" ;;
  }

  dimension: overridden_recipes {
    type: yesno
    sql: ${TABLE}."overridden_recipes" ;;
  }

  dimension: overridden_shipping_address {
    type: yesno
    sql: ${TABLE}."overridden_shipping_address" ;;
  }

  dimension: overridden_status {
    type: string
    sql: ${TABLE}."overridden_status" ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}."plan" ;;
  }

  dimension: plan_price {
    type: number
    sql: ${TABLE}."plan_price" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }

  dimension_group: projected_delivery {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."projected_delivery_on" ;;
  }

  dimension: recipient_email {
    type: string
    sql: ${TABLE}."recipient_email" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}."region" ;;
  }

  dimension_group: ship_template_delivery {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ship_template_delivery_date" ;;
  }

  dimension: ship_template_fulfillment_center {
    type: string
    sql: ${TABLE}."ship_template_fulfillment_center" ;;
  }

  dimension_group: ship_template_ship {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."ship_template_ship_date" ;;
  }

  dimension: ship_template_shipping_cost {
    type: number
    sql: ${TABLE}."ship_template_shipping_cost" ;;
  }

  dimension: ship_template_shipping_provider {
    type: string
    sql: ${TABLE}."ship_template_shipping_provider" ;;
  }

  dimension: ship_template_tnt {
    type: number
    sql: ${TABLE}."ship_template_tnt" ;;
  }

  dimension: shipping_address {
    type: string
    sql: ${TABLE}."shipping_address" ;;
  }

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}."shipping_carrier" ;;
  }

  dimension: skipped_due_to_sold_out {
    type: yesno
    sql: ${TABLE}."skipped_due_to_sold_out" ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}."status" ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}."subscription_id" ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}."tax_amount" ;;
  }

  dimension: test_account {
    type: yesno
    sql: ${TABLE}."test_account" ;;
  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}."tracking_number" ;;
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
    drill_fields: [id, customer_issues.count]
  }
}
