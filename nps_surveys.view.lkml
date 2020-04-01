view: nps_surveys {
  sql_table_name: heroku_postgres.nps_surveys ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billed_orders_count {
    type: number
    sql: ${TABLE}.billed_orders_count ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: triggered {
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
    sql: ${TABLE}.triggered_at ;;
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

  dimension: question_1_answer {
    label: "How likely are you to recommend Purple Carrot to a friend? (0-10)"
    type: number
    sql: ${TABLE}.question_1_answer ;;
  }



  dimension: question_2_answer {
    label: "Comments"
    type: string
    sql: ${TABLE}.question_2_answer ;;
  }

  dimension: customer_nps_type {
    type: string
    sql:  CASE WHEN ${question_1_answer} > 8 THEN 'Promoter'
          WHEN ${question_1_answer} > 6 THEN 'Passive'
          WHEN ${question_1_answer} > -1 THEN 'Detractor'
          ELSE NULL
          END
          ;;
  }

dimension: follow_up_consent {
  type: yesno
  sql: ${TABLE}.follow_up_consent ;;
}


  measure: promoter_count {
    type: count
    filters: {
      field: customer_nps_type
      value: "Promoter"
    }
  }

  measure: passive_count {
    type: count
    filters: {
      field: customer_nps_type
      value: "Passive"
    }
  }

  measure: detractor_count {
    type: count
    filters: {
      field: customer_nps_type
      value: "Detractor"
    }
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }

  measure: average_nps_answer {
    type: average
    sql: ${question_1_answer} ;;
  }

}
