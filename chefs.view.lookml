- view: chefs
  sql_table_name: heroku_postgres.chefs
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

  - dimension: biography
    type: string
    sql: ${TABLE}.biography

  - dimension: city
    type: string
    sql: ${TABLE}.city

  - dimension: cookbooks
    type: string
    sql: ${TABLE}.cookbooks

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: image
    type: string
    sql: ${TABLE}.image

  - dimension: name
    type: string
    sql: ${TABLE}.name

  - dimension: restaurants
    type: string
    sql: ${TABLE}.restaurants

  - dimension: specialties
    type: string
    sql: ${TABLE}.specialties

  - dimension: state
    type: string
    sql: ${TABLE}.state

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, name, recipes.count]
    
  - measure: total_orders
    type: number
    sql: ${orders.count}
    drill_fields: [recipes.title, orders.count]
