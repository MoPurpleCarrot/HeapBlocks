view: products {
  sql_table_name: heroku_postgres.products ;;
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

  dimension_group: admin_updated {
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
    sql: ${TABLE}.admin_updated_at ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
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

  dimension: image_alt {
    type: string
    sql: ${TABLE}.image_alt ;;
  }

  dimension: product_type {
    type: number
    sql: ${TABLE}.product_type ;;
  }

  dimension: recipe_meal_type {
    type: number
    sql: ${TABLE}.recipe_meal_type ;;
  }

  dimension: recipe_meal_type_name {
    type: string
    sql:  CASE WHEN ${recipe_meal_type} = 0 THEN 'Dinner'
          WHEN ${recipe_meal_type} = 1 THEN 'Breakfast'
          WHEN ${recipe_meal_type} = 2 THEN 'Lunch'
          When ${recipe_meal_type} = 3 THEN 'Exension'
          ELSE NULL
          END
          ;;
  }

  dimension: rectangle_image {
    type: string
    sql: ${TABLE}.rectangle_image ;;
  }

  dimension: search_keywords {
    type: string
    sql: ${TABLE}.search_keywords ;;
  }

  dimension: seo_description {
    type: string
    sql: ${TABLE}.seo_description ;;
  }

  dimension: seo_title {
    type: string
    sql: ${TABLE}.seo_title ;;
  }

  dimension: show_in_products_catalog {
    type: yesno
    sql: ${TABLE}.show_in_products_catalog ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
  }

  dimension: square_image {
    type: string
    sql: ${TABLE}.square_image ;;
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
  }

  measure: count {
    type: count
    drill_fields: [id, product_tags_products.count]
  }
}
