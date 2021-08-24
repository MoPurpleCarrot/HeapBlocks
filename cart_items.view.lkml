view: cart_items {
  sql_table_name: heroku_postgres.cart_items ;;
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

  dimension: cart_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.cart_id ;;
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

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: sku_amount {
    type: number
    sql: ${TABLE}.sku_amount ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
  }

  dimension: sku_point_value {
    type: number
    sql: ${TABLE}.sku_point_value ;;
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


  dimension: item_quantity {
    type: number
    sql:  CASE WHEN ${post_cart_products.recipe_meal_type} = 3 THEN ${TABLE}.quantity
        WHEN ${post_cart_carts.plan_name} = 'Prepared' THEN ${TABLE}.quantity
        Else 1
        END
        ;;
  }

  measure: total_items {
    type: sum
    sql: ${item_quantity} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, carts.id]
  }
}
