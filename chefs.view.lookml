- view: chefs
  sql_table_name: heroku_postgres.chefs
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
    hidden: true

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
    map_layer: us_states
    sql: ${TABLE}.state

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at
    hidden: true

  - measure: count
    type: count
    drill_fields: [id, name, recipes.count]
    

