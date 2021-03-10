view: staging_customer_issues {
  sql_table_name: public.customer_issues ;;
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

  dimension: box_type {
    type: string
    sql: ${TABLE}."box_type" ;;
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

  dimension: delivery_tnt {
    type: string
    sql: ${TABLE}."delivery_tnt" ;;
  }

  dimension: fulfillment_center {
    type: string
    sql: ${TABLE}."fulfillment_center" ;;
  }

  dimension: hour_in_transit {
    type: string
    sql: ${TABLE}."hour_in_transit" ;;
  }

  dimension: ingredient_id {
    type: number
    sql: ${TABLE}."ingredient_id" ;;
  }

  dimension: meal_combo {
    type: string
    sql: ${TABLE}."meal_combo" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: number_of_ingredients {
    type: number
    sql: ${TABLE}."number_of_ingredients" ;;
  }

  dimension: number_of_skus {
    type: number
    sql: ${TABLE}."number_of_skus" ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}."order_id" ;;
  }

  dimension: passed_five_days_freshness {
    type: string
    sql: ${TABLE}."passed_five_days_freshness" ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}."plan" ;;
  }

  dimension: print_label {
    type: string
    sql: ${TABLE}."print_label" ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}."product_type" ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}."reason" ;;
  }

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}."shipping_carrier" ;;
  }

  dimension_group: shipping {
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
    sql: ${TABLE}."shipping_on" ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}."sku_id" ;;
  }

  dimension: swapped_to_sku_id {
    type: number
    sql: ${TABLE}."swapped_to_sku_id" ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  dimension: zendesk_ticket_id {
    type: number
    sql: ${TABLE}."zendesk_ticket_id" ;;
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
    when ${TABLE}."reason" = 'Incorrect Measurement' then 'Shipping'
    when ${TABLE}."reason" = 'Broken Gel Pack' then 'Shipping'
    else null
    end;;
  }


  measure: count {
    type: count
    drill_fields: [id, orders.id]
  }
}
