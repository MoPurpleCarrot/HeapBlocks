view: users {
  sql_table_name: heroku_postgres.users ;;

  dimension: id {
    primary_key: yes
    type: number
    value_format_name: id
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

  dimension: account_number {
    type: number
    value_format_name: id
    sql: ${TABLE}.account_number ;;
    hidden: yes
  }

  dimension_group: cancelled {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: vwo_signup_ab_test_variants {
    type: string
    sql:${TABLE}.vwo_signup_ab_test_variants ;;
    }

    dimension:prepared_new_customers{
    type: string
    sql:  CASE
        WHEN ${vwo_signup_ab_test_variants} LIKE '%"208":"2"%' THEN 'Prepared and Meal Kit'
        WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"2"%' THEN 'Prepared and Meal Kit'
        WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"3"%' THEN 'Prepared and Meal Kit'
        WHEN (${vwo_signup_ab_test_variants} LIKE '%"248"%' and ${vwo_signup_ab_test_variants} NOT LIKE'%0%') THEN 'Prepared and Meal Kit'
        WHEN ${vwo_signup_ab_test_variants} LIKE '%"208":"1"%' THEN 'Meal Kit Only'
        WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"1"%' THEN 'Meal Kit Only'

    ELSE NULL
    END;;
    }

  dimension:prepared_new_customers_menu_test{
    type: string
    sql:  CASE
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"2"%' THEN 'Prepared and Meal Kit'
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"3"%' THEN 'Prepared and Meal Kit'
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"1"%' THEN 'Meal Kit Only'

          ELSE NULL
          END;;
    hidden: yes
  }

  dimension:prepared_new_customers_menu_test_breakout{
    type: string
    sql:  CASE
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"2"%' THEN 'Prepared and Meal Kit - Current Menu'
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"3"%' THEN 'Prepared and Meal Kit - Cycle 1 Menu'
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"1"%' THEN 'Meal Kit Only'

          ELSE NULL
          END;;
    hidden: yes
  }


  dimension: ab_tests {
    type: string
    sql:${TABLE}.ab_tests ;;
  }

  dimension:prepared_current_customers{
    type: string
    sql:  CASE WHEN ${ab_tests} = '{"prepared": 2}' THEN 'Prepared and Meal Kit'
          WHEN ${ab_tests} = '{"prepared": 1}' THEN 'Meal Kit Only'
          ELSE NULL
          END;;
  }

  dimension:Preferences_ABtestgroups{
    type: string
    sql:  CASE WHEN ${ab_tests} = '{"recipe_preferences": 2}' THEN 'Variant'
          WHEN ${ab_tests} = '{"recipe_preferences": 1}' THEN 'Control'
          ELSE NULL
          END;;
  }

  dimension: weeks_as_customer {
    type: number
    sql: DATEDIFF(WEEKS, ${created_raw}, CASE WHEN ${cancelled_raw} IS NULL THEN current_date ELSE ${cancelled_raw} END) ;;
    html: {% if value < 50 %}
      <div style="color: white; background-color: darkred; font-size: 80%; text-align:center; margin-bottom: 10px">{{ rendered_value }}</div>
      {% elsif value < 70 %}
      <div style="color: black; background-color: goldenrod; font-size: 80%; text-align:center; margin-bottom: 10px">{{ rendered_value }}</div>
      {% else %}
      <div style="color: white; background-color: darkgreen; font-size: 80%; text-align:center; margin-bottom: 10px">{{ rendered_value }}</div>
      {% endif %}
      ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: credit {
    type: number
    sql: ${TABLE}.credit ;;
    value_format_name: usd
    html: {% if value < 50 %}
      <div style="color: white; background-color: darkred; font-size: 80%; text-align:center; margin-bottom: 10px">{{ rendered_value }}</div>
      {% elsif value < 70 %}
      <div style="color: black; background-color: goldenrod; font-size: 80%; text-align:center; margin-bottom: 10px">{{ rendered_value }}</div>
      {% else %}
      <div style="color: white; background-color: darkgreen; font-size: 80%; text-align:center; margin-bottom: 10px">{{ rendered_value }}</div>
      {% endif %}
      ;;
  }

  measure: total_credit {
    type: sum
    value_format_name: usd
    sql: ${credit} ;;
    }

  measure: total_employee_credit {
    type: sum
    value_format_name: usd
    sql: ${credit} ;;

    filters: {
      field: is_purple_carrot_employee
      value: "yes"
    }
  }

  dimension: credit_before_migration {
    type: number
    sql: ${TABLE}.credit_before_migration ;;
    hidden: yes
  }

  dimension_group: current_sign_in {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.current_sign_in_at ;;
    hidden: yes
  }

  dimension: current_sign_in_ip {
    type: string
    group_label: "Location"
    sql: ${TABLE}.current_sign_in_ip ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_domain {
    type: string
    sql: regexp_substr(email,'@[^.]*') ;;
  }

  dimension: is_purple_carrot_employee {
    type: yesno
    sql: ${email} LIKE '%purplecarrot%' ;;
    hidden: yes
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}.encrypted_password ;;
    hidden: yes
  }

  dimension: generated_password {
    type: yesno
    sql: ${TABLE}.generated_password ;;
    hidden: yes
  }

  dimension: giveaway_points {
    type: number
    sql: ${TABLE}.giveaway_points ;;
    hidden: yes
  }

  dimension: giveaway_redemption_token {
    type: string
    sql: ${TABLE}.giveaway_redemption_token ;;
    hidden: yes
  }

  dimension: is_blocked_from_ordering {
    type: yesno
    sql: ${TABLE}.is_blocked_from_ordering ;;
    hidden: yes
  }

  dimension: is_residential {
    type: yesno
    sql: ${TABLE}.is_residential ;;
    hidden: yes
  }

  dimension_group: last_mailchimp_update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_mailchimp_update_at ;;
    hidden: yes
  }

  dimension_group: last_sign_in {
    type: time
    timeframes: [
      time,
      date,
      week,
      month,
      year,
      day_of_week
    ]
    sql: ${TABLE}.last_sign_in_at ;;
    hidden: yes
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}.last_sign_in_ip ;;
    hidden: yes
  }

  dimension: partner_token {
    type: string
    sql: ${TABLE}.partner_token ;;
    hidden: yes
  }

  dimension_group: paused {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paused_at ;;
    hidden: yes
  }

  dimension_group: suspended {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.suspended_at ;;
    hidden: yes
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
    hidden: yes
  }

  dimension_group: reactivated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reactivation_on ;;
    hidden: yes
  }

  dimension: is_referrer_converted {
    type: yesno
    sql: ${TABLE}.referrer_converted ;;
    hidden: yes
  }

  dimension: referrer_source {
    type: string
    sql: ${TABLE}.referrer_source ;;
    hidden: yes
  }

  dimension: referrer_token {
    type: string
    sql: ${TABLE}.referrer_token ;;
    hidden: yes
  }

  dimension: region {
    type: string
    group_label: "Location"
    sql: ${TABLE}.region ;;
    hidden: yes
  }

  dimension_group: remember_created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.remember_created_at ;;
    hidden: yes
  }

  dimension_group: reset_password_sent {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reset_password_sent_at ;;
    hidden: yes
  }

  dimension: reset_password_token {
    type: string
    sql: ${TABLE}.reset_password_token ;;
    hidden: yes
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
    hidden: yes
  }

  dimension: feature_flags {
    type: string
    sql: ${TABLE}.feature_flags ;;
  }

  dimension: signup_flow {
    type: string
    sql: ${TABLE}.signup_flow ;;

  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
    hidden: yes
  }

  dimension_group: skipped {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.skipped_at ;;
    hidden: yes
  }

  dimension: state {
    type: string
    group_label: "Location"
    map_layer_name: us_states
    sql: CASE WHEN ${TABLE}.state = ' ' THEN NULL ELSE ${TABLE}.state END ;;
    hidden: yes
  }

  #   - dimension: stripe_cc_exp_month
  #     type: number
  #     sql: ${TABLE}.stripe_cc_exp_month
  #
  #   - dimension: stripe_cc_exp_year
  #     type: number
  #     sql: ${TABLE}.stripe_cc_exp_year
  #
  #   - dimension: stripe_cc_last_four
  #     type: number
  #     sql: ${TABLE}.stripe_cc_last_four
  #
  #   - dimension: stripe_cc_type
  #     type: string
  #     sql: ${TABLE}.stripe_cc_type
  #

  #
  #   - dimension: stripe_token
  #     type: string
  #     sql: ${TABLE}.stripe_token

 # dimension: stripe_customer_id {
  #  type: string
  #  sql: ${TABLE}.stripe_customer_id;;
  # }


  dimension_group: subscribed {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.subscribed_at ;;
    hidden: yes
  }

  dimension: is_subscribed_to_mailchimp {
    type: yesno
    sql: ${TABLE}.subscribed_to_mailchimp ;;
    hidden: yes
  }

  dimension: subscription_status {
    type: number
    sql: ${TABLE}.subscription_status ;;
    hidden: yes
  }

  dimension: tnt {
    type: number
    sql: ${TABLE}.tnt ;;
    hidden: yes
  }

  dimension: uid {
    type: string
    label: "UID"
    sql: ${TABLE}.uid ;;
    hidden: yes
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden: yes
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_source_groups {
    type: string
    sql: case
        when lower(${new_sub_coupon_tracking.code}) = 'purplefall21' then 'Direct Mail'
        when lower(${new_sub_coupon_tracking.code}) = 'fallback2pc' then 'Direct Mail'
        when lower(${new_sub_coupon_tracking.code}) = 'pcspotify' then 'Audio'
        when (${utm_campaign} = 'gift' or ${signup_flow} = 1) then 'Gift'
        when lower(${utm_source}) like '%facebook%' then 'Facebook'
        when ${utm_source} like '%FB%' then 'Facebook'
        when ${utm_source} like '%utm_source%' then 'Facebook'
        when ${utm_source} = 'affiliate' then 'Affiliate'
        when ${utm_source} = 'sfm' then 'SAB'
        when ${utm_source} like '%pin%' then 'Pinterest'
        when ${utm_source} like '%bing%' then 'Bing B'
        when ${utm_source} like '%adwordsdis%' then 'Google Discovery'
        when ${utm_source} like '%adwordsb%' then 'Adwords B'
        when lower(${utm_source}) like '%adwords%' then 'Adwords NB'
        when ${utm_source} like '%veganbox%' then 'Adwords NB'
        when lower(${utm_source}) = 'organic' then 'Organic'
        when lower(${utm_source}) = 'audio' then 'Audio'
        when ${utm_source} = 'none' then 'Organic'
        when ${utm_source} is null then 'Organic'
        Else 'Organic'
        End
    ;;

  }
  dimension: utm_source_groups_no_dm_w_other {
    type: string
    sql: case
        when lower(${utm_source}) like '%facebook%' then 'Facebook'
        when ${utm_source} like '%FB%' then 'Facebook'
        when ${utm_source} like '%utm_source%' then 'Facebook'
        when ${utm_source} = 'affiliate' then 'Affiliate'
        when ${utm_source} = 'sfm' then 'SAB'
        when ${utm_source} like '%pin%' then 'Pinterest'
        when ${utm_source} like '%bing%' then 'Bing B'
        when ${utm_source} like '%adwordsdis%' then 'Google Discovery'
        when ${utm_source} like '%adwordsb%' then 'Adwords B'
        when lower(${utm_source}) like '%adwords%' then 'Adwords NB'
        when ${utm_source} like '%veganbox%' then 'Adwords NB'
        when ${utm_source} = 'gift' then 'Gift'
        when ${utm_campaign} = '-' then 'Organic'
        when ${utm_campaign} = 'organic' then 'Organic'
        when ${utm_campaign} = 'Organic' then 'Organic'
        when ${utm_campaign} = 'none' then 'Organic'
        Else 'Other'
        End
    ;;

    }


  dimension: origin {
    type: string
    sql: ${TABLE}.customer_origin ;;
    hidden: yes
  }

  dimension: origin_name{
    type: string
    sql:  CASE WHEN ${origin} = 1 THEN 'Thanksgiving'
          ELSE 'Non-Thanksgiving'
          END
          ;;
  }
  dimension: do_not_sell{
    type: string
    sql: ${TABLE}.do_not_sell ;;
  }

  dimension: segment{
    type: string
    sql: case when ${TABLE}.segment_membership in ('Null', 'No Segment')
    then 'Rest of Market'
    else ${TABLE}.segment_membership
    end;;
  }

  dimension: sign_up_method{
    type: string
    sql: ${TABLE}.sign_up_method ;;
    hidden: yes
  }

  dimension: admin_email{
    type: string
    sql: case
    when (${is_purple_carrot_employee} = 'yes') then SPLIT_PART(${email}, '@', 1)
    when (${email} like '%listentrust%') then CONCAT ( 'LT-',SPLIT_PART(${email}, '@', 1))
    else null
    end
    ;;
  }

  measure: count {
    type: count
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
  }


}
