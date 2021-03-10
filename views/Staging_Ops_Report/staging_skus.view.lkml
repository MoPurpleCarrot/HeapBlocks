view: staging_skus {
  sql_table_name: public.skus ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: allergens {
    type: string
    sql: ${TABLE}."allergens" ;;
  }

  dimension: available_per_region {
    type: string
    sql: ${TABLE}."available_per_region" ;;
  }

  dimension: calories {
    type: number
    sql: ${TABLE}."calories" ;;
  }

  dimension: carbs {
    type: number
    sql: ${TABLE}."carbs" ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}."description" ;;
  }

  dimension: enabled_per_region {
    type: string
    sql: ${TABLE}."enabled_per_region" ;;
  }

  dimension: fat {
    type: number
    sql: ${TABLE}."fat" ;;
  }

  dimension: min_quantity {
    type: string
    sql: ${TABLE}."min_quantity" ;;
  }

  dimension: nutrition_label {
    type: string
    sql: ${TABLE}."nutrition_label" ;;
  }

  dimension: plan_group {
    type: string
    sql: ${TABLE}."plan_group" ;;
  }

  dimension: point_value {
    type: number
    sql: ${TABLE}."point_value" ;;
  }

  dimension: pre_sale_price {
    type: number
    sql: ${TABLE}."pre_sale_price" ;;
  }

  dimension: prep_and_cook_time {
    type: string
    sql: ${TABLE}."prep_and_cook_time" ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}."price" ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}."product_id" ;;
  }

  dimension: protein {
    type: number
    sql: ${TABLE}."protein" ;;
  }

  dimension: servings {
    type: string
    sql: ${TABLE}."servings" ;;
  }

  dimension: sku_code {
    type: string
    sql: ${TABLE}."sku_code" ;;
  }

  dimension: spec {
    type: string
    sql: ${TABLE}."spec" ;;
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
    drill_fields: [id]
  }
}
