view: admin_subscriptions {
  sql_table_name: heroku_postgres.subscriptions ;;
  drill_fields: [id]

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

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
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

  dimension: account_designation {
    type: number
    sql: ${TABLE}.account_designation ;;
  }

  dimension: billed_or_bill_error_orders_count {
    type: number
    sql: ${TABLE}.billed_or_bill_error_orders_count ;;
  }

  dimension: billed_with_extras_orders_count {
    type: number
    sql: ${TABLE}.billed_with_extras_orders_count ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
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

  dimension: deprecated_legacy_6servin_customer {
    type: yesno
    sql: ${TABLE}.deprecated_legacy_6servin_customer ;;
  }

  dimension: deprecated_legacy_tb12_plan {
    type: yesno
    sql: ${TABLE}.deprecated_legacy_tb12_plan ;;
  }

  dimension: deprecated_preselected_new_plan {
    type: string
    sql: ${TABLE}.deprecated_preselected_new_plan ;;
  }

  dimension: deprecated_sms_notification_enabled {
    type: yesno
    sql: ${TABLE}.deprecated_sms_notification_enabled ;;
  }

  dimension: deprecated_stripe_cc_exp_month {
    type: string
    sql: ${TABLE}.deprecated_stripe_cc_exp_month ;;
  }

  dimension: deprecated_stripe_cc_exp_year {
    type: string
    sql: ${TABLE}.deprecated_stripe_cc_exp_year ;;
  }

  dimension: deprecated_stripe_cc_last_four {
    type: string
    sql: ${TABLE}.deprecated_stripe_cc_last_four ;;
  }

  dimension: deprecated_stripe_cc_type {
    type: string
    sql: ${TABLE}.deprecated_stripe_cc_type ;;
  }

  dimension: deprecated_stripe_customer_id {
    type: string
    sql: ${TABLE}.deprecated_stripe_customer_id ;;
  }

  dimension: deprecated_stripe_token {
    type: string
    sql: ${TABLE}.deprecated_stripe_token ;;
  }

  dimension: extra_breakfasts {
    type: number
    sql: ${TABLE}.extra_breakfasts ;;
  }

  dimension: extra_dinners {
    type: number
    sql: ${TABLE}.extra_dinners ;;
  }

  dimension: extra_lunches {
    type: number
    sql: ${TABLE}.extra_lunches ;;
  }

  dimension: first_applied_coupon_code {
    type: string
    sql: ${TABLE}.first_applied_coupon_code ;;
  }

  dimension: giveaway_id {
    type: number
    sql: ${TABLE}.giveaway_id ;;
  }

  dimension: legacy_6servin_customer {
    type: yesno
    sql: ${TABLE}.legacy_6servin_customer ;;
  }

  dimension: legacy_tb12_plan {
    type: yesno
    sql: ${TABLE}.legacy_tb12_plan ;;
  }

  dimension_group: menu_schedule_notify {
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
    sql: ${TABLE}.menu_schedule_notify_at ;;
  }

  dimension: number_of_free_boxes {
    type: number
    sql: ${TABLE}.number_of_free_boxes ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: preselected_new_plan {
    type: string
    sql: ${TABLE}.preselected_new_plan ;;
  }

  dimension_group: recipes_changed_notify {
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
    sql: ${TABLE}.recipes_changed_notify_at ;;
  }

  dimension_group: registered {
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
    sql: ${TABLE}.registered_at ;;
  }

  dimension_group: returning_reactivation {
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
    sql: ${TABLE}.returning_reactivation_on ;;
  }

  dimension_group: returning_status_start {
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
    sql: ${TABLE}.returning_status_start_at ;;
  }

  dimension: status {
    type: number
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

  dimension_group: upsell_modal_viewed {
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
    sql: ${TABLE}.upsell_modal_viewed_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: winback {
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
    sql: ${TABLE}.winback_at ;;
  }

  dimension: winback_coupon {
    type: string
    sql: ${TABLE}.winback_coupon ;;
  }

  dimension: winback_type {
    type: string
    sql: ${TABLE}.winback_type ;;
  }

  dimension: winback_utm_campaign {
    type: string
    sql: ${TABLE}.winback_utm_campaign ;;
  }

  dimension: winback_utm_source {
    type: string
    sql: ${TABLE}.winback_utm_source ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
