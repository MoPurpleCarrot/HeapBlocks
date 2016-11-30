- view: menus
  sql_table_name: heroku_postgres.menus
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

  - dimension_group: authorization
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.authorization_at

  - dimension_group: capture
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.capture_at

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

  - dimension: published
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

  - measure: count
    type: count
    drill_fields: [id, menu_items.count, orders.count]

