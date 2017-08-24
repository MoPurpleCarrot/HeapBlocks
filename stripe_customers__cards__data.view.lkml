view: stripe_customers__cards__data {
  sql_table_name: stripe.stripe_customers__cards__data ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension: _sdc_level_0_id {
    type: number
    sql: ${TABLE}._sdc_level_0_id ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_source_key_id {
    type: string
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: cvc_check {
    type: string
    sql: ${TABLE}.cvc_check ;;
  }

  dimension: exp_month {
    type: number
    sql: ${TABLE}.exp_month ;;
  }

  dimension: exp_year {
    type: number
    sql: ${TABLE}.exp_year ;;
  }

  dimension: fingerprint {
    type: string
    sql: ${TABLE}.fingerprint ;;
  }

  dimension: funding {
    type: string
    sql: ${TABLE}.funding ;;
  }

  dimension: last4 {
    type: string
    sql: ${TABLE}.last4 ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
