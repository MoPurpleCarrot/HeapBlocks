view: stripe_charges {
  sql_table_name: stripe.stripe_charges ;;

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

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: amount_in_dollars {
    type: number
    sql: ${amount}/100.0 ;;
  }

  dimension: amount_refunded {
    type: number
    sql: ${TABLE}.amount_refunded ;;
  }

  dimension: application {
    type: string
    sql: ${TABLE}.application ;;
  }

  dimension: authorization_code {
    type: string
    sql: ${TABLE}.authorization_code ;;
  }

  dimension: balance_transaction {
    type: string
    sql: ${TABLE}.balance_transaction ;;
  }

  dimension: captured {
    type: yesno
    sql: ${TABLE}.captured ;;
  }

  dimension: card__address_city {
    type: string
    sql: ${TABLE}.card__address_city ;;
  }

  dimension: card__address_country {
    type: string
    sql: ${TABLE}.card__address_country ;;
  }

  dimension: card__address_line1 {
    type: string
    sql: ${TABLE}.card__address_line1 ;;
  }

  dimension: card__address_line1_check {
    type: string
    sql: ${TABLE}.card__address_line1_check ;;
  }

  dimension: card__address_state {
    type: string
    sql: ${TABLE}.card__address_state ;;
  }

  dimension: card__address_zip {
    type: string
    sql: ${TABLE}.card__address_zip ;;
  }

  dimension: card__address_zip_check {
    type: string
    sql: ${TABLE}.card__address_zip_check ;;
  }

  dimension: card__brand {
    type: string
    sql: ${TABLE}.card__brand ;;
  }

  dimension: card__country {
    type: string
    sql: ${TABLE}.card__country ;;
  }

  dimension: card__customer {
    type: string
    sql: ${TABLE}.card__customer ;;
  }

  dimension: card__cvc_check {
    type: string
    sql: ${TABLE}.card__cvc_check ;;
  }

  dimension: card__exp_month {
    type: number
    sql: ${TABLE}.card__exp_month ;;
  }

  dimension: card__exp_year {
    type: number
    sql: ${TABLE}.card__exp_year ;;
  }

  dimension: card__fingerprint {
    type: string
    sql: ${TABLE}.card__fingerprint ;;
  }

  dimension: card__funding {
    type: string
    sql: ${TABLE}.card__funding ;;
  }

  dimension: card__id {
    type: string
    sql: ${TABLE}.card__id ;;
  }

  dimension: card__last4 {
    type: string
    sql: ${TABLE}.card__last4 ;;
  }

  dimension: card__name {
    type: string
    sql: ${TABLE}.card__name ;;
  }

  dimension: card__object {
    type: string
    sql: ${TABLE}.card__object ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}.customer ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: dispute__amount {
    type: number
    sql: ${TABLE}.dispute__amount ;;
  }

  dimension: dispute__balance_transaction {
    type: string
    sql: ${TABLE}.dispute__balance_transaction ;;
  }

  dimension: dispute__charge {
    type: string
    sql: ${TABLE}.dispute__charge ;;
  }

  dimension_group: dispute__created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.dispute__created ;;
  }

  dimension: dispute__currency {
    type: string
    sql: ${TABLE}.dispute__currency ;;
  }

  dimension: dispute__evidence_due_by {
    type: number
    sql: ${TABLE}.dispute__evidence_due_by ;;
  }

  dimension: dispute__id {
    type: string
    sql: ${TABLE}.dispute__id ;;
  }

  dimension: dispute__is_charge_refundable {
    type: yesno
    sql: ${TABLE}.dispute__is_charge_refundable ;;
  }

  dimension: dispute__livemode {
    type: yesno
    sql: ${TABLE}.dispute__livemode ;;
  }

  dimension: dispute__object {
    type: string
    sql: ${TABLE}.dispute__object ;;
  }

  dimension: dispute__reason {
    type: string
    sql: ${TABLE}.dispute__reason ;;
  }

  dimension: dispute__status {
    type: string
    sql: ${TABLE}.dispute__status ;;
  }

  dimension: failure_code {
    type: string
    sql: ${TABLE}.failure_code ;;
  }

  dimension: failure_message {
    type: string
    sql: ${TABLE}.failure_message ;;
  }

  dimension: fraud_details__stripe_report {
    type: string
    sql: ${TABLE}.fraud_details__stripe_report ;;
  }

  dimension: fraud_details__user_report {
    type: string
    sql: ${TABLE}.fraud_details__user_report ;;
  }

  dimension: livemode {
    type: yesno
    sql: ${TABLE}.livemode ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: outcome__network_status {
    type: string
    sql: ${TABLE}.outcome__network_status ;;
  }

  dimension: outcome__reason {
    type: string
    sql: ${TABLE}.outcome__reason ;;
  }

  dimension: outcome__risk_level {
    type: string
    sql: ${TABLE}.outcome__risk_level ;;
  }

  dimension: outcome__seller_message {
    type: string
    sql: ${TABLE}.outcome__seller_message ;;
  }

  dimension: outcome__type {
    type: string
    sql: ${TABLE}.outcome__type ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: receipt_email {
    type: string
    sql: ${TABLE}.receipt_email ;;
  }

  dimension: receipt_number {
    type: string
    sql: ${TABLE}.receipt_number ;;
  }

  dimension: refunded {
    type: yesno
    sql: ${TABLE}.refunded ;;
  }

  dimension: refunds__has_more {
    type: yesno
    sql: ${TABLE}.refunds__has_more ;;
  }

  dimension: refunds__object {
    type: string
    sql: ${TABLE}.refunds__object ;;
  }

  dimension: refunds__total_count {
    type: number
    sql: ${TABLE}.refunds__total_count ;;
  }

  dimension: refunds__url {
    type: string
    sql: ${TABLE}.refunds__url ;;
  }

  dimension: review {
    type: string
    sql: ${TABLE}.review ;;
  }

  dimension: source__address_city {
    type: string
    sql: ${TABLE}.source__address_city ;;
  }

  dimension: source__address_country {
    type: string
    sql: ${TABLE}.source__address_country ;;
  }

  dimension: source__address_line1 {
    type: string
    sql: ${TABLE}.source__address_line1 ;;
  }

  dimension: source__address_line1_check {
    type: string
    sql: ${TABLE}.source__address_line1_check ;;
  }

  dimension: source__address_state {
    type: string
    sql: ${TABLE}.source__address_state ;;
  }

  dimension: source__address_zip {
    type: string
    sql: ${TABLE}.source__address_zip ;;
  }

  dimension: source__address_zip_check {
    type: string
    sql: ${TABLE}.source__address_zip_check ;;
  }

  dimension: source__brand {
    type: string
    sql: ${TABLE}.source__brand ;;
  }

  dimension: source__country {
    type: string
    sql: ${TABLE}.source__country ;;
  }

  dimension: source__customer {
    type: string
    sql: ${TABLE}.source__customer ;;
  }

  dimension: source__cvc_check {
    type: string
    sql: ${TABLE}.source__cvc_check ;;
  }

  dimension: source__exp_month {
    type: number
    sql: ${TABLE}.source__exp_month ;;
  }

  dimension: source__exp_year {
    type: number
    sql: ${TABLE}.source__exp_year ;;
  }

  dimension: source__fingerprint {
    type: string
    sql: ${TABLE}.source__fingerprint ;;
  }

  dimension: source__funding {
    type: string
    sql: ${TABLE}.source__funding ;;
  }

  dimension: source__id {
    type: string
    sql: ${TABLE}.source__id ;;
  }

  dimension: source__last4 {
    type: string
    sql: ${TABLE}.source__last4 ;;
  }

  dimension: source__name {
    type: string
    sql: ${TABLE}.source__name ;;
  }

  dimension: source__object {
    type: string
    sql: ${TABLE}.source__object ;;
  }

  dimension: statement_description {
    type: string
    sql: ${TABLE}.statement_description ;;
  }

  dimension: statement_descriptor {
    type: string
    sql: ${TABLE}.statement_descriptor ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: total_refunded {
    type: sum
    value_format_name: usd
    sql: ${amount_refunded} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, card__name, source__name]
  }

  measure: total_revenue {
    type: sum
    value_format_name: usd
    sql: ${amount_in_dollars} ;;
  }
}
