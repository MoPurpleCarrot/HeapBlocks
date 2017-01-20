- view: google_analytics_dau
  sql_table_name: google_analytics_dau.report
  fields:

  - dimension: 1dayusers
    type: number
    sql: ${TABLE}."1dayusers"

  - dimension: _rjm_record_hash
    type: string
    sql: ${TABLE}._rjm_record_hash
    hidden: true

  - dimension_group: _sdc_batched
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._sdc_batched_at
    hidden: true

  - dimension_group: _sdc_received
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}._sdc_received_at
    hidden: true

  - dimension: _sdc_sequence
    type: number
    sql: ${TABLE}._sdc_sequence
    hidden: true

  - dimension: _sdc_table_version
    type: number
    sql: ${TABLE}._sdc_table_version
    hidden: true

  - dimension_group: date
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date

  - dimension_group: enddate
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."end-date"

  - dimension_group: startdate
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}."start-date"

  - measure: count
    type: count
    drill_fields: []
