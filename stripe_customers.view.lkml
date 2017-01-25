view: stripe_customers {
  sql_table_name: stripe.stripe_customers ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [time, date, week, month]
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

  dimension: account_balance {
    type: number
    sql: ${TABLE}.account_balance ;;
  }

  dimension: cards__has_more {
    type: yesno
    sql: ${TABLE}.cards__has_more ;;
  }

  dimension: cards__object {
    type: string
    sql: ${TABLE}.cards__object ;;
  }

  dimension: cards__total_count {
    type: number
    sql: ${TABLE}.cards__total_count ;;
  }

  dimension: cards__url {
    type: string
    sql: ${TABLE}.cards__url ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created ;;
  }

  dimension: default_card {
    type: string
    sql: ${TABLE}.default_card ;;
  }

  dimension: default_source {
    type: string
    sql: ${TABLE}.default_source ;;
  }

  dimension: delinquent {
    type: yesno
    sql: ${TABLE}.delinquent ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}.livemode ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: sources__has_more {
    type: yesno
    sql: ${TABLE}.sources__has_more ;;
  }

  dimension: sources__object {
    type: string
    sql: ${TABLE}.sources__object ;;
  }

  dimension: sources__total_count {
    type: number
    sql: ${TABLE}.sources__total_count ;;
  }

  dimension: sources__url {
    type: string
    sql: ${TABLE}.sources__url ;;
  }

  dimension: subscriptions__has_more {
    type: yesno
    sql: ${TABLE}.subscriptions__has_more ;;
  }

  dimension: subscriptions__object {
    type: string
    sql: ${TABLE}.subscriptions__object ;;
  }

  dimension: subscriptions__total_count {
    type: number
    sql: ${TABLE}.subscriptions__total_count ;;
  }

  dimension: subscriptions__url {
    type: string
    sql: ${TABLE}.subscriptions__url ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
