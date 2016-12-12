- view: menus
  sql_table_name: heroku_postgres.menus
  fields:

  - dimension: id
    primary_key: true
    type: number
    sql: ${TABLE}.id

  - dimension_group: sdc_batched
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at
    hidden: true

  - dimension_group: sdc_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at
    hidden: true

  - dimension: sdc_sequence
    type: number
    sql: ${TABLE}._sdc_sequence
    hidden: true

  - dimension: sdc_table_version
    type: number
    sql: ${TABLE}._sdc_table_version
    hidden: true

  - dimension_group: authorization
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.authorization_at
    hidden: true

  - dimension_group: capture
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.capture_at
    hidden: true

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension_group: end
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at

  - dimension_group: order_cancellation_cutoff
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.order_cancellation_cutoff_at

  - dimension: is_published
    type: yesno
    sql: ${TABLE}.published

  - dimension_group: shipping
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.shipping_on

  - dimension_group: start
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_at

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: status_message
    type: string
    sql: ${TABLE}.status_message

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at
    hidden: true

  - measure: count
    type: count
    drill_fields: [id, menu_items.count, orders.count]

