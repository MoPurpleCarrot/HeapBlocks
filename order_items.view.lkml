view: order_items {
  sql_table_name: heroku_postgres.order_items ;;
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension:  deleted_yn {
    type: yesno
    sql:  ${deleted_date} > 2015-01-01;;
  }

  dimension: discount_cents {
    type: number
    sql: ${TABLE}.discount_cents ;;
  }

  dimension: discount_currency {
    type: string
    sql: ${TABLE}.discount_currency ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: price_cents {
    type: number
    sql: ${TABLE}.price_cents ;;
  }

  dimension: price_currency {
    type: string
    sql: ${TABLE}.price_currency ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: recipe_id {
    type: number
    sql: ${TABLE}.recipe_id ;;
  }

  dimension: tax_amount_cents {
    type: number
    sql: ${TABLE}.tax_amount_cents ;;
  }

  dimension: tax_amount_currency {
    type: string
    sql: ${TABLE}.tax_amount_currency ;;
  }

  dimension: tax_code {
    type: string
    sql: ${TABLE}.tax_code ;;
  }

  dimension: recipe_or_sku {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: recipe_meal_type {
    type: string
    sql: ${products.recipe_meal_type};;
  }

  dimension: order_plan_code {
    type: number
    sql: ${orders.plan} ;;
  }

  dimension: order_plan_name {
    type: string
    sql: ${orders.plan_name} ;;
  }

  dimension: sku_id {
    type: string
    sql: ${TABLE}.sku_id ;;
  }

  dimension: item_type {
    type: string
    sql:  CASE WHEN ${recipe_meal_type} = 0 THEN 'Dinner'
          WHEN ${recipe_meal_type} = 2 THEN 'Lunch'
          WHEN ${recipe_meal_type} = 1 THEN 'Breakfast'
          WHEN ${recipe_meal_type} = 3 THEN 'Extension'
          END
          ;;
  }


  dimension: breakfast_binary {
    type: number
    sql: case when ${recipe_meal_type} = 1 Then 1
          Else 0
          END
          ;;
  }

  dimension: lunch_binary {
    type: number
    sql: case when ${recipe_meal_type} = 2 Then 1
          Else 0
          END
          ;;
  }

  dimension: dinner_binary {
    type: number
    sql: case when ${recipe_meal_type} = 0 Then 1
          Else 0
          END
          ;;
  }

  dimension: dinner_kit_count {
    type: number
    sql: case when ${recipe_meal_type} = 0 and ${skus.servings} = 4 Then 2
          When ${recipe_meal_type} = 0 and ${order_plan_code} = 6 Then 1
          When ${recipe_meal_type} = 0 Then 1
          Else 0
          END
          ;;
  }

  dimension: extension_binary {
    type: number
    sql: case when ${dinner_binary} = 1 Then 0
          when  ${lunch_binary} = 1 Then 0
          when ${breakfast_binary} = 1 Then 0
          Else 1*${quantity}
          END
          ;;
  }

  measure: count_breakfast_binary {
    type: sum
    sql: ${breakfast_binary} ;;
  }

  measure: count_lunch_binary {
    type: sum
    sql: ${lunch_binary} ;;
  }

  measure: count_dinner_binary {
    type: sum
    sql: ${dinner_binary} ;;
  }

  measure: count_dinner_kit {
    type: sum
    sql: ${dinner_kit_count} ;;
  }

  measure: count_extension_binary {
    type: sum
    sql: ${extension_binary} ;;
  }

 dimension: item_quantity {
    type: number
    sql: ${quantity}*${dinner_binary} ;;
  }

  measure: total_items {
    type: sum
    sql: ${item_quantity} ;;
  }

  dimension: breakfast_revenue {
    type: number
    sql: case when ${breakfast_binary} = 1 Then ${price_cents}
    Else 0
    END
    ;;
  }

  dimension: lunch_revenue {
    type: number
    sql: case when ${lunch_binary} = 1 Then ${price_cents}
          Else 0
          END
          ;;
  }

  dimension: dinner_revenue {
    type: number
    sql: case when ${dinner_binary} = 1 Then ${price_cents}
          Else 0
          END
          ;;
  }

  dimension: extension_revenue {
    type: number
    sql: case when ${extension_binary} > 0 Then ${price_cents}*${quantity}
          Else 0
          END
          ;;
  }

  measure: sum_breakfast_rev {
    type: sum
    sql: ${breakfast_revenue} ;;
  }

  measure: sum_lunch_rev {
    type: sum
    sql: ${lunch_revenue} ;;
  }

  measure: sum_dinner_rev {
    type: sum
    sql: ${dinner_revenue} ;;
  }

  measure: sum_extension_rev {
    type: sum
    sql: ${extension_revenue} ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: total_revenue{
    type: sum
    sql: ${price_cents} ;;
    value_format_name: usd
  }
}
