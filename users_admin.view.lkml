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

  dimension: stripe_customer_id {
    type: string
    sql: ${TABLE}.stripe_customer_id
  }


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

  dimension: utm_bucket_ORD {
    type: string
    sql: case when ${utm_source_bucket} = 'Organic' then 'Organic'
         When ${utm_source_bucket} = 'Friendbuy' then 'Other'
        Else null
        End
    ;;
  }

  dimension: utm_source_bucket {
    type: string
    sql:  CASE WHEN ${utm_source} = 'organic' THEN 'Organic'
          WHEN ${utm_source} = 'adwordsbranded_su' THEN 'Adwords B'
          WHEN ${utm_source} = 'Facebook' THEN 'Facebook'
          WHEN ${utm_source} = 'Adwords' THEN 'Adwords B'
          WHEN ${utm_source} = 'sfm' THEN 'Share a Box'
          WHEN ${utm_source} = 'none' THEN 'Organic'
          WHEN ${utm_source} = 'veganbox' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsplant' THEN 'Adwords NB'
          WHEN ${utm_source} = 'Friendbuy' THEN 'Friendbuy'
          WHEN ${utm_source} = 'adwordsvegan' THEN 'Adwords NB'
          WHEN ${utm_source} = 'vegandelivery' THEN 'Adwords NB'
          WHEN ${utm_source} = 'facebook' THEN 'Organic'
          WHEN ${utm_source} = 'adwordsbrandcoupon' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsbrandsite' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsbrandservice' THEN 'Adwords B'
          WHEN ${utm_source} = null THEN 'Organic'
          WHEN ${utm_source} = '' THEN 'Organic'
          WHEN ${utm_source} = 'adwordsbrand_suextwm' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsvdextwm' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordstb12tombrady' THEN 'Adwords TB12'
          WHEN ${utm_source} = 'adwordstb12' THEN 'Adwords TB12'
          WHEN ${utm_source} = 'veganstarted' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsbrandproduct' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordstb12tb12' THEN 'Adwords TB12'
          WHEN ${utm_source} = 'FOKlander' THEN 'Organic'
          WHEN ${utm_source} = 'adwordswhole' THEN 'Adwords NB'
          WHEN ${utm_source} = 'veganrecipes' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsbrand_suexttb12' THEN 'Adwords B'
          WHEN ${utm_source} = 'veganstartednew' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsbrand4extwm' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsbrand_suexthiw' THEN 'Adwords B'
          WHEN ${utm_source} = 'FB_23.3a' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordssvmkextwm' THEN 'Adwords NB'
          WHEN ${utm_source} = 'vegetarian' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_11.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_106.9a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_91.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FacebookTB12' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_39.26a' THEN 'Facebook'
          WHEN ${utm_source} = 'facebookad' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_16.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordspbexthiw' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_16.3a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_60.8a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_90.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_7.7a' THEN 'Facebook'
          WHEN ${utm_source} = 'emailcta' THEN 'Organic'
          WHEN ${utm_source} = 'hs_email' THEN 'Organic'
          WHEN ${utm_source} = 'FB_7.8a' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordspbextwm' THEN 'Adwords NB'
          WHEN ${utm_source} = 'facebookads' THEN 'Facebook'
          WHEN ${utm_source} = 'veganbox2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'aqgenmealbox' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordstb12howext' THEN 'Adwords TB12'
          WHEN ${utm_source} = 'F_91.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'fmbinsta' THEN 'Influencer'
          WHEN ${utm_source} = 'fmbytinsta' THEN 'Influencer'
          WHEN ${utm_source} = 'nvytinsta' THEN 'Influencer'
          WHEN ${utm_source} = 'infig' THEN 'Influencer'
          WHEN ${utm_source} = 'instagram' THEN 'Organic'
          WHEN ${utm_source} = 'twitter' THEN 'Organic'
          WHEN ${utm_source} = 'Social' THEN 'Organic'
          WHEN ${utm_source} = 'Blog' THEN 'Organic'
          WHEN ${utm_source} = 'FB_16.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_7.16a' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordsdisp_100pb_bowl_retarg' THEN 'Adwords Display'
          WHEN ${utm_source} = 'bluevegan' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_90.6a' THEN 'Facebook'
          WHEN ${utm_source} = 'facebookads' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordsb' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsb_i' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsb_w' THEN 'Adwords B'
          WHEN ${utm_source} = 'adwordsnb' THEN 'Adwords NB'
          WHEN ${utm_source} = 'veganstartednew2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'Organic' THEN 'Organic'
          WHEN ${utm_source} = 'pin' THEN 'Pinterest'
          WHEN ${utm_source} = 'bingb' THEN 'Bing B'
          WHEN ${utm_source} = 'IG' THEN 'Facebook'
          WHEN ${utm_source} = '[utm_source]' THEN 'Adwords NB'
          WHEN ${utm_source} = '[utm_source]2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'affiliate' THEN 'Affiliate'
          WHEN ${utm_source} = 'adwordstb' THEN 'Adwords TB12'
          WHEN ${utm_source} = 'bingnb' THEN 'Bing NB'
          WHEN ${utm_source} = 'adwordsdisp' THEN 'Adwords Display'
          WHEN ${utm_source} = 'youtube' THEN 'YouTube'
          WHEN ${utm_source} = 'peta' THEN 'Other'
          WHEN ${utm_source} = 'Green Blender Smoothie Club' THEN 'Other'
          WHEN ${utm_source} = 'adwordsvmkextwm' THEN 'Adwords NB'
          WHEN ${utm_source} = 'vegandelivery2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsplant' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsplant2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_85.10a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_84.7a' THEN 'Facebook'
          WHEN ${utm_source} = '3mealspin_disc' THEN 'Pinterest'
          WHEN ${utm_source} = 'emailpin_food_100pb' THEN 'Pinterest'
          WHEN ${utm_source} = 'FacebookTB' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordsnb2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsnb3' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_85.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_23.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordsbrand4exttb12' THEN 'Adwords TB12'
          WHEN ${utm_source} = 'veganmeals' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsvmkexthiw' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsvrmexthiw' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_106.12a' THEN 'Facebook'
          WHEN ${utm_source} = 'adwordsvegan2' THEN 'Adwords NB'
          WHEN ${utm_source} = 'adwordsbrand4exthiw' THEN 'Adwords NB'
          WHEN ${utm_source} = 'FB_1.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_23.48a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_81.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_9.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_91.6a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_60.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_1.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_23.5a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_83.27a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_16.7a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_71.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_7.3a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_23.6a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_85.8a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_71.6a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_17.5a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_71.8a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_80.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_93.8a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_106.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_81.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_82.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_70.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_83.25a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_60.18a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_93.12a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_106.5a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_80.3a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_39.4a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_83.21a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_84.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_103.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_60.3a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_23.38a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_70.1a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_70.10a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_85.6a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_106.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_60.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_41.25a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_39.27a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_70.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_83.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_80.5a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_23.2a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_84.6a' THEN 'Facebook'
          WHEN ${utm_source} = 'FB_106.7a' THEN 'Facebook'
          ELSE NULL
          END
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

  measure: count {
    type: count
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
  }
}
