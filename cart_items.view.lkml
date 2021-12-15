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
    hidden: yes
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
    hidden: yes
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
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
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
    hidden: yes
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
    hidden: yes
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
    sql:  CASE WHEN ${recipe_meal_type_2} = 3 THEN ${TABLE}.quantity
    WHEN (${post_cart_skus.plan_group} = 'prepared_one_serving' and ${recipe_meal_type_2} = 0) THEN ${TABLE}.quantity
    WHEN (${post_cart_skus.plan_group} = 'four_servings' and ${recipe_meal_type_2} = 0) THEN (2*${TABLE}.quantity)
    Else (1*${TABLE}.quantity)
    END
    ;;
  }


  dimension: recipe_meal_type_2 {
    type: string
    sql: ${post_cart_products.recipe_meal_type};;
    hidden: yes
  }

  dimension: item_type {
    type: string
    sql:  CASE
          WHEN ${recipe_meal_type_2} = 2 THEN 'Lunch'
          WHEN ${recipe_meal_type_2} = 1 THEN 'Breakfast'
          WHEN ${recipe_meal_type_2} = 3 THEN 'Extension'
          WHEN ${recipe_meal_type_2} = 0 AND ${post_cart_skus.plan_group} = 'prepared_one_serving' THEN 'Dinner - Prep'
          WHEN ${recipe_meal_type_2} = 0 AND ${post_cart_skus.plan_group} = 'four_servings' THEN 'Dinner - MK - 4'
          WHEN ${recipe_meal_type_2} = 0 THEN 'Dinner - MK - 2'
          END;;
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
