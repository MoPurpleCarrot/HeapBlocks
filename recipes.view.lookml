- view: recipes
  sql_table_name: heroku_postgres.recipes
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

  - dimension: archive_image
    type: string
    sql: ${TABLE}.archive_image

  - dimension: archive_image_alt
    type: string
    sql: ${TABLE}.archive_image_alt

  - dimension: calories
    type: number
    sql: ${TABLE}.calories

  - dimension: carbs
    type: number
    sql: ${TABLE}.carbs
    
  - measure: total_carbs
    type: sum
    sql: ${carbs}
  
  - measure: total_carbs_per_user
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${total_carbs} / NULLIF(${users.count},0)

  - dimension: chef_id
    type: number
    sql: ${TABLE}.chef_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: description
    type: string
    sql: ${TABLE}.description

  - dimension: difficulty
    type: string
    sql: ${TABLE}.difficulty

  - dimension: fat
    type: number
    sql: ${TABLE}.fat
    
  - measure: total_fat
    type: sum
    sql: ${fat}

  - dimension: home_image_alt
    type: string
    sql: ${TABLE}.home_image_alt

  - dimension: image
    type: string
    sql: ${TABLE}.image

  - dimension: is_snack
    type: yesno
    sql: ${TABLE}.is_snack

  - dimension: page_meta_description
    type: string
    sql: ${TABLE}.page_meta_description

  - dimension: page_title
    type: string
    sql: ${TABLE}.page_title

  - dimension: plan
    type: number
    sql: ${TABLE}.plan

  - dimension: plate_image
    type: string
    sql: ${TABLE}.plate_image

  - dimension: prep_time
    type: string
    sql: ${TABLE}.prep_time

  - dimension: protein
    type: number
    sql: ${TABLE}.protein

  - dimension: servings
    type: number
    sql: ${TABLE}.servings

  - dimension: show_in_recipes_archive
    type: yesno
    sql: ${TABLE}.show_in_recipes_archive

  - dimension: skip_calendar_image
    type: string
    sql: ${TABLE}.skip_calendar_image

  - dimension: skip_calendar_image_alt
    type: string
    sql: ${TABLE}.skip_calendar_image_alt

  - dimension: slug
    type: string
    sql: ${TABLE}.slug

  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: title
    type: string
    sql: ${TABLE}.title

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - measure: count
    type: count
    drill_fields: [id, menu_items.count]

