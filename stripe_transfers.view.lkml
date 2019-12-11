view: stripe_transfers {
  sql_table_name: stripe.stripe_transfers ;;
  drill_fields: [id]

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

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_reversed {
    type: number
    sql: ${TABLE}.amount_reversed ;;
  }

  dimension: arrival_date {
    type: number
    sql: ${TABLE}.arrival_date ;;
  }

  dimension: automatic {
    type: yesno
    sql: ${TABLE}.automatic ;;
  }

  dimension: balance_transaction {
    type: string
    sql: ${TABLE}.balance_transaction ;;
  }

  dimension: bank_account__account {
    type: string
    sql: ${TABLE}.bank_account__account ;;
  }

  dimension: bank_account__bank_name {
    type: string
    sql: ${TABLE}.bank_account__bank_name ;;
  }

  dimension: bank_account__country {
    type: string
    sql: ${TABLE}.bank_account__country ;;
  }

  dimension: bank_account__currency {
    type: string
    sql: ${TABLE}.bank_account__currency ;;
  }

  dimension: bank_account__default_for_currency {
    type: yesno
    sql: ${TABLE}.bank_account__default_for_currency ;;
  }

  dimension: bank_account__disabled {
    type: yesno
    sql: ${TABLE}.bank_account__disabled ;;
  }

  dimension: bank_account__fingerprint {
    type: string
    sql: ${TABLE}.bank_account__fingerprint ;;
  }

  dimension: bank_account__id {
    type: string
    sql: ${TABLE}.bank_account__id ;;
  }

  dimension: bank_account__last4 {
    type: string
    sql: ${TABLE}.bank_account__last4 ;;
  }

  dimension: bank_account__object {
    type: string
    sql: ${TABLE}.bank_account__object ;;
  }

  dimension: bank_account__routing_number {
    type: string
    sql: ${TABLE}.bank_account__routing_number ;;
  }

  dimension: bank_account__status {
    type: string
    sql: ${TABLE}.bank_account__status ;;
  }

  dimension: bank_account__validated {
    type: yesno
    sql: ${TABLE}.bank_account__validated ;;
  }

  dimension: bank_account__verified {
    type: yesno
    sql: ${TABLE}.bank_account__verified ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}.livemode ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: reversals__has_more {
    type: yesno
    sql: ${TABLE}.reversals__has_more ;;
  }

  dimension: reversals__object {
    type: string
    sql: ${TABLE}.reversals__object ;;
  }

  dimension: reversals__total_count {
    type: number
    sql: ${TABLE}.reversals__total_count ;;
  }

  dimension: reversals__url {
    type: string
    sql: ${TABLE}.reversals__url ;;
  }

  dimension: reversed {
    type: yesno
    sql: ${TABLE}.reversed ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, bank_account__bank_name]
  }
}
