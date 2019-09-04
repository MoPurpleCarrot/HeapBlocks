view: skip_menu_surveys {
  sql_table_name: heroku_postgres.skip_menu_surveys ;;

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

  dimension: menu_ids {
    type: string
    sql: ${TABLE}.menu_ids ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: plan_after_skip {
    type: string
    sql: ${TABLE}.plan_after_skip ;;
  }

  dimension: unskipped_through_rebuttal {
    type: string
    sql: ${TABLE}.unskipped_through_rebuttal ;;
  }

  dimension: shipping_address_id {
    type: string
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
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

  dimension: skip_reason_bucket {
    type: string
    sql:  CASE WHEN ${reason} = 'I am travelling' THEN 'Travel'
          WHEN ${reason} = 'I did not like the meals' THEN 'Meal Options'
          WHEN ${reason} = 'I am too busy to cook' THEN 'Busy'
          WHEN ${reason} = 'I have remaining meals to cook from previous weeks' THEN 'Leftover Meals'
          WHEN ${reason} = 'I need to save money' THEN 'Save Money'
          WHEN ${reason} = 'I plan on cancelling' THEN 'Cancelling'
          WHEN ${reason} = "I'm planning on cancelling in the future" THEN 'Cancelling'
          ELSE NULL
          END
          ;;
  }


  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
