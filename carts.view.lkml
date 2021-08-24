view: carts {
  sql_table_name: heroku_postgres.carts ;;
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

  dimension: box_size {
    type: string
    sql: ${TABLE}.box_size ;;
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


  dimension: fulfillment_status_code {
    type: number
    sql: ${TABLE}.fulfillment_status ;;
    hidden:  yes
  }

  dimension: fulfillment_status {
    type: string
    sql:  CASE WHEN ${fulfillment_status_code} = 0 THEN 'Planned'
          WHEN ${fulfillment_status_code} = 2 THEN 'Delayed Start'
          WHEN ${fulfillment_status_code} = 3 THEN 'Skipped'
          WHEN ${fulfillment_status_code} = 4 THEN 'Cancelled'
          WHEN ${fulfillment_status_code} = 5 THEN 'Suspended'
          WHEN ${fulfillment_status_code} = 7 THEN 'Returning'
          ELSE NULL
          END
          ;;
  }

  dimension: max_point_value {
    type: number
    sql: ${TABLE}.max_point_value ;;
  }

  dimension: menu_id {
    type: number
    sql: ${TABLE}.menu_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: overridden_plan {
    type: yesno
    sql: ${TABLE}.overridden_plan ;;
  }

  dimension: overridden_recipes {
    type: yesno
    sql: ${TABLE}.overridden_recipes ;;
  }

  dimension: overridden_status {
    type: string
    sql: ${TABLE}.overridden_status ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
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

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: recipient_email {
    type: string
    sql: ${TABLE}.recipient_email ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: shipping_address_id {
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: skipped_due_to_sold_out {
    type: yesno
    sql: ${TABLE}.skipped_due_to_sold_out ;;
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

  dimension_group: deleted {
    type: time
    timeframes: [
      date
    ]
    sql: ${TABLE}.deleted_at ;;
  }


  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, cart_items.count]
  }
}
