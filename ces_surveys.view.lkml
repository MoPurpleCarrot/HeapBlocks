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

  measure: count_q1_10 {
    type: count
    filters: {
      field: question_1_answer
      value: "10"
    }
  }

  measure: count_q1_9 {
    type: count
    filters: {
      field: question_1_answer
      value: "9"
    }
  }

  measure: count_q1_8 {
    type: count
    filters: {
      field: question_1_answer
      value: "8"
    }
  }

  measure: count_q1_7 {
    type: count
    filters: {
      field: question_1_answer
      value: "7"
    }
  }

  measure: count_q1_6 {
    type: count
    filters: {
      field: question_1_answer
      value: "6"
    }
  }

  measure: count_q1_5 {
    type: count
    filters: {
      field: question_1_answer
      value: "5"
    }
  }

  measure: count_q1_4 {
    type: count
    filters: {
      field: question_1_answer
      value: "4"
    }
  }


  measure: count_q1_3 {
    type: count
    filters: {
      field: question_1_answer
      value: "3"
    }
  }

  measure: count_q1_2 {
    type: count
    filters: {
      field: question_1_answer
      value: "2"
    }
  }

  measure: count_q1_1 {
    type: count
    filters: {
      field: question_1_answer
      value: "1"
    }
  }

  measure: count_q1_0 {
    type: count
    filters: {
      field: question_1_answer
      value: "0"
    }
  }



  measure: average_recommends {
    type: average
    sql: ${question_1_answer} ;;
  }

  measure: average_subscriber {
    type: average
    sql: ${question_2_answer} ;;
  }

  measure: average_website {
    type: average
    sql: ${question_3_answer} ;;
  }

  measure: average_instructions {
    type: average
    sql: ${question_4_answer} ;;
  }

  measure: average_support {
    type: average
    sql: ${question_5_answer} ;;
  }

  measure: average_expectations {
    type: average
    sql: ${question_6_answer} ;;
  }

}
