view: welcome_surveys {
  sql_table_name: heroku_postgres.welcome_surveys ;;

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

  dimension_group: birthday {
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
    sql: ${TABLE}.birthday ;;
  }

  dimension: age_group{
    type: string
    sql:  CASE WHEN diff_years(${birthday_year},now()) < 25 THEN '<25'
      else NULL
      END;;
  }

  dimension: chosen_meal_kit {
    type: string
    sql: ${TABLE}.chosen_meal_kit ;;
  }

  dimension: chosen_meal_kit_other {
    type: string
    sql: ${TABLE}.chosen_meal_kit_other ;;
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

  dimension: cooking_experience {
    type: number
    sql: ${TABLE}.cooking_experience ;;
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

  dimension: eating_habits {
    type: string
    sql: ${TABLE}.eating_habits ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: have_you_tried_other_meals {
    type: string
    sql: ${TABLE}.have_you_tried_other_meals ;;
  }

  dimension: how_did_you_hear_about {
    type: string
    sql: ${TABLE}.how_did_you_hear_about ;;
  }

  dimension: how_did_you_hear_about_other {
    type: string
    sql: ${TABLE}.how_did_you_hear_about_other ;;
  }

  dimension: improving_health_and_wellbeing {
    type: number
    sql: ${TABLE}.improving_health_and_wellbeing ;;
  }

  dimension: number_of_people_in_household {
    type: string
    sql: ${TABLE}.number_of_people_in_household ;;
  }

  dimension: using_pc {
    type: string
    sql: ${TABLE}.using_pc ;;
  }

  dimension: primary_reason {
    type: string
    sql: ${TABLE}.primary_reason ;;
  }

  dimension: primary_reason_other {
    type: string
    sql: ${TABLE}.primary_reason_other ;;
  }

  dimension: protecting_animals {
    type: number
    sql: ${TABLE}.protecting_animals ;;
  }

  dimension: protecting_env_and_climate {
    type: number
    sql: ${TABLE}.protecting_env_and_climate ;;
  }

  dimension: top_env_mission {
    case:{
      when:{
        sql: ${protecting_env_and_climate} = 5 ;;
        label: "Top"
      }
      else: "Not Top"
      }
      }

  dimension: top_health_mission {
    case:{
      when:{
        sql: ${improving_health_and_wellbeing} = 5 ;;
        label: "Top"
      }
      else: "Not Top"
    }
  }

  dimension: top_animal_mission {
    case:{
      when:{
        sql: ${protecting_animals} = 5 ;;
        label: "Top"
      }
      else: "Not Top"
    }
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

  measure: total_env_score {
    type: sum
    sql: ${protecting_env_and_climate} ;;
  }

  measure: avg_env_score {
    type: average
    sql: ${protecting_env_and_climate} ;;
  }

  measure: total_animal_score {
    type: sum
    sql: ${protecting_animals} ;;
  }

  measure: avg_animal_score {
    type: average
    sql: ${protecting_animals} ;;
  }

  measure: total_health_score {
    type: sum
    sql: ${improving_health_and_wellbeing} ;;
  }

  measure: avg_health_score {
    type: average
    sql: ${improving_health_and_wellbeing} ;;
  }

}
