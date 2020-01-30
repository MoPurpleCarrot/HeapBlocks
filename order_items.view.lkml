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

  dimension:  deleted {
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
    sql: ${recipes.meal_type} ;;
  }

  dimension: item_type {
    type: string
    sql:  CASE WHEN ${recipe_meal_type} = 'Dinner' THEN 'Dinner'
          WHEN ${recipe_meal_type} = 'Lunch' THEN 'Lunch'
          WHEN ${recipe_meal_type} = 'Breakfast' THEN 'Breakfast'
          ELSE 'Extension'
          END
          ;;
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
