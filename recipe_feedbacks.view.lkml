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

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
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

  dimension: question_6 {
    label: "How was the quality of the ingredients? (1-5)"
    type: string
    sql: ${TABLE}.question_6_answer ;;
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
    value_format: "0.0"
    sql: ${question_1}*1.0 ;;
  }

  measure: average_flavor {
    type: average
    value_format: "0.0"
    sql: ${question_2}*1.0 ;;
  }

  measure: average_ease {
    type: average
    value_format: "0.0"
    sql: ${question_3}*1.0 ;;
  }

  measure: average_ingredient_quality {
    type: average
    value_format: "0.0"
    sql: ${question_6}*1.0 ;;
  }

  dimension: P_Overall_Reaction{
    type: number
    sql: ${TABLE}.question_1_answer ;;
  }
  dimension: P_Flavor {
    type: number
    sql: ${TABLE}.question_2_answer ;;
  }
  dimension: P_Serving_Size {
    type: number
    sql: ${TABLE}.question_7_answer ;;
  }
  dimension: P_Visual_Expectations {
    type: number
    sql: ${TABLE}.question_8_answer ;;
  }
  dimension: P_Eat_Again {
    type: number
    sql: ${TABLE}.question_9_answer ;;
  }
  dimension: P_Ingredient_Quality {
    type: number
    sql: ${TABLE}.question_6_answer ;;
  }
  dimension: P_Comments {
    type: number
    sql: ${TABLE}.question_5_answer ;;
  }

}
