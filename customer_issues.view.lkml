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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
