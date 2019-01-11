view: subscriptions {
  sql_table_name: heroku_postgres.subscriptions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }

  dimension_group: sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: yes
  }

  dimension: sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
  }

  dimension_group: registered_at {
    type: time
    timeframes: [raw, time, date, week, month, year]
    sql: ${TABLE}.registered_at ;;
  }

  dimension: billed_or_bill_error_orders_count {
    type: number
    sql: ${TABLE}.billed_or_bill_error_orders_count ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: plan_name {
    type: string
    sql:  CASE WHEN ${plan} = 0 THEN 'Core'
    WHEN ${plan} = 1 THEN 'Family'
    WHEN ${plan} = 2 THEN 'TB12'
    WHEN ${plan} = 3 THEN 'Chefs Choice'
    WHEN ${plan} = 4 THEN 'Quick and Easy'
    WHEN ${plan} = 5 THEN 'High Protein'
    ELSE NULL
    END
    ;;
  }

  dimension: status_code {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: preselected_meal_portfolio_plan_2018 {
    type: string
    sql: ${TABLE}.preselected_new_plan ;;
  }

  dimension: status {
    type: string
    sql:  CASE WHEN ${status_code} = 0 THEN 'Inactive'
          WHEN ${status_code} = 1 THEN 'Active'
          WHEN ${status_code} = 2 THEN 'Cancelled'
          WHEN ${status_code} = 3 THEN 'Paused'
          WHEN ${status_code} = 4 THEN 'Skipped'
          WHEN ${status_code} = 5 THEN 'Suspended'
          WHEN ${status_code} = 6 THEN 'Force Skip'
          WHEN ${status_code} = 7 THEN 'Returning'
          ELSE NULL
          END
          ;;
  }

  dimension: account_designation {
    type: number
    sql: ${TABLE}.account_designation ;;
  }

  dimension: account_designation_bucket {
    type: string
    sql: CASE WHEN ${account_designation} = 0 THEN 'Standard'
          WHEN ${account_designation} = 1 THEN 'Employee'
          WHEN ${account_designation} = 2 THEN 'Comp'
          WHEN ${account_designation} = 3 THEN 'VIP'
          ELSE 'Standard'
          END
          ;;
  }

  dimension: cc_exp_month {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_exp_month ;;
  }

  dimension: cc_exp_year {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_exp_year ;;
  }

  dimension: cc_last_four {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_last_four ;;
  }

  dimension: cc_type {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_type ;;
  }

  dimension: stripe_customer_id {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_customer_id ;;
  }

  dimension: stripe_token {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_token ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.business_name,
      users.first_name,
      users.id,
      users.last_name,
      orders.count
    ]
  }


#Pulling in winbacks


  dimension_group: winback {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.winback_at ;;
  }

  dimension_group: winback_plus4 {
    type: time
    hidden:  yes
    sql: dateadd('day','4', ${winback_date}) ;;
  }


  dimension: winback_coupon {
    type: string
    sql: ${TABLE}.winback_coupon ;;
  }

  dimension: winback_type {
    type: string
    sql: ${TABLE}.winback_type ;;
  }

  dimension: winback_utm_source {
    type: string
    sql: ${TABLE}.winback_utm_source ;;
  }

  dimension: winback_utm_campaign {
    type: string
    sql: ${TABLE}.winback_utm_campaign ;;
  }

  dimension: extra_dinners {
    type: number
    sql: ${TABLE}.extra_dinners ;;
  }

  dimension: extra_lunch {
    type: number
    sql: ${TABLE}.extra_lunch ;;
  }

  dimension: extra_breakfast {
    type: number
    sql: ${TABLE}.extra_breakfast ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: clean_winback_utm_source{
    case: {

      when: {
        sql:  ${TABLE}.winback_coupon = 'pcsum18'OR ${TABLE}.winback_coupon = 'pcfall18' ;;
        label: "direct mail"
      }
      when: {
        sql: ${TABLE}.winback_utm_source = 'Organic' OR ${TABLE}.winback_utm_source = 'organic'  ;;
        label: "organic"
      }
      when: {
        sql: ${TABLE}.winback_utm_source = 'adwordsb' OR ${TABLE}.winback_utm_source = 'adwordsb_w' OR ${TABLE}.winback_utm_source = 'adwordsb_i' ;;
        label: "adwords branded"
      }
      when: {
        sql: ${TABLE}.winback_utm_source = 'adwordstb';;
        label: "adwordstb12"
      }
      when: {
        sql: ${TABLE}.winback_utm_source = 'adwordsg_w' ;;
        label: "adwords gmail"
      }
      when: {
        sql: ${TABLE}.winback_utm_source = 'adwordsnb' ;;
        label: "adwords non-branded"
      }

      when: {
        sql: ${TABLE}.winback_utm_source = 'Facebook'OR ${TABLE}.winback_utm_source = 'facebook';;
        label: "facebook"
      }
      when: {
        sql: ${TABLE}.winback_utm_source = 'bingb' ;;
        label: "bing branded"
      }
    }
  }


  dimension_group: returning_status_start_at {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returning_status_start_at ;;
  }

  dimension_group: returning_reactivation_on {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returning_reactivation_on ;;
  }

  dimension: returning_days{
    type: number
    sql: diffdays(${returning_status_start_at_week}, ${returning_reactivation_on_week}) ;;
  }

  dimension: Returning_weeks{
    type: number
    sql: datediff('week',${returning_status_start_at_week}, ${returning_reactivation_on_week}) ;;
  }


}
