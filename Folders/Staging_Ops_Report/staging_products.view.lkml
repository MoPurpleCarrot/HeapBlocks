view: staging_products {
  sql_table_name: public.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
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
    sql: ${TABLE}."admin_updated_at" ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}."brand" ;;
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

  dimension: image_alt {
    type: string
    sql: ${TABLE}."image_alt" ;;
  }

  dimension: product_type {
    type: number
    sql: ${TABLE}."product_type" ;;
  }

  dimension: recipe_meal_type {
    type: number
    sql: ${TABLE}."recipe_meal_type" ;;
  }

  dimension: rectangle_image {
    type: string
    sql: ${TABLE}."rectangle_image" ;;
  }

  dimension: search_keywords {
    type: string
    sql: ${TABLE}."search_keywords" ;;
  }

  dimension: seo_description {
    type: string
    sql: ${TABLE}."seo_description" ;;
  }

  dimension: seo_title {
    type: string
    sql: ${TABLE}."seo_title" ;;
  }

  dimension: show_in_products_catalog {
    type: yesno
    sql: ${TABLE}."show_in_products_catalog" ;;
  }

  dimension: slug {
    type: string
    sql: ${TABLE}."slug" ;;
  }

  dimension: square_image {
    type: string
    sql: ${TABLE}."square_image" ;;
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}."subtitle" ;;
  }

  dimension: tax_code {
    type: string
    sql: ${TABLE}."tax_code" ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}."title" ;;
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
