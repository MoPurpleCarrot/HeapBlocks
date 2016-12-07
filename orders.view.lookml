- view: orders
  sql_table_name: heroku_postgres.orders
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

  - dimension: admin_id
    type: number
    sql: ${TABLE}.admin_id

  - dimension: amount_charged
    type: number
    sql: ${TABLE}.amount_charged

  - dimension: cancelled_reason
    type: string
    sql: ${TABLE}.cancelled_reason

  - dimension: coupon_code
    type: string
    sql: ${TABLE}.coupon_code

  - dimension: coupon_id
    type: number
    sql: ${TABLE}.coupon_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: credit_applied
    type: number
    sql: ${TABLE}.credit_applied

  - dimension_group: delivery
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.delivery_on

  - dimension: donated
    type: yesno
    sql: ${TABLE}.donated

  - dimension: menu_id
    type: number
    # hidden: true
    sql: ${TABLE}.menu_id

  - dimension: order_number
    type: number
    sql: ${TABLE}.order_number

  - dimension: partner_label
    type: string
    sql: ${TABLE}.partner_label

  - dimension: plan
    type: number
    sql: ${TABLE}.plan

  - dimension: price
    type: number
    sql: ${TABLE}.price

  - measure: total_revenue
    # label: "My Revenue"
    # view_label: "Chefs"
    type: sum
    value_format_name: usd
    sql: ${price}
    
  - dimension: shipping_carrier
    type: string
    sql: ${TABLE}.shipping_carrier

  - dimension: shipping_label
    type: string
    sql: ${TABLE}.shipping_label

  - dimension: status
    type: number
    sql: ${TABLE}.status

  - dimension: status_old
    type: string
    sql: ${TABLE}.status_old

  - dimension: stripe_charge_id
    type: string
    sql: ${TABLE}.stripe_charge_id

  - dimension: subscription_id
    type: number
    # hidden: true
    sql: ${TABLE}.subscription_id

  - dimension: through_partner
    type: yesno
    sql: ${TABLE}.through_partner

  - dimension: tracking_number
    type: string
    sql: ${TABLE}.tracking_number

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
    - menus.id
    - subscriptions.id
    - users.business_name
    - users.first_name
    - users.id
    - users.last_name

