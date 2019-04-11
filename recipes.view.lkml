view: recipes {
  sql_table_name: heroku_postgres.recipes ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }

  dimension_group: sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: yes
  }

  dimension: sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
  }

  dimension: archive_image {
    type: string
    sql: ${TABLE}.archive_image ;;
    hidden: yes
  }

  dimension: archive_image_alt {
    type: string
    sql: ${TABLE}.archive_image_alt ;;
    hidden: yes
  }

  dimension: calories {
    type: number
    sql: ${TABLE}.calories ;;
  }

  measure: total_calories {
    type: sum
    sql: ${calories} ;;
  }

  measure: average_calories {
    type: average
    sql: ${calories} ;;
  }

  measure: average_calories_unique_recipe {
    type: average_distinct
    sql_distinct_key: ${id} ;;
    sql: ${calories} ;;
  }

  dimension: carbs {
    type: number
    sql: ${TABLE}.carbs ;;
  }

  measure: total_carbs {
    type: sum
    sql: ${carbs} ;;
  }

  measure: average_carbs {
    type: average
    sql: ${carbs} ;;
  }

  measure: average_carbs_unique_recipe {
    type: average_distinct
    sql_distinct_key: ${id} ;;
    sql: ${carbs} ;;
  }

  dimension: chef_id {
    type: number
    sql: ${TABLE}.chef_id ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: difficulty {
    type: string
    sql: ${TABLE}.difficulty ;;
  }

  dimension: fat {
    type: number
    sql: ${TABLE}.fat ;;
  }

  measure: total_fat {
    type: sum
    sql: ${fat} ;;
  }

  measure: average_fat {
    type: average
    sql: ${fat} ;;
  }

  measure: average_fat_unique_recipe {
    type: average_distinct
    sql_distinct_key: ${id} ;;
    sql: ${fat} ;;
  }

  dimension: home_image_alt {
    type: string
    sql: ${TABLE}.home_image_alt ;;
    hidden: yes
  }

  dimension: image {
    type: string
    sql: ${TABLE}.image ;;
    hidden: yes
  }

  dimension: is_snack {
    type: yesno
    sql: ${TABLE}.is_snack ;;
  }

  dimension: page_meta_description {
    type: string
    sql: ${TABLE}.page_meta_description ;;
    hidden: yes
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.page_title ;;
    hidden: yes
  }

  dimension: plan_type {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: plate_image {
    type: string
    sql: ${TABLE}.plate_image ;;
    hidden: yes
  }

  dimension: prep_time {
    type: string
    sql: ${TABLE}.prep_time ;;
  }

  dimension: prep_and_cook_time {
    type: string
    sql: ${TABLE}.prep_and_cook_time ;;
  }

  dimension: allergens {
    type: string
    sql: ${TABLE}.allergens ;;
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}.subtitle ;;
  }

  dimension: protein {
    type: number
    sql: ${TABLE}.protein ;;
  }

  measure: total_protein {
    type: sum
    sql: ${protein} ;;
  }

  measure: average_protein {
    type: average
    sql: ${protein} ;;
  }

  measure: average_protein_unique_recipe {
    type: average_distinct
    sql_distinct_key: ${id} ;;
    sql: ${protein} ;;
  }

  dimension: number_of_servings {
    type: number
    sql: ${TABLE}.servings ;;
  }

  measure: total_servings {
    type: sum
    sql: ${number_of_servings} ;;
  }

  dimension: show_in_recipes_archive {
    type: yesno
    sql: ${TABLE}.show_in_recipes_archive ;;
    hidden: yes
  }

  dimension: skip_calendar_image {
    type: string
    sql: ${TABLE}.skip_calendar_image ;;
    hidden: yes
  }

  dimension: skip_calendar_image_alt {
    type: string
    sql: ${TABLE}.skip_calendar_image_alt ;;
    hidden: yes
  }

  dimension: slug {
    type: string
    sql: ${TABLE}.slug ;;
    hidden: yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, menu_items.count]
  }
}
