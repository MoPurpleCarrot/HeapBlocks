- view: recipes
  sql_table_name: heroku_postgres.recipes
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

  - dimension: archive_image
    type: string
    sql: ${TABLE}.archive_image
    hidden: true

  - dimension: archive_image_alt
    type: string
    sql: ${TABLE}.archive_image_alt
    hidden: true

  - dimension: calories
    type: number
    sql: ${TABLE}.calories
    
  - measure: total_calories
    type: sum
    sql: ${calories}

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
    hidden: true

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
    hidden: true

  - dimension: image
    type: string
    sql: ${TABLE}.image
    hidden: true

  - dimension: is_snack
    type: yesno
    sql: ${TABLE}.is_snack

  - dimension: page_meta_description
    type: string
    sql: ${TABLE}.page_meta_description
    hidden: true

  - dimension: page_title
    type: string
    sql: ${TABLE}.page_title
    hidden: true

  - dimension: plan_type
    type: number
    sql: ${TABLE}.plan

  - dimension: plate_image
    type: string
    sql: ${TABLE}.plate_image
    hidden: true

  - dimension: prep_time
    type: string
    sql: ${TABLE}.prep_time

  - dimension: protein
    type: number
    sql: ${TABLE}.protein
  
  - measure: total_protein
    type: sum
    sql: ${protein}

  - dimension: number_of_servings
    type: number
    sql: ${TABLE}.servings
    
  - measure: total_servings
    type: sum
    sql: ${number_of_servings}

  - dimension: show_in_recipes_archive
    type: yesno
    sql: ${TABLE}.show_in_recipes_archive
    hidden: true

  - dimension: skip_calendar_image
    type: string
    sql: ${TABLE}.skip_calendar_image
    hidden: true
    
  - dimension: skip_calendar_image_alt
    type: string
    sql: ${TABLE}.skip_calendar_image_alt
    hidden: true

  - dimension: slug
    type: string
    sql: ${TABLE}.slug
    hidden: true

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
    hidden: true

  - measure: count
    type: count
    drill_fields: [id, menu_items.count]

