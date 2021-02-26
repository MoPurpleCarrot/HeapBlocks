view: menu_items_new {
  sql_table_name: heroku_postgres.menu_items ;;
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

  dimension: deprecated_default_choice {
    type: yesno
    sql: ${TABLE}.deprecated_default_choice ;;
  }

  dimension: deprecated_enabled {
    type: yesno
    sql: ${TABLE}.deprecated_enabled ;;
  }

  dimension: deprecated_recipe_id {
    type: number
    sql: ${TABLE}.deprecated_recipe_id ;;
  }

  dimension: deprecated_recipe_plan_id {
    type: number
    sql: ${TABLE}.deprecated_recipe_plan_id ;;
  }

  dimension: deprecated_sku_id {
    type: number
    sql: ${TABLE}.deprecated_sku_id ;;
  }

  dimension: enabled_per_region {
    type: string
    sql: ${TABLE}.enabled_per_region ;;
  }

  dimension: menu_id {
    type: number
    sql: ${TABLE}.menu_id ;;
  }

  dimension: print_label {
    type: string
    sql: ${TABLE}.print_label ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: recipe_id {
    type: number
    sql: ${TABLE}.recipe_id ;;
  }

  dimension: recipe_plan_id {
    type: number
    sql: ${TABLE}.recipe_plan_id ;;
  }

  dimension: recipe_position_in_plan {
    type: string
    sql: ${TABLE}.recipe_position_in_plan ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
  measure: meal_combo_list {
    type: list
    list_field: print_label
  }
}
