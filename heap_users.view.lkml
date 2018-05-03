view: heap_users {
  sql_table_name: main_production.users ;;

  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: _email {
    type: string
    sql: ${TABLE}._email ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_coupon_code_user_by_user {
    type: string
    sql: ${TABLE}.first_coupon_code_user_by_user ;;
  }

  dimension: handle {
    type: string
    sql: ${TABLE}.handle ;;
  }

  dimension: identity {
    type: string
    sql: ${TABLE}."identity" ;;
  }

  dimension_group: joindate {
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
    sql: ${TABLE}.joindate ;;
  }

  dimension_group: last_modified {
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
    sql: ${TABLE}.last_modified ;;
  }

  dimension: orders {
    type: string
    sql: ${TABLE}.orders ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: registered_at {
    type: string
    sql: ${TABLE}.registered_at ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tnt {
    type: string
    sql: ${TABLE}.tnt ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: vwo_test_id_48 {
    type: string
    sql: ${TABLE}.vwo_test_id_48 ;;
  }

  measure: count {
    type: count
    drill_fields: [user_id]
  }

  measure: count_second_touch {
    type: count_distinct
    filters: {
      field: heap_account_created.account_created_date
      value: "-NULL"
    }
    sql_distinct_key: user_id ;;
    drill_fields: [user_id]
  }
}
