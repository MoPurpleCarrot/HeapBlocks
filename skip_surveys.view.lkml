view: skip_surveys {
  sql_table_name: heroku_postgres.skip_menu_surveys ;;
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

  dimension: deprecated_plan_after_skip {
    type: number
    sql: ${TABLE}.deprecated_plan_after_skip ;;
  }

  dimension: menu_id {
    type: number
    sql: ${TABLE}.menu_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: plan_after_skip {
    type: number
    sql: ${TABLE}.plan_after_skip ;;
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: shipping_address_id {
    type: number
    sql: ${TABLE}.shipping_address_id ;;
  }

  dimension: unskipped_through_rebuttal {
    type: yesno
    sql: ${TABLE}.unskipped_through_rebuttal ;;
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
  dimension: skip_reason_bucket {
    type: string
    sql:  CASE WHEN ${reason} = 'I am travelling' THEN 'Travel'
          WHEN ${reason} = 'I am traveling' THEN 'Travel'
          WHEN ${reason} = 'I did not like the meals' THEN 'Meal Options'
          WHEN ${reason} = 'I am too busy to cook' THEN 'Busy'
          WHEN ${reason} = 'I have remaining meals to cook from previous weeks' THEN 'Leftover Meals'
          WHEN ${reason} = 'I need to save money' THEN 'Save Money'
          WHEN ${reason} = 'I plan on cancelling' THEN 'Cancelling'
          WHEN ${reason} = 'I''m planning on cancelling in the future' THEN 'Cancelling'
          WHEN ${reason} is NULL then NULL
          ELSE 'Other'
          END
          ;;
  }

}
