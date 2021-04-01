view: skus {
  sql_table_name: heroku_postgres.skus ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
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

  dimension: allergens {
    type: string
    sql: ${TABLE}.allergens ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: calories {
    type: number
    sql: ${TABLE}.calories ;;
  }

  dimension: carbs {
    type: number
    sql: ${TABLE}.carbs ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display {
    type: yesno
    sql: ${TABLE}.display ;;
    hidden: yes
  }

  dimension: enabled_per_region {
    type: string
    sql: ${TABLE}.enabled_per_region ;;
    hidden: yes
  }

  dimension: fat {
    type: number
    sql: ${TABLE}.fat ;;
  }

  dimension: home_image_alt {
    type: string
    sql: ${TABLE}.home_image_alt ;;
    hidden: yes
  }

  dimension: ingredients {
    type: string
    sql: ${TABLE}.ingredients ;;
  }

  dimension: min_quantity__bigint {
    type: number
    sql: ${TABLE}.min_quantity__bigint ;;
    hidden: yes
  }

  dimension: min_quantity__string {
    type: string
    sql: ${TABLE}.min_quantity__string ;;
    hidden: yes
  }

  dimension: nutrition_label {
    type: string
    sql: ${TABLE}.nutrition_label ;;
  }

  dimension: plan_group {
    type: string
    sql: ${TABLE}.plan_group ;;
    hidden: yes
  }

  dimension: point_value {
    type: number
    sql: ${TABLE}.point_value ;;
  }

  dimension: pre_sale_price {
    type: number
    sql: ${TABLE}.pre_sale_price ;;
  }

  dimension: prep_and_cook_time {
    type: string
    sql: ${TABLE}.prep_and_cook_time ;;
  }

  dimension: presale_price_cents {
    type: number
    sql: ${TABLE}.presale_price_cents ;;
    hidden: yes
  }

  dimension: presale_price_currency {
    type: string
    sql: ${TABLE}.presale_price_currency ;;
    hidden: yes
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    hidden: yes
  }

  dimension: price_currency {
    type: string
    sql: ${TABLE}.price_currency ;;
    hidden: yes
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
    hidden: yes
  }

  dimension: protein {
    type: number
    sql: ${TABLE}.protein ;;
  }

  dimension: rectangle_image {
    type: string
    sql: ${TABLE}.rectangle_image ;;
    hidden: yes
  }

  dimension: search_keywords {
    type: string
    sql: ${TABLE}.search_keywords ;;
    hidden: yes
  }

  dimension: seo_description {
    type: string
    sql: ${TABLE}.seo_description ;;
    hidden: yes
  }

  dimension: seo_title {
    type: string
    sql: ${TABLE}.seo_title ;;
    hidden: yes
  }

  dimension: servings {
    type: string
    sql: ${TABLE}.servings ;;
  }

  dimension: sku_code {
    type: string
    sql: ${TABLE}.sku_code ;;
    hidden: yes
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: spec {
    type: string
    sql: ${TABLE}.spec ;;
    hidden: yes
  }

  dimension: square_image {
    type: string
    sql: ${TABLE}.square_image ;;
    hidden: yes
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}.subtitle ;;
  }

  dimension: tax_code {
    type: string
    sql: ${TABLE}.tax_code ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
