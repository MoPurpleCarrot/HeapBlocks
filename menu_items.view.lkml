view: menu_items {
  sql_table_name: heroku_postgres.menu_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [time, date, week, month]
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

  dimension: default_choice {
    type: yesno
    sql: ${TABLE}.default_choice ;;
  }

  dimension: menu_id {
    type: number
    # hidden: true
    sql: ${TABLE}.menu_id ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: recipe_id {
    type: number
    # hidden: true
    sql: ${TABLE}.recipe_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, menus.id, recipes.id]
  }
}
