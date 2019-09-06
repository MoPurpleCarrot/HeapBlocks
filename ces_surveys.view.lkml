view: ces_surveys {
  sql_table_name: heroku_postgres.ces_surveys ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billed_orders_count {
    type: number
    sql: ${TABLE}.billed_orders_count ;;
  }

  dimension_group: completed {
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
    sql: ${TABLE}.completed_at ;;
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

  dimension: question_1_answer {
    label: "How likely are you to recommend Purple Carrot to a friend or colleague? (0-10)"
    type: number
    sql: ${TABLE}.question_1_answer ;;
  }

  dimension: question_2_answer {
    label: "Is it easy to be a Purple Carrot subscriber? (1-4)"
    type: number
    sql: ${TABLE}.question_2_answer ;;
  }

  dimension: question_3_answer {
    label: "Is it easy to use the Purple Carrot website? (1-4)"
    type: number
    sql: ${TABLE}.question_3_answer ;;
  }

  dimension: question_4_answer {
    label: "Is it easy to follow the recipe instructions? (1-4)"
    type: number
    sql: ${TABLE}.question_4_answer ;;
  }

  dimension: question_5_answer {
    label: "Is it easy to get support from the Purple Carrot team when/if needed? (1-4)"
    type: number
    sql: ${TABLE}.question_5_answer ;;
  }

  dimension: question_6_answer {
    label: "Overall, has Purple Carrot met your expectations? (1-4)"
    type: number
    sql: ${TABLE}.question_6_answer ;;
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

  measure: average_ease {
    type: average
    sql: ${question_5_answer} ;;
  }
}
