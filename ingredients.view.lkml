view: ingredients {
  sql_table_name: heroku_postgres.ingredients ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden:  yes
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
    hidden:  yes
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
    hidden:  yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden:  yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden:  yes
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
    hidden:  yes
  }

  dimension: ingredient_name {
    type: string
    case_sensitive: no
    sql: split_part(${TABLE}.name, ',',1) ;;
  }

  dimension: quantity {
    type: string
    sql: ${TABLE}.quantity ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
    hidden:  yes
  }

  dimension: recipe_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.recipe_id ;;
    hidden:  yes
  }

  dimension: recipe_plan_id {
    type: number
    sql: ${TABLE}.recipe_plan_id ;;
    hidden:  yes
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
    hidden:  yes
  }

  measure: count {
    type: count
    drill_fields: [id, ingredient_name, recipes.id]
  }
}
