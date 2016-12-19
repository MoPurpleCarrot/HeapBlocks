- view: stripe_events
  sql_table_name: stripe.stripe_events
  fields:

  - dimension: id
    primary_key: true
    type: string
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

  - dimension: api_version
    type: string
    sql: ${TABLE}.api_version

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created

  - dimension: data__object__account_balance
    type: number
    sql: ${TABLE}.data__object__account_balance

  - dimension: data__object__amount
    type: number
    sql: ${TABLE}.data__object__amount

  - dimension: data__object__amount_refunded
    type: number
    sql: ${TABLE}.data__object__amount_refunded

  - dimension: data__object__amount_reversed
    type: number
    sql: ${TABLE}.data__object__amount_reversed

  - dimension: data__object__authorization_code
    type: string
    sql: ${TABLE}.data__object__authorization_code

  - dimension: data__object__balance_transaction
    type: string
    sql: ${TABLE}.data__object__balance_transaction

  - dimension: data__object__bank_account__account
    type: string
    sql: ${TABLE}.data__object__bank_account__account

  - dimension: data__object__bank_account__bank_name
    type: string
    sql: ${TABLE}.data__object__bank_account__bank_name

  - dimension: data__object__bank_account__country
    type: string
    sql: ${TABLE}.data__object__bank_account__country

  - dimension: data__object__bank_account__currency
    type: string
    sql: ${TABLE}.data__object__bank_account__currency

  - dimension: data__object__bank_account__default_for_currency
    type: yesno
    sql: ${TABLE}.data__object__bank_account__default_for_currency

  - dimension: data__object__bank_account__disabled
    type: yesno
    sql: ${TABLE}.data__object__bank_account__disabled

  - dimension: data__object__bank_account__fingerprint
    type: string
    sql: ${TABLE}.data__object__bank_account__fingerprint

  - dimension: data__object__bank_account__id
    type: string
    sql: ${TABLE}.data__object__bank_account__id

  - dimension: data__object__bank_account__last4
    type: string
    sql: ${TABLE}.data__object__bank_account__last4

  - dimension: data__object__bank_account__object
    type: string
    sql: ${TABLE}.data__object__bank_account__object

  - dimension: data__object__bank_account__routing_number
    type: string
    sql: ${TABLE}.data__object__bank_account__routing_number

  - dimension: data__object__bank_account__status
    type: string
    sql: ${TABLE}.data__object__bank_account__status

  - dimension: data__object__bank_account__validated
    type: yesno
    sql: ${TABLE}.data__object__bank_account__validated

  - dimension: data__object__bank_account__verified
    type: yesno
    sql: ${TABLE}.data__object__bank_account__verified

  - dimension: data__object__brand
    type: string
    sql: ${TABLE}.data__object__brand

  - dimension: data__object__business_logo
    type: string
    sql: ${TABLE}.data__object__business_logo

  - dimension: data__object__business_name
    type: string
    sql: ${TABLE}.data__object__business_name

  - dimension: data__object__business_primary_color
    type: string
    sql: ${TABLE}.data__object__business_primary_color

  - dimension: data__object__business_url
    type: string
    sql: ${TABLE}.data__object__business_url

  - dimension: data__object__captured
    type: yesno
    sql: ${TABLE}.data__object__captured

  - dimension: data__object__card__address_city
    type: string
    sql: ${TABLE}.data__object__card__address_city

  - dimension: data__object__card__address_country
    type: string
    sql: ${TABLE}.data__object__card__address_country

  - dimension: data__object__card__address_line1
    type: string
    sql: ${TABLE}.data__object__card__address_line1

  - dimension: data__object__card__address_line1_check
    type: string
    sql: ${TABLE}.data__object__card__address_line1_check

  - dimension: data__object__card__address_state
    type: string
    sql: ${TABLE}.data__object__card__address_state

  - dimension: data__object__card__address_zip
    type: string
    sql: ${TABLE}.data__object__card__address_zip

  - dimension: data__object__card__address_zip_check
    type: string
    sql: ${TABLE}.data__object__card__address_zip_check

  - dimension: data__object__card__brand
    type: string
    sql: ${TABLE}.data__object__card__brand

  - dimension: data__object__card__country
    type: string
    sql: ${TABLE}.data__object__card__country

  - dimension: data__object__card__customer
    type: string
    sql: ${TABLE}.data__object__card__customer

  - dimension: data__object__card__cvc_check
    type: string
    sql: ${TABLE}.data__object__card__cvc_check

  - dimension: data__object__card__exp_month
    type: number
    sql: ${TABLE}.data__object__card__exp_month

  - dimension: data__object__card__exp_year
    type: number
    sql: ${TABLE}.data__object__card__exp_year

  - dimension: data__object__card__fingerprint
    type: string
    sql: ${TABLE}.data__object__card__fingerprint

  - dimension: data__object__card__funding
    type: string
    sql: ${TABLE}.data__object__card__funding

  - dimension: data__object__card__id
    type: string
    sql: ${TABLE}.data__object__card__id

  - dimension: data__object__card__last4
    type: string
    sql: ${TABLE}.data__object__card__last4

  - dimension: data__object__card__name
    type: string
    sql: ${TABLE}.data__object__card__name

  - dimension: data__object__card__object
    type: string
    sql: ${TABLE}.data__object__card__object

  - dimension: data__object__cards__has_more
    type: yesno
    sql: ${TABLE}.data__object__cards__has_more

  - dimension: data__object__cards__object
    type: string
    sql: ${TABLE}.data__object__cards__object

  - dimension: data__object__cards__total_count
    type: number
    sql: ${TABLE}.data__object__cards__total_count

  - dimension: data__object__cards__url
    type: string
    sql: ${TABLE}.data__object__cards__url

  - dimension: data__object__charge
    type: string
    sql: ${TABLE}.data__object__charge

  - dimension: data__object__charge_enabled
    type: yesno
    sql: ${TABLE}.data__object__charge_enabled

  - dimension: data__object__charges_enabled
    type: yesno
    sql: ${TABLE}.data__object__charges_enabled

  - dimension: data__object__country
    type: string
    sql: ${TABLE}.data__object__country

  - dimension_group: data__object__created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.data__object__created

  - dimension: data__object__currency
    type: string
    sql: ${TABLE}.data__object__currency

  - dimension: data__object__customer
    type: string
    sql: ${TABLE}.data__object__customer

  - dimension: data__object__cvc_check
    type: string
    sql: ${TABLE}.data__object__cvc_check

  - dimension_group: data__object_
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.data__object__date

  - dimension: data__object__default_card
    type: string
    sql: ${TABLE}.data__object__default_card

  - dimension: data__object__default_currency
    type: string
    sql: ${TABLE}.data__object__default_currency

  - dimension: data__object__default_source
    type: string
    sql: ${TABLE}.data__object__default_source

  - dimension: data__object__delinquent
    type: yesno
    sql: ${TABLE}.data__object__delinquent

  - dimension: data__object__description
    type: string
    sql: ${TABLE}.data__object__description

  - dimension: data__object__destination
    type: string
    sql: ${TABLE}.data__object__destination

  - dimension: data__object__details_submitted
    type: yesno
    sql: ${TABLE}.data__object__details_submitted

  - dimension: data__object__display_name
    type: string
    sql: ${TABLE}.data__object__display_name

  - dimension: data__object__dispute__amount
    type: number
    sql: ${TABLE}.data__object__dispute__amount

  - dimension: data__object__dispute__balance_transaction
    type: string
    sql: ${TABLE}.data__object__dispute__balance_transaction

  - dimension: data__object__dispute__charge
    type: string
    sql: ${TABLE}.data__object__dispute__charge

  - dimension_group: data__object__dispute__created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.data__object__dispute__created

  - dimension: data__object__dispute__currency
    type: string
    sql: ${TABLE}.data__object__dispute__currency

  - dimension: data__object__dispute__evidence_due_by
    type: number
    sql: ${TABLE}.data__object__dispute__evidence_due_by

  - dimension: data__object__dispute__id
    type: string
    sql: ${TABLE}.data__object__dispute__id

  - dimension: data__object__dispute__is_charge_refundable
    type: yesno
    sql: ${TABLE}.data__object__dispute__is_charge_refundable

  - dimension: data__object__dispute__livemode
    type: yesno
    sql: ${TABLE}.data__object__dispute__livemode

  - dimension: data__object__dispute__object
    type: string
    sql: ${TABLE}.data__object__dispute__object

  - dimension: data__object__dispute__reason
    type: string
    sql: ${TABLE}.data__object__dispute__reason

  - dimension: data__object__dispute__status
    type: string
    sql: ${TABLE}.data__object__dispute__status

  - dimension: data__object__email
    type: string
    sql: ${TABLE}.data__object__email

  - dimension: data__object__evidence_due_by
    type: number
    sql: ${TABLE}.data__object__evidence_due_by

  - dimension: data__object__exp_month
    type: number
    sql: ${TABLE}.data__object__exp_month

  - dimension: data__object__exp_year
    type: number
    sql: ${TABLE}.data__object__exp_year

  - dimension: data__object__failure_code
    type: string
    sql: ${TABLE}.data__object__failure_code

  - dimension: data__object__failure_message
    type: string
    sql: ${TABLE}.data__object__failure_message

  - dimension: data__object__fingerprint
    type: string
    sql: ${TABLE}.data__object__fingerprint

  - dimension: data__object__fraud_details__stripe_report
    type: string
    sql: ${TABLE}.data__object__fraud_details__stripe_report

  - dimension: data__object__fraud_details__user_report
    type: string
    sql: ${TABLE}.data__object__fraud_details__user_report

  - dimension: data__object__funding
    type: string
    sql: ${TABLE}.data__object__funding

  - dimension: data__object__id
    type: string
    sql: ${TABLE}.data__object__id

  - dimension: data__object__is_charge_refundable
    type: yesno
    sql: ${TABLE}.data__object__is_charge_refundable

  - dimension: data__object__last4
    type: string
    sql: ${TABLE}.data__object__last4

  - dimension: data__object__livemode
    type: yesno
    sql: ${TABLE}.data__object__livemode

  - dimension: data__object__managed
    type: yesno
    sql: ${TABLE}.data__object__managed

  - dimension: data__object__method
    type: string
    sql: ${TABLE}.data__object__method

  - dimension: data__object__object
    type: string
    sql: ${TABLE}.data__object__object

  - dimension: data__object__open
    type: yesno
    sql: ${TABLE}.data__object__open

  - dimension: data__object__outcome__network_status
    type: string
    sql: ${TABLE}.data__object__outcome__network_status

  - dimension: data__object__outcome__reason
    type: string
    sql: ${TABLE}.data__object__outcome__reason

  - dimension: data__object__outcome__risk_level
    type: string
    sql: ${TABLE}.data__object__outcome__risk_level

  - dimension: data__object__outcome__seller_message
    type: string
    sql: ${TABLE}.data__object__outcome__seller_message

  - dimension: data__object__outcome__type
    type: string
    sql: ${TABLE}.data__object__outcome__type

  - dimension: data__object__paid
    type: yesno
    sql: ${TABLE}.data__object__paid

  - dimension: data__object__phone_number
    type: string
    sql: ${TABLE}.data__object__phone_number

  - dimension: data__object__reason
    type: string
    sql: ${TABLE}.data__object__reason

  - dimension: data__object__receipt_email
    type: string
    sql: ${TABLE}.data__object__receipt_email

  - dimension: data__object__receipt_number
    type: string
    sql: ${TABLE}.data__object__receipt_number

  - dimension: data__object__refunded
    type: yesno
    sql: ${TABLE}.data__object__refunded

  - dimension: data__object__refunds__has_more
    type: yesno
    sql: ${TABLE}.data__object__refunds__has_more

  - dimension: data__object__refunds__object
    type: string
    sql: ${TABLE}.data__object__refunds__object

  - dimension: data__object__refunds__total_count
    type: number
    sql: ${TABLE}.data__object__refunds__total_count

  - dimension: data__object__refunds__url
    type: string
    sql: ${TABLE}.data__object__refunds__url

  - dimension: data__object__reversals__has_more
    type: yesno
    sql: ${TABLE}.data__object__reversals__has_more

  - dimension: data__object__reversals__object
    type: string
    sql: ${TABLE}.data__object__reversals__object

  - dimension: data__object__reversals__total_count
    type: number
    sql: ${TABLE}.data__object__reversals__total_count

  - dimension: data__object__reversals__url
    type: string
    sql: ${TABLE}.data__object__reversals__url

  - dimension: data__object__reversed
    type: yesno
    sql: ${TABLE}.data__object__reversed

  - dimension: data__object__review
    type: string
    sql: ${TABLE}.data__object__review

  - dimension: data__object__source__brand
    type: string
    sql: ${TABLE}.data__object__source__brand

  - dimension: data__object__source__country
    type: string
    sql: ${TABLE}.data__object__source__country

  - dimension: data__object__source__customer
    type: string
    sql: ${TABLE}.data__object__source__customer

  - dimension: data__object__source__cvc_check
    type: string
    sql: ${TABLE}.data__object__source__cvc_check

  - dimension: data__object__source__exp_month
    type: number
    sql: ${TABLE}.data__object__source__exp_month

  - dimension: data__object__source__exp_year
    type: number
    sql: ${TABLE}.data__object__source__exp_year

  - dimension: data__object__source__fingerprint
    type: string
    sql: ${TABLE}.data__object__source__fingerprint

  - dimension: data__object__source__funding
    type: string
    sql: ${TABLE}.data__object__source__funding

  - dimension: data__object__source__id
    type: string
    sql: ${TABLE}.data__object__source__id

  - dimension: data__object__source__last4
    type: string
    sql: ${TABLE}.data__object__source__last4

  - dimension: data__object__source__name
    type: string
    sql: ${TABLE}.data__object__source__name

  - dimension: data__object__source__object
    type: string
    sql: ${TABLE}.data__object__source__object

  - dimension: data__object__source_type
    type: string
    sql: ${TABLE}.data__object__source_type

  - dimension: data__object__sources__has_more
    type: yesno
    sql: ${TABLE}.data__object__sources__has_more

  - dimension: data__object__sources__object
    type: string
    sql: ${TABLE}.data__object__sources__object

  - dimension: data__object__sources__total_count
    type: number
    sql: ${TABLE}.data__object__sources__total_count

  - dimension: data__object__sources__url
    type: string
    sql: ${TABLE}.data__object__sources__url

  - dimension: data__object__statement_description
    type: string
    sql: ${TABLE}.data__object__statement_description

  - dimension: data__object__statement_descriptor
    type: string
    sql: ${TABLE}.data__object__statement_descriptor

  - dimension: data__object__status
    type: string
    sql: ${TABLE}.data__object__status

  - dimension: data__object__subscriptions__has_more
    type: yesno
    sql: ${TABLE}.data__object__subscriptions__has_more

  - dimension: data__object__subscriptions__object
    type: string
    sql: ${TABLE}.data__object__subscriptions__object

  - dimension: data__object__subscriptions__total_count
    type: number
    sql: ${TABLE}.data__object__subscriptions__total_count

  - dimension: data__object__subscriptions__url
    type: string
    sql: ${TABLE}.data__object__subscriptions__url

  - dimension: data__object__support_email
    type: string
    sql: ${TABLE}.data__object__support_email

  - dimension: data__object__support_phone
    type: string
    sql: ${TABLE}.data__object__support_phone

  - dimension: data__object__support_url
    type: string
    sql: ${TABLE}.data__object__support_url

  - dimension: data__object__timezone
    type: string
    sql: ${TABLE}.data__object__timezone

  - dimension: data__object__transfer_enabled
    type: yesno
    sql: ${TABLE}.data__object__transfer_enabled

  - dimension: data__object__transfers_enabled
    type: yesno
    sql: ${TABLE}.data__object__transfers_enabled

  - dimension: data__object__type
    type: string
    sql: ${TABLE}.data__object__type

  - dimension: data__previous_attributes__amount_refunded
    type: number
    sql: ${TABLE}.data__previous_attributes__amount_refunded

  - dimension: data__previous_attributes__brand
    type: string
    sql: ${TABLE}.data__previous_attributes__brand

  - dimension: data__previous_attributes__business_name
    type: string
    sql: ${TABLE}.data__previous_attributes__business_name

  - dimension: data__previous_attributes__business_primary_color
    type: string
    sql: ${TABLE}.data__previous_attributes__business_primary_color

  - dimension: data__previous_attributes__business_url
    type: string
    sql: ${TABLE}.data__previous_attributes__business_url

  - dimension: data__previous_attributes__captured
    type: yesno
    sql: ${TABLE}.data__previous_attributes__captured

  - dimension: data__previous_attributes__charge_enabled
    type: yesno
    sql: ${TABLE}.data__previous_attributes__charge_enabled

  - dimension: data__previous_attributes__charges_enabled
    type: yesno
    sql: ${TABLE}.data__previous_attributes__charges_enabled

  - dimension: data__previous_attributes__cvc_check
    type: string
    sql: ${TABLE}.data__previous_attributes__cvc_check

  - dimension: data__previous_attributes__default_card
    type: string
    sql: ${TABLE}.data__previous_attributes__default_card

  - dimension: data__previous_attributes__default_source
    type: string
    sql: ${TABLE}.data__previous_attributes__default_source

  - dimension: data__previous_attributes__description
    type: string
    sql: ${TABLE}.data__previous_attributes__description

  - dimension: data__previous_attributes__details_submitted
    type: yesno
    sql: ${TABLE}.data__previous_attributes__details_submitted

  - dimension: data__previous_attributes__display_name
    type: string
    sql: ${TABLE}.data__previous_attributes__display_name

  - dimension: data__previous_attributes__dispute__amount
    type: number
    sql: ${TABLE}.data__previous_attributes__dispute__amount

  - dimension: data__previous_attributes__dispute__charge
    type: string
    sql: ${TABLE}.data__previous_attributes__dispute__charge

  - dimension_group: data__previous_attributes__dispute__created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.data__previous_attributes__dispute__created

  - dimension: data__previous_attributes__dispute__currency
    type: string
    sql: ${TABLE}.data__previous_attributes__dispute__currency

  - dimension: data__previous_attributes__dispute__evidence_due_by
    type: number
    sql: ${TABLE}.data__previous_attributes__dispute__evidence_due_by

  - dimension: data__previous_attributes__dispute__id
    type: string
    sql: ${TABLE}.data__previous_attributes__dispute__id

  - dimension: data__previous_attributes__dispute__is_charge_refundable
    type: yesno
    sql: ${TABLE}.data__previous_attributes__dispute__is_charge_refundable

  - dimension: data__previous_attributes__dispute__livemode
    type: yesno
    sql: ${TABLE}.data__previous_attributes__dispute__livemode

  - dimension: data__previous_attributes__dispute__object
    type: string
    sql: ${TABLE}.data__previous_attributes__dispute__object

  - dimension: data__previous_attributes__dispute__reason
    type: string
    sql: ${TABLE}.data__previous_attributes__dispute__reason

  - dimension: data__previous_attributes__dispute__status
    type: string
    sql: ${TABLE}.data__previous_attributes__dispute__status

  - dimension: data__previous_attributes__email
    type: string
    sql: ${TABLE}.data__previous_attributes__email

  - dimension: data__previous_attributes__exp_month
    type: number
    sql: ${TABLE}.data__previous_attributes__exp_month

  - dimension: data__previous_attributes__exp_year
    type: number
    sql: ${TABLE}.data__previous_attributes__exp_year

  - dimension: data__previous_attributes__fingerprint
    type: string
    sql: ${TABLE}.data__previous_attributes__fingerprint

  - dimension: data__previous_attributes__fraud_details__stripe_report
    type: string
    sql: ${TABLE}.data__previous_attributes__fraud_details__stripe_report

  - dimension: data__previous_attributes__last4
    type: string
    sql: ${TABLE}.data__previous_attributes__last4

  - dimension: data__previous_attributes__managed
    type: yesno
    sql: ${TABLE}.data__previous_attributes__managed

  - dimension: data__previous_attributes__phone_number
    type: string
    sql: ${TABLE}.data__previous_attributes__phone_number

  - dimension: data__previous_attributes__refunded
    type: yesno
    sql: ${TABLE}.data__previous_attributes__refunded

  - dimension: data__previous_attributes__refunds__has_more
    type: yesno
    sql: ${TABLE}.data__previous_attributes__refunds__has_more

  - dimension: data__previous_attributes__refunds__object
    type: string
    sql: ${TABLE}.data__previous_attributes__refunds__object

  - dimension: data__previous_attributes__refunds__total_count
    type: number
    sql: ${TABLE}.data__previous_attributes__refunds__total_count

  - dimension: data__previous_attributes__refunds__url
    type: string
    sql: ${TABLE}.data__previous_attributes__refunds__url

  - dimension: data__previous_attributes__statement_descriptor
    type: string
    sql: ${TABLE}.data__previous_attributes__statement_descriptor

  - dimension: data__previous_attributes__status
    type: string
    sql: ${TABLE}.data__previous_attributes__status

  - dimension: data__previous_attributes__support_email
    type: string
    sql: ${TABLE}.data__previous_attributes__support_email

  - dimension: data__previous_attributes__support_phone
    type: string
    sql: ${TABLE}.data__previous_attributes__support_phone

  - dimension: data__previous_attributes__transfer_enabled
    type: yesno
    sql: ${TABLE}.data__previous_attributes__transfer_enabled

  - dimension: data__previous_attributes__transfers_enabled
    type: yesno
    sql: ${TABLE}.data__previous_attributes__transfers_enabled

  - dimension: livemode
    type: yesno
    sql: ${TABLE}.livemode

  - dimension: object
    type: string
    sql: ${TABLE}.object

  - dimension: pending_webhooks
    type: number
    sql: ${TABLE}.pending_webhooks

  - dimension: request
    type: string
    sql: ${TABLE}.request

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - measure: count
    type: count
    drill_fields: detail*


  # ----- Sets of fields for drilling ------
  sets:
    detail:
    - id
    - data__object__bank_account__bank_name
    - data__object__business_name
    - data__object__card__name
    - data__object__display_name
    - data__previous_attributes__business_name
    - data__previous_attributes__display_name
    - data__object__source__name

