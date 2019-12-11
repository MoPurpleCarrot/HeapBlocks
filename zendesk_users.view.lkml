view: zendesk_users {
  sql_table_name: zendesk.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
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

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: alias {
    type: string
    sql: ${TABLE}.alias ;;
  }

  dimension: chat_only {
    type: yesno
    sql: ${TABLE}.chat_only ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: default_group_id {
    type: number
    sql: ${TABLE}.default_group_id ;;
  }

  dimension: details {
    type: string
    sql: ${TABLE}.details ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: iana_time_zone {
    type: string
    sql: ${TABLE}.iana_time_zone ;;
  }

  dimension_group: last_login {
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
    sql: ${TABLE}.last_login_at ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: locale_id {
    type: number
    sql: ${TABLE}.locale_id ;;
  }

  dimension: moderator {
    type: yesno
    sql: ${TABLE}.moderator ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: only_private_comments {
    type: yesno
    sql: ${TABLE}.only_private_comments ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
  }

  dimension: permanently_deleted {
    type: yesno
    sql: ${TABLE}.permanently_deleted ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo__content_type {
    type: string
    sql: ${TABLE}.photo__content_type ;;
  }

  dimension: photo__content_url {
    type: string
    sql: ${TABLE}.photo__content_url ;;
  }

  dimension: photo__file_name {
    type: string
    sql: ${TABLE}.photo__file_name ;;
  }

  dimension: photo__height {
    type: number
    sql: ${TABLE}.photo__height ;;
  }

  dimension: photo__id {
    type: number
    sql: ${TABLE}.photo__id ;;
  }

  dimension: photo__inline {
    type: yesno
    sql: ${TABLE}.photo__inline ;;
  }

  dimension: photo__mapped_content_url {
    type: string
    sql: ${TABLE}.photo__mapped_content_url ;;
  }

  dimension: photo__size {
    type: number
    sql: ${TABLE}.photo__size ;;
  }

  dimension: photo__url {
    type: string
    sql: ${TABLE}.photo__url ;;
  }

  dimension: photo__width {
    type: number
    sql: ${TABLE}.photo__width ;;
  }

  dimension: report_csv {
    type: yesno
    sql: ${TABLE}.report_csv ;;
  }

  dimension: restricted_agent {
    type: yesno
    sql: ${TABLE}.restricted_agent ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: shared {
    type: yesno
    sql: ${TABLE}.shared ;;
  }

  dimension: shared_agent {
    type: yesno
    sql: ${TABLE}.shared_agent ;;
  }

  dimension: shared_phone_number {
    type: yesno
    sql: ${TABLE}.shared_phone_number ;;
  }

  dimension: signature {
    type: string
    sql: ${TABLE}.signature ;;
  }

  dimension: suspended {
    type: yesno
    sql: ${TABLE}.suspended ;;
  }

  dimension: ticket_restriction {
    type: string
    sql: ${TABLE}.ticket_restriction ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}.time_zone ;;
  }

  dimension: two_factor_auth_enabled {
    type: yesno
    sql: ${TABLE}.two_factor_auth_enabled ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: verified {
    type: yesno
    sql: ${TABLE}.verified ;;
  }

  measure: count {
    type: count
    drill_fields: [id, photo__file_name, name]
  }
}
