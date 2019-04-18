view: weekly_orders_trackings {
  sql_table_name: heroku_postgres.weekly_orders_trackings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: chefs_choice {
    type: number
    sql: ${TABLE}.chefs_choice ;;
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

  dimension_group: delivery {
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
    sql: ${TABLE}.delivery_on ;;
  }

  dimension: high_protein {
    type: number
    sql: ${TABLE}.high_protein ;;
  }

  dimension: meal_a {
    type: number
    sql: ${TABLE}.meal_a ;;
  }

  dimension: meal_b {
    type: number
    sql: ${TABLE}.meal_b ;;
  }

  dimension: meal_c {
    type: number
    sql: ${TABLE}.meal_c ;;
  }

  dimension: meal_d {
    type: number
    sql: ${TABLE}.meal_d ;;
  }

  dimension: meal_e {
    type: number
    sql: ${TABLE}.meal_e ;;
  }

  dimension: meal_f {
    type: number
    sql: ${TABLE}.meal_f ;;
  }

  dimension: meal_g {
    type: number
    sql: ${TABLE}.meal_g ;;
  }

  dimension: meal_h {
    type: number
    sql: ${TABLE}.meal_h ;;
  }

  dimension: meal_i {
    type: number
    sql: ${TABLE}.meal_i ;;
  }

  dimension: meal_j {
    type: number
    sql: ${TABLE}.meal_j ;;
  }

  dimension: meal_m {
    type: number
    sql: ${TABLE}.meal_m ;;
  }

  dimension: meal_n {
    type: number
    sql: ${TABLE}.meal_n ;;
  }

  dimension: meal_q {
    type: number
    sql: ${TABLE}.meal_q ;;
  }

  dimension: meal_r {
    type: number
    sql: ${TABLE}.meal_r ;;
  }

  dimension: menu_id {
    type: number
    sql: ${TABLE}.menu_id ;;
  }

  dimension: quick_easy {
    type: number
    sql: ${TABLE}.quick_easy ;;
  }

  dimension: region_name_code {
    type: string
    hidden: yes
    sql: ${TABLE}.region_name ;;
  }

  dimension: region_name {
    type: string
    sql:  CASE WHEN ${region_name_code} = 'get_fresh_las_vegas' THEN '1. Get Fresh'
    WHEN ${region_name_code} = 'spezia_parsippany' THEN '2. ShipOnce'
    WHEN ${region_name_code} = 'fdm_chicago' THEN '3. FDM'
    ELSE NULL
    END
    ;;
  }

  dimension: six_servings {
    type: number
    sql: ${TABLE}.six_servings ;;
  }

  dimension: tb_12 {
    type: number
    sql: ${TABLE}.tb_12 ;;
  }

  dimension: total_meals_count {
    type: number
    sql: ${TABLE}.total_meals_count ;;
  }

  dimension: total_orders_count {
    type: number
    sql: ${TABLE}.total_orders_count ;;
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

  measure: count {
    type: count
    drill_fields: [id, region_name]
  }

  measure: sum_QE {
    type: sum
    sql: ${TABLE}.quick_easy ;;
  }

  measure: sum_CC {
    type: sum
    sql: ${TABLE}.chefs_choice ;;
  }

  measure: sum_HP {
    type: sum
    sql: ${TABLE}.high_protein ;;
  }

  measure: sum_TB12 {
    type: sum
    sql: ${TABLE}.tb_12 ;;
  }
}
