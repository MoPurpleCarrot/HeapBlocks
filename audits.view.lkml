view: audits {
  sql_table_name: zendesk.audits ;;

  dimension: id {
    primary_key: yes
    type: number
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

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: metadata__decoration__author__category {
    type: string
    sql: ${TABLE}.metadata__decoration__author__category ;;
  }

  dimension: metadata__decoration__author__id {
    type: string
    sql: ${TABLE}.metadata__decoration__author__id ;;
  }

  dimension: metadata__decoration__author__name {
    type: string
    sql: ${TABLE}.metadata__decoration__author__name ;;
  }

  dimension: metadata__decoration__author__photo_url {
    type: string
    sql: ${TABLE}.metadata__decoration__author__photo_url ;;
  }

  dimension: metadata__decoration__author__screen_name {
    type: string
    sql: ${TABLE}.metadata__decoration__author__screen_name ;;
  }

  dimension: metadata__decoration__created_at {
    type: string
    sql: ${TABLE}.metadata__decoration__created_at ;;
  }

  dimension: metadata__decoration__external_id {
    type: string
    sql: ${TABLE}.metadata__decoration__external_id ;;
  }

  dimension: metadata__decoration__inactive {
    type: yesno
    sql: ${TABLE}.metadata__decoration__inactive ;;
  }

  dimension: metadata__decoration__link {
    type: string
    sql: ${TABLE}.metadata__decoration__link ;;
  }

  dimension: metadata__decoration__name {
    type: string
    sql: ${TABLE}.metadata__decoration__name ;;
  }

  dimension: metadata__decoration__resource_type {
    type: string
    sql: ${TABLE}.metadata__decoration__resource_type ;;
  }

  dimension: metadata__decoration__source__id__bigint {
    type: number
    value_format_name: id
    sql: ${TABLE}.metadata__decoration__source__id__bigint ;;
  }

  dimension: metadata__decoration__source__id__string {
    type: string
    sql: ${TABLE}.metadata__decoration__source__id__string ;;
  }

  dimension: metadata__decoration__source__name {
    type: string
    sql: ${TABLE}.metadata__decoration__source__name ;;
  }

  dimension: metadata__decoration__source__screen_name {
    type: string
    sql: ${TABLE}.metadata__decoration__source__screen_name ;;
  }

  dimension: metadata__decoration__source__zendesk_id {
    type: number
    sql: ${TABLE}.metadata__decoration__source__zendesk_id ;;
  }

  dimension: metadata__decoration__type {
    type: string
    sql: ${TABLE}.metadata__decoration__type ;;
  }

  dimension: metadata__decoration__version {
    type: number
    sql: ${TABLE}.metadata__decoration__version ;;
  }

  dimension: metadata__suspension_type_id {
    type: number
    sql: ${TABLE}.metadata__suspension_type_id ;;
  }

  dimension: metadata__system__client {
    type: string
    sql: ${TABLE}.metadata__system__client ;;
  }

  dimension: metadata__system__ip_address {
    type: string
    sql: ${TABLE}.metadata__system__ip_address ;;
  }

  dimension: metadata__system__json_email_identifier {
    type: string
    sql: ${TABLE}.metadata__system__json_email_identifier ;;
  }

  dimension: metadata__system__latitude {
    type: number
    sql: ${TABLE}.metadata__system__latitude ;;
  }

  dimension: metadata__system__location {
    type: string
    sql: ${TABLE}.metadata__system__location ;;
  }

  dimension: metadata__system__longitude {
    type: number
    sql: ${TABLE}.metadata__system__longitude ;;
  }

  dimension: metadata__system__message_id {
    type: string
    sql: ${TABLE}.metadata__system__message_id ;;
  }

  dimension: metadata__system__raw_email_identifier {
    type: string
    sql: ${TABLE}.metadata__system__raw_email_identifier ;;
  }

  dimension: metadata__trusted {
    type: yesno
    sql: ${TABLE}.metadata__trusted ;;
  }

  dimension: ticket_id {
    type: number
    # hidden: true
    sql: ${TABLE}.ticket_id ;;
  }

  dimension: via__channel {
    type: string
    sql: ${TABLE}.via__channel ;;
  }

  dimension: via__source__from__address {
    type: string
    sql: ${TABLE}.via__source__from__address ;;
  }

  dimension: via__source__from__facebook_id {
    type: string
    sql: ${TABLE}.via__source__from__facebook_id ;;
  }

  dimension: via__source__from__formatted_phone {
    type: string
    sql: ${TABLE}.via__source__from__formatted_phone ;;
  }

  dimension: via__source__from__id {
    type: number
    sql: ${TABLE}.via__source__from__id ;;
  }

  dimension: via__source__from__name {
    type: string
    sql: ${TABLE}.via__source__from__name ;;
  }

  dimension: via__source__from__phone {
    type: string
    sql: ${TABLE}.via__source__from__phone ;;
  }

  dimension: via__source__from__profile_url {
    type: string
    sql: ${TABLE}.via__source__from__profile_url ;;
  }

  dimension: via__source__from__subject {
    type: string
    sql: ${TABLE}.via__source__from__subject ;;
  }

  dimension: via__source__from__ticket_id {
    type: number
    sql: ${TABLE}.via__source__from__ticket_id ;;
  }

  dimension: via__source__from__title {
    type: string
    sql: ${TABLE}.via__source__from__title ;;
  }

  dimension: via__source__rel {
    type: string
    sql: ${TABLE}.via__source__rel ;;
  }

  dimension: via__source__to__address {
    type: string
    sql: ${TABLE}.via__source__to__address ;;
  }

  dimension: via__source__to__facebook_id {
    type: string
    sql: ${TABLE}.via__source__to__facebook_id ;;
  }

  dimension: via__source__to__formatted_phone {
    type: string
    sql: ${TABLE}.via__source__to__formatted_phone ;;
  }

  dimension: via__source__to__name {
    type: string
    sql: ${TABLE}.via__source__to__name ;;
  }

  dimension: via__source__to__phone {
    type: string
    sql: ${TABLE}.via__source__to__phone ;;
  }

  dimension: via__source__to__profile_url {
    type: string
    sql: ${TABLE}.via__source__to__profile_url ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      via__source__from__name,
      via__source__to__name,
      metadata__decoration__author__name,
      metadata__decoration__source__name,
      metadata__decoration__name,
      metadata__decoration__source__screen_name,
      metadata__decoration__author__screen_name,
      tickets.via__source__from__name,
      tickets.via__source__to__name,
      tickets.via__source__from__ticket_id,
      audits__events.count
    ]
  }
}
