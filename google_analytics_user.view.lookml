- view: google_analytics_user
  sql_table_name: google_analytics_user.report
  fields:

  - dimension: _rjm_record_hash
    type: string
    sql: ${TABLE}._rjm_record_hash

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

  - dimension: bounces
    type: number
    sql: ${TABLE}.bounces

  - dimension: dimension1
    type: string
    sql: ${TABLE}.dimension1

  - dimension_group: enddate
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."end-date"

  - dimension: pageviews
    type: number
    sql: ${TABLE}.pageviews
    
  - dimension: compound_primary_key
    type: string
    primary_key: true
#     hidden: true
    sql: ${dimension1} || ${startdate_date}

  - dimension: session_duration
    type: number
    sql: ${TABLE}.sessionduration
    
  - measure: total_session_duration
    type: sum
    sql: ${session_duration}
    
  - measure: total_sessions
    type: sum
    sql: ${sessions}

  - dimension: sessions
    type: number
    sql: ${TABLE}.sessions

  - dimension_group: startdate
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}."start-date"

  - dimension: unique_pageviews
    type: number
    sql: ${TABLE}.uniquepageviews

  - measure: count
    type: count
    drill_fields: []

