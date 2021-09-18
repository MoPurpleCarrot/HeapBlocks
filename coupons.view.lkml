view: coupons {
  sql_table_name: heroku_postgres.coupons ;;

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

  dimension: admin_only {
    type: yesno
    sql: ${TABLE}.admin_only ;;
  }

  dimension: allowed_orders_counts {
    type: string
    sql: ${TABLE}.allowed_orders_counts ;;
  }

  dimension: allowed_plans {
    type: string
    sql: ${TABLE}.allowed_plans ;;
  }

  dimension: allowed_statuses {
    type: string
    sql: ${TABLE}.allowed_statuses ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: default_for_signup {
    type: yesno
    sql: ${TABLE}.default_for_signup ;;
  }

  dimension: default_for_unpausing {
    type: yesno
    sql: ${TABLE}.default_for_unpausing ;;
  }

  dimension: dollar_off {
    type: number
    sql: ${TABLE}.dollar_off ;;
  }

  dimension_group: expire {
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
    sql: ${TABLE}.expire_at ;;
  }

  dimension: friend_referral {
    type: yesno
    sql: ${TABLE}.friend_referral ;;
  }

  dimension: deprecated_new_member_only {
    type: yesno
    sql: ${TABLE}.new_member_only ;;
    hidden: yes
  }

  dimension: orders_count {
    type: number
    sql: ${TABLE}.orders_count ;;
  }

  dimension: percentage_off {
    type: number
    sql: ${TABLE}.percentage_off ;;
  }

  dimension: recurring {
    type: yesno
    sql: ${TABLE}.recurring ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
    drill_fields: [id]
  }
}
