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
    timeframes: [raw, time, date, day_of_week, week, month, quarter, year]
    sql: ${TABLE}.registered_at ;;
  }

  dimension: billed_or_bill_error_orders_count {
    type: number
    sql: ${TABLE}.billed_or_bill_error_orders_count ;;
    hidden: yes
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
    hidden: yes
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
    hidden: yes
  }

  dimension: plan_name {
    type: string
    sql:  CASE WHEN ${plan} = 0 THEN 'Core'
    WHEN ${plan} = 1 THEN 'Family'
    WHEN ${plan} = 2 THEN 'TB12'
    WHEN ${plan} = 3 THEN 'Chefs Choice'
    WHEN ${plan} = 4 THEN 'Quick and Easy'
    WHEN ${plan} = 5 THEN 'High Protein'
    WHEN ${plan} = 6 THEN 'Six Serving'
    WHEN ${plan} = 7 THEN 'Gluten Free'
    WHEN ${plan} = 8 THEN 'Four Serving'
    WHEN ${plan} = 10 THEN 'Prepared'
    ELSE NULL
    END
    ;;
  }
  dimension: prepared_pilot_plan {
    type: string
    sql:  CASE WHEN ${plan} < 9 THEN 'Meal Kit'
          WHEN ${plan} = 10 THEN 'Prepared'
          ELSE NULL
          END
          ;;
  }

  dimension: status_code {
    type: number
    sql: ${TABLE}.status ;;
    hidden: yes
  }

  dimension: preselected_meal_portfolio_plan_2018 {
    type: string
    sql: ${TABLE}.preselected_new_plan ;;
    hidden: yes
  }

  dimension: status {
    type: string
    sql:  CASE WHEN ${status_code} = 0 THEN 'Inactive'
          WHEN ${status_code} = 1 THEN 'Active'
          WHEN ${status_code} = 2 THEN 'Cancelled'
          WHEN ${status_code} = 3 THEN 'Paused'
          WHEN ${status_code} = 4 THEN 'Skipped'
          WHEN ${status_code} = 5 THEN 'Suspended'
          WHEN ${status_code} = 6 THEN 'Delayed Start'
          WHEN ${status_code} = 7 THEN 'Returning'
          ELSE NULL
          END
          ;;
  }

  dimension: active_status_bucket {
    type: string
    sql:  CASE WHEN ${status} = 'Active' THEN 'Active'
          WHEN ${status} = 'Skipped' THEN 'Active'
          WHEN ${status} = 'Returning' THEN 'Active'
          WHEN ${status} = 'Delayed Start' THEN 'Active'
          WHEN ${status} = 'Cancelled' THEN 'Cancelled'
          WHEN ${status} = 'Paused' THEN 'Cancelled'
          WHEN ${status} = 'Suspended' THEN 'Cancelled'
          ELSE NULL
          END
          ;;
    hidden: yes
  }

  dimension: account_designation {
    type: number
    sql: ${TABLE}.account_designation ;;
    hidden:  yes
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
    hidden: yes
  }

  dimension: cc_exp_month {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_exp_month ;;
    hidden:  yes
  }

  dimension: cc_exp_year {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_exp_year ;;
    hidden:  yes
  }

  dimension: cc_last_four {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_last_four ;;
    hidden:  yes
  }

  dimension: cc_type {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_cc_type ;;
    hidden:  yes
  }

  dimension: stripe_customer_id {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_customer_id ;;
    hidden:  yes
  }

  dimension: stripe_token {
    group_label: "Stripe Info"
    type: string
    sql: ${TABLE}.stripe_token ;;
    hidden:  yes
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden:  yes
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden:  yes
  }

  dimension: legacy_sixserving_customer {
    type: string
    sql: ${TABLE}.legacy_6servin_customer ;;
    hidden:  yes
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
    sql: dateadd('day','4', ${winback_date}) ;;
    hidden:  yes
  }

  dimension_group: registered_plus4 {
    type: time
    sql: dateadd('day','4', ${registered_at_date}) ;;
    hidden:  yes
  }

  dimension: winback_coupon {
    type: string
    sql: ${TABLE}.winback_coupon ;;
  }

  dimension: winback_type {
    type: string
    sql: ${TABLE}.winback_type ;;
    hidden:  yes
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

  dimension: extra_lunches {
    type: number
    sql: ${TABLE}.extra_lunches ;;
  }

  dimension: extra_breakfasts {
    type: number
    sql: ${TABLE}.extra_breakfasts ;;
  }

  dimension: legacy_tb12_plan {
    type: number
    sql: ${TABLE}.legacy_tb12_plan ;;
    hidden:  yes
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: winback_utm_source_groups {
    type: string
    sql: case when ${coupons.code} = 'pcjan21' then 'Direct Mail'
        when ${coupons.code} = 'letsdothispc21' then 'Direct Mail'
        when lower(${winback_utm_source}) like '%facebook%' then 'Facebook'
        when ${winback_utm_source} like '%FB%' then 'Facebook'
        when ${winback_utm_source} like '%winback_utm_source%' then 'Facebook'
        when ${winback_utm_source} = 'affiliate' then 'Affiliate'
        when ${winback_utm_source} = 'sfm' then 'SAB'
        when ${winback_utm_source} like '%pin%' then 'Pinterest'
        when ${winback_utm_source} like '%bing%' then 'Bing B'
        when ${winback_utm_source} like '%adwordsdis%' then 'Google Discovery'
        when ${winback_utm_source} like '%adwordsb%' then 'Adwords B'
        when lower(${winback_utm_source}) like '%adwords%' then 'Adwords NB'
        when ${winback_utm_source} like '%veganbox%' then 'Adwords NB'
        when ${winback_utm_source} = 'gift' then 'Gift'
        when lower(${winback_utm_source}) = 'organic' then 'Organic'
        when ${winback_utm_source} = 'none' then 'Organic'
        when ${winback_utm_source} is null then 'Organic'
        Else 'Organic'
        End
    ;;
    }

    dimension: winback_utm_source_groups_no_dm {
      type: string
      sql: case
        when lower(${winback_utm_source}) like '%facebook%' then 'Facebook'
        when ${winback_utm_source} like '%FB%' then 'Facebook'
        when ${winback_utm_source} like '%winback_utm_source%' then 'Facebook'
        when ${winback_utm_source} = 'affiliate' then 'Affiliate'
        when ${winback_utm_source} = 'sfm' then 'SAB'
        when ${winback_utm_source} like '%pin%' then 'Pinterest'
        when ${winback_utm_source} like '%bing%' then 'Bing B'
        when ${winback_utm_source} like '%adwordsdis%' then 'Google Discovery'
        when ${winback_utm_source} like '%adwordsb%' then 'Adwords B'
        when lower(${winback_utm_source}) like '%adwords%' then 'Adwords NB'
        when ${winback_utm_source} like '%veganbox%' then 'Adwords NB'
        when ${winback_utm_source} = 'gift' then 'Gift'
        when lower(${winback_utm_source}) = 'organic' then 'Organic'
        when ${winback_utm_source} = 'none' then 'Organic'
        when ${winback_utm_source} is null then 'Organic'
        Else 'Organic'
        End
    ;;
  }


  dimension_group: returning_status_start_at {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returning_status_start_at ;;
    hidden: yes
  }

  dimension_group: returning_reactivation_on {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.returning_reactivation_on ;;
    hidden: yes
  }

  dimension: returning_days{
    type: number
    sql: diffdays(${returning_status_start_at_week}, ${returning_reactivation_on_week}) ;;
    hidden:  yes
  }

  dimension: Returning_weeks{
    type: number
    sql: datediff('week',${returning_status_start_at_week}, ${returning_reactivation_on_week}) ;;
    hidden:  yes
  }

  dimension: giveaway_id{
    type: number
    sql: ${TABLE}.giveaway_id ;;
  }


}
