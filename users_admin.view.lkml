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
    sql:  CASE WHEN ${vwo_signup_ab_test_variants} LIKE '%"208":"2"%' THEN 'Prepared and Meal Kit'
    WHEN ${vwo_signup_ab_test_variants} LIKE '%"208":"1"%' THEN 'Meal Kit Only'

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
  }

  dimension:prepared_new_customers_menu_test_breakout{
    type: string
    sql:  CASE
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"2"%' THEN 'Prepared and Meal Kit - Current Menu'
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"3"%' THEN 'Prepared and Meal Kit - Cycle 1 Menu'
          WHEN ${vwo_signup_ab_test_variants} LIKE '%"244":"1"%' THEN 'Meal Kit Only'

          ELSE NULL
          END;;
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

  measure: total_purple_carrot_credit {
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
  }

  dimension_group: current_sign_in {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.current_sign_in_at ;;
  }

  dimension: current_sign_in_ip {
    type: string
    group_label: "Location"
    sql: ${TABLE}.current_sign_in_ip ;;
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
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}.encrypted_password ;;
  }

  dimension: generated_password {
    type: yesno
    hidden: yes
    sql: ${TABLE}.generated_password ;;
  }

  dimension: giveaway_points {
    type: number
    sql: ${TABLE}.giveaway_points ;;
  }

  dimension: giveaway_redemption_token {
    type: string
    hidden: yes
    sql: ${TABLE}.giveaway_redemption_token ;;
  }

  dimension: is_blocked_from_ordering {
    type: yesno
    sql: ${TABLE}.is_blocked_from_ordering ;;
  }

  dimension: is_residential {
    type: yesno
    sql: ${TABLE}.is_residential ;;
  }

  dimension_group: last_mailchimp_update {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_mailchimp_update_at ;;
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
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}.last_sign_in_ip ;;
  }

  dimension: partner_token {
    type: string
    hidden: yes
    sql: ${TABLE}.partner_token ;;
  }

  dimension_group: paused {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paused_at ;;
  }

  dimension_group: suspended {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.suspended_at ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension_group: reactivated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reactivation_on ;;
  }

  dimension: is_referrer_converted {
    type: yesno
    sql: ${TABLE}.referrer_converted ;;
  }

  dimension: referrer_source {
    type: string
    sql: ${TABLE}.referrer_source ;;
  }

  dimension: referrer_token {
    type: string
    hidden: yes
    sql: ${TABLE}.referrer_token ;;
  }

  dimension: region {
    type: string
    group_label: "Location"
    sql: ${TABLE}.region ;;
  }

  dimension_group: remember_created {
    type: time
    hidden: yes
    timeframes: [time, date, week, month]
    sql: ${TABLE}.remember_created_at ;;
  }

  dimension_group: reset_password_sent {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reset_password_sent_at ;;
  }

  dimension: reset_password_token {
    type: string
    hidden: yes
    sql: ${TABLE}.reset_password_token ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: feature_flags {
    type: string
    sql: ${TABLE}.feature_flags ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  dimension_group: skipped {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.skipped_at ;;
  }

  dimension: state {
    type: string
    group_label: "Location"
    map_layer_name: us_states
    sql: CASE WHEN ${TABLE}.state = ' ' THEN NULL ELSE ${TABLE}.state END ;;
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
  }

  dimension: is_subscribed_to_mailchimp {
    type: yesno
    sql: ${TABLE}.subscribed_to_mailchimp ;;
  }

  dimension: subscription_status {
    type: number
    sql: ${TABLE}.subscription_status ;;
  }

  dimension: tnt {
    type: number
    hidden: yes
    sql: ${TABLE}.tnt ;;
  }

  dimension: uid {
    type: string
    label: "UID"
    sql: ${TABLE}.uid ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden: yes
  }

  dimension: utm_campaign {
    label: "UTM Campaign"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_source {
    label: "UTM Source"
    group_label: "Marketing"
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_source_groups {
    type: string
    sql: case when
        ${coupons.code} = 'pcjan21' then 'Direct Mail'
        when ${utm_source} like '%Facebook%' then 'Facebook'
        when ${utm_source} like '%FB%' then 'Facebook'
        when ${utm_source} like '%utm_source%' then 'Facebook'
        when ${utm_source} = 'affiliate' then 'Affiliate'
        when ${utm_source} = 'sfm' then 'SAB'
        when ${utm_source} like '%pin%' then 'Pinterest'
        when ${utm_source} like '%bing%' then 'Bing B'
        when ${utm_source} like '%adwordsdis%' then 'Google Discovery'
        when ${utm_source} like '%adwordsb%' then 'Adwords B'
        when ${utm_source} like '%adwords%' then 'Adwords NB'
        when ${utm_source} like '%veganbox%' then 'Adwords NB'
        when ${utm_source} = 'gift' then 'Gift'
        when ${utm_source} is null then 'Organic'
        Else 'Other'
        End
    ;;
  }


  dimension: origin {
    type: string
    sql: ${TABLE}.customer_origin ;;
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

  dimension: Segment{
    type: string
    sql: ${TABLE}.segment_membership ;;
  }

  dimension: sign_up_method{
    type: string
    sql: ${TABLE}.sign_up_method ;;
  }

  measure: count {
    type: count
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
  }

}
