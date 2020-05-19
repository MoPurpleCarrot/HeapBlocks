view: recipe_feedbacks {
  sql_table_name: heroku_postgres.recipe_feedbacks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: recipe_feedback_survey_id {
    type: number
    sql: ${TABLE}.recipe_feedback_survey_id ;;
  }

  dimension: recipe_id {
    type: number
    sql: ${TABLE}.recipe_id ;;
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

  dimension: question_1 {
    label: "What was your overall reaction to this recipe? (1-5)"
    type: number
    sql: ${TABLE}.question_1_answer ;;
  }

  dimension: question_2 {
    label: "How would you rate the flavor of this recipe? (1-5)"
    type: number
    sql: ${TABLE}.question_2_answer ;;
  }

  dimension: question_3 {
    label: "How easy was this recipe to complete? (1-5)"
    type: number
    sql: ${TABLE}.question_3_answer ;;
  }

  dimension: question_5 {
    label: "Comments"
    type: string
    sql: ${TABLE}.question_5_answer ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: average_overall {
    type: average
    value_format: "#.#;(#.#)"
    sql: ${question_1} ;;
  }

  measure: average_flavor {
    type: average
    value_format: "#.#;(#.#)"
    sql: ${question_2} ;;
  }

  measure: average_ease {
    type: average
    value_format: "#.#;(#.#)"
    sql: ${question_3} ;;
  }




}
