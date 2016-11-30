- view: users
  sql_table_name: heroku_postgres.users
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: sdc_batched
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at

  - dimension_group: sdc_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at

  - dimension: sdc_sequence
    type: number
    sql: ${TABLE}._sdc_sequence

  - dimension: sdc_table_version
    type: number
    sql: ${TABLE}._sdc_table_version

  - dimension: account_number
    type: number
    sql: ${TABLE}.account_number

  - dimension: address
    type: string
    sql: ${TABLE}.address

  - dimension: address_2
    type: string
    sql: ${TABLE}.address2

  - dimension: business_name
    type: string
    sql: ${TABLE}.business_name

  - dimension_group: cancelled
    type: time
    timeframes: [time, date, week, month, raw]
    sql: ${TABLE}.cancelled_at
    
  - dimension: weeks_as_customer
    type: number
    sql: DATEDIFF(WEEKS, ${created_raw}, CASE WHEN ${cancelled_raw} IS NULL THEN current_date ELSE ${cancelled_raw} END)

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: country
    type: string
    sql: ${TABLE}.country

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month,raw]
    sql: ${TABLE}.created_at

  - dimension: credit
    type: number
    sql: ${TABLE}.credit
    
  - measure: total_credit
    type: sum
    value_format_name: usd
    sql: ${credit}
    drill_fields: [id, city, state, account_number]
    
  - measure: total_purple_carrot_credit
    type: sum
    value_format_name: usd
    sql: ${credit}
    drill_fields: [id, city, state, account_number]
    filters:
      is_purple_carrot_employee: yes
      
  - dimension: is_active_customer
    type: yesno
    sql: CASE WHEN ${cancelled_raw} IS NULL THEN TRUE ELSE FALSE END
    
  - measure: total_active_credit
    type: sum
    value_format_name: usd
    sql: ${credit}
    drill_fields: [id, city, state, account_number]
    filters:
      is_active_customer: yes
  
  - dimension: credit_before_migration
    type: number
    sql: ${TABLE}.credit_before_migration

  - dimension_group: current_sign_in
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.current_sign_in_at

  - dimension: current_sign_in_ip
    type: string
    sql: ${TABLE}.current_sign_in_ip

  - dimension: delivery_day
    type: number
    sql: ${TABLE}.delivery_day

  - dimension: delivery_instructions
    type: string
    sql: ${TABLE}.delivery_instructions

  - dimension: email
    type: string
    sql: ${TABLE}.email
    
  - dimension: email_domain
    type: string
    sql: regexp_substr(email,'@[^.]*')
    
  - dimension: is_purple_carrot_employee
    type: yesno
    sql: ${email} LIKE '%purplecarrot%'

  - dimension: encrypted_password
    type: string
    sql: ${TABLE}.encrypted_password

  - dimension: first_name
    type: string
    sql: ${TABLE}.first_name

  - dimension: generated_password
    type: yesno
    sql: ${TABLE}.generated_password

  - dimension: giveaway_points
    type: number
    sql: ${TABLE}.giveaway_points

  - dimension: giveaway_redemption_token
    type: string
    sql: ${TABLE}.giveaway_redemption_token

  - dimension: is_blocked_from_ordering
    type: yesno
    sql: ${TABLE}.is_blocked_from_ordering

  - dimension: is_residential
    type: yesno
    sql: ${TABLE}.is_residential

  - dimension_group: last_mailchimp_update
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.last_mailchimp_update_at

  - dimension: last_name
    type: string
    sql: ${TABLE}.last_name

  - dimension_group: last_sign_in
    type: time
    timeframes: [time, date, week, month, year, day_of_week]
    sql: ${TABLE}.last_sign_in_at

  - dimension: last_sign_in_ip
    type: string
    sql: ${TABLE}.last_sign_in_ip

  - dimension: partner_token
    type: string
    sql: ${TABLE}.partner_token

  - dimension_group: paused
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.paused_at

  - dimension: phone
    type: string
    sql: ${TABLE}.phone

  - dimension: plan
    type: number
    sql: ${TABLE}.plan

  - dimension: provider
    type: string
    sql: ${TABLE}.provider

  - dimension_group: reactivation
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reactivation_on

  - dimension: referrer_converted
    type: yesno
    sql: ${TABLE}.referrer_converted

  - dimension: referrer_source
    type: string
    sql: ${TABLE}.referrer_source

  - dimension: referrer_token
    type: string
    sql: ${TABLE}.referrer_token

  - dimension: region
    type: string
    sql: ${TABLE}.region

  - dimension_group: remember_created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.remember_created_at

  - dimension_group: reset_password_sent
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.reset_password_sent_at

  - dimension: reset_password_token
    type: string
    sql: ${TABLE}.reset_password_token

  - dimension: role
    type: string
    sql: ${TABLE}.role

  - dimension: sign_in_count
    type: number
    sql: ${TABLE}.sign_in_count

  - dimension_group: skipped
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.skipped_at

  - dimension: state
    type: string
    map_layer: us_states
    sql: CASE WHEN ${TABLE}.state = ' ' THEN NULL ELSE ${TABLE}.state END

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
#   - dimension: stripe_customer_id
#     type: string
#     sql: ${TABLE}.stripe_customer_id
# 
#   - dimension: stripe_token
#     type: string
#     sql: ${TABLE}.stripe_token

  - dimension_group: subscribed
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.subscribed_at

  - dimension: subscribed_to_mailchimp
    type: yesno
    sql: ${TABLE}.subscribed_to_mailchimp

  - dimension: subscription_status
    type: number
    sql: ${TABLE}.subscription_status

  - dimension: tnt
    type: number
    sql: ${TABLE}.tnt

  - dimension: uid
    type: string
    sql: ${TABLE}.uid

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: utm_campaign
    type: string
    sql: ${TABLE}.utm_campaign

  - dimension: utm_source
    type: string
    sql: ${TABLE}.utm_source

  - dimension: zip
    type: zipcode
    sql: ${TABLE}.zip

  - measure: count
    type: count
    drill_fields: [id, business_name, uid, first_name, last_name, phone, state, weeks_as_customer, total_active_credit]

