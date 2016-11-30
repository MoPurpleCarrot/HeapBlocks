- view: subscriptions
  sql_table_name: heroku_postgres.subscriptions
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: _sdc_batched
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at

  - dimension_group: _sdc_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at

  - dimension: _sdc_sequence
    type: number
    sql: ${TABLE}._sdc_sequence

  - dimension: _sdc_table_version
    type: number
    sql: ${TABLE}._sdc_table_version

  - dimension: billed_or_bill_error_orders_count
    type: number
    sql: ${TABLE}.billed_or_bill_error_orders_count

  - dimension: coupon_id
    type: number
    sql: ${TABLE}.coupon_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: plan
    type: number
    sql: ${TABLE}.plan

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - dimension: stripe_cc_exp_month
    type: string
    sql: ${TABLE}.stripe_cc_exp_month

  - dimension: stripe_cc_exp_year
    type: string
    sql: ${TABLE}.stripe_cc_exp_year

  - dimension: stripe_cc_last_four
    type: string
    sql: ${TABLE}.stripe_cc_last_four

  - dimension: stripe_cc_type
    type: string
    sql: ${TABLE}.stripe_cc_type

  - dimension: stripe_customer_id
    type: string
    sql: ${TABLE}.stripe_customer_id

  - dimension: stripe_token
    type: string
    sql: ${TABLE}.stripe_token

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: user_id
    type: number
    # hidden: true
    sql: ${TABLE}.user_id

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - users.business_name
    - users.first_name
    - users.id
    - users.last_name
    - orders.count

