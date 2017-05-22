view: delighted {
  sql_table_name: delighted.data ;;

  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}.__sdc_primary_key ;;
    primary_key: yes
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

  dimension: event_data__comment {
    type: string
    sql: ${TABLE}.event_data__comment ;;
  }

  dimension: event_data__created_at {
    type: number
    sql: ${TABLE}.event_data__created_at ;;
  }

  dimension_group: created_at {
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
    sql: ${event_data__created_at} ;;
    datatype: epoch
  }

  dimension: event_data__id {
    type: string
    sql: ${TABLE}.event_data__id ;;
  }

  dimension: event_data__permalink {
    type: string
    sql: ${TABLE}.event_data__permalink ;;
  }

  dimension: event_data__person__created_at {
    type: number
    sql: ${TABLE}.event_data__person__created_at ;;
  }

  dimension: event_data__person__email {
    type: string
    sql: ${TABLE}.event_data__person__email ;;
  }

  dimension: event_data__person__id {
    type: string
    sql: ${TABLE}.event_data__person__id ;;
  }

  dimension: event_data__person__name {
    type: string
    sql: ${TABLE}.event_data__person__name ;;
  }

  dimension: event_data__person_properties__collection {
    type: string
    sql: ${TABLE}.event_data__person_properties__collection ;;
  }

  dimension: event_data__person_properties__coupon_code {
    type: string
    sql: ${TABLE}.event_data__person_properties__coupon_code ;;
  }

  dimension: event_data__person_properties__email {
    type: string
    sql: ${TABLE}.event_data__person_properties__email ;;
  }

  dimension: event_data__person_properties__first_meal_1 {
    type: string
    sql: ${TABLE}.event_data__person_properties__first_meal ;;
  }

  dimension: event_data__person_properties__first_meal_2 {
    type: string
    sql: ${TABLE}."event_data__person_properties__first meal" ;;
  }

  dimension: event_data__person_properties__new_vs_repeat {
    type: string
    sql: ${TABLE}."event_data__person_properties__new vs repeat" ;;
  }

  dimension: event_data__person_properties__order_count {
    type: string
    sql: ${TABLE}.event_data__person_properties__order_count ;;
  }

  dimension: event_data__person_properties__partner {
    type: string
    sql: ${TABLE}.event_data__person_properties__partner ;;
  }

  dimension: event_data__person_properties__plan {
    type: string
    sql: ${TABLE}.event_data__person_properties__plan ;;
  }

  dimension: event_data__person_properties__purchase_ {
    type: string
    #"
    sql: ${TABLE}."event_data__person_properties__purchase ;;
  }

  dimension: event_data__person_properties__purchase_experience {
    type: string
    sql: ${TABLE}.event_data__person_properties__purchase_experience ;;
  }

  dimension: event_data__person_properties__question_product_name {
    type: string
    sql: ${TABLE}."event_data__person_properties__question product name" ;;
  }

  dimension: event_data__person_properties__region {
    type: string
    sql: ${TABLE}.event_data__person_properties__region ;;
  }

  dimension: event_data__person_properties__second_meal_1 {
    type: string
    sql: ${TABLE}.event_data__person_properties__second_meal ;;
  }

  dimension: event_data__person_properties__second_meal_2 {
    type: string
    sql: ${TABLE}."event_data__person_properties__second meal" ;;
  }

  dimension: event_data__person_properties__snack {
    type: string
    sql: ${TABLE}.event_data__person_properties__snack ;;
  }

  dimension: event_data__person_properties__state {
    type: string
    sql: ${TABLE}.event_data__person_properties__state ;;
  }

  dimension: event_data__person_properties__third_meal {
    type: string
    sql: ${TABLE}.event_data__person_properties__third_meal ;;
  }

  dimension: event_data__person_properties__tnt {
    type: string
    sql: ${TABLE}.event_data__person_properties__tnt ;;
  }

  dimension: event_data__score {
    type: number
    sql: ${TABLE}.event_data__score ;;
  }

  dimension: customer_type {
    type: string
    sql:  CASE WHEN ${event_data__score} > 8 THEN 'Promoter'
          WHEN ${event_data__score} > 6 THEN 'Passive'
          WHEN ${event_data__score} > -1 THEN 'Detractor'
          ELSE NULL
          END
          ;;
  }

  measure: promoter_count {
    type: count
    filters: {
      field: customer_type
      value: "Promoter"
    }
  }

  measure: passive_count {
    type: count
    filters: {
      field: customer_type
      value: "Passive"
    }
  }

  measure: detractor_count {
    type: count
    filters: {
      field: customer_type
      value: "Detractor"
    }
  }

  dimension: event_data__updated_at {
    type: number
    sql: ${TABLE}.event_data__updated_at ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: test {
    type: yesno
    sql: ${TABLE}.test ;;
  }

  dimension: trigger__name {
    type: string
    sql: ${TABLE}.trigger__name ;;
  }

  dimension: trigger__url {
    type: string
    sql: ${TABLE}.trigger__url ;;
  }

  measure: average_NPS_score  {
    type: average
    sql: ${event_data__score} ;;
  }

  measure: total_NPS_score  {
    type: sum
    sql: ${event_data__score} ;;
  }


  measure: count {
    type: count
    drill_fields: [event_data__person__name, event_data__person_properties__question_product_name, trigger__name]
  }
}
