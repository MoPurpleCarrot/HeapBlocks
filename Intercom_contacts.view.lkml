view: Intercom_contacts {
  sql_table_name: intercom_full_integration.contacts ;;

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

  dimension: anonymous {
    type: yesno
    sql: ${TABLE}.anonymous ;;
  }

  dimension: app_id {
    type: string
    sql: ${TABLE}.app_id ;;
  }

  dimension: avatar__image_url {
    type: string
    sql: ${TABLE}.avatar__image_url ;;
  }

  dimension: avatar__type {
    type: string
    sql: ${TABLE}.avatar__type ;;
  }

  dimension: companies__type {
    type: string
    sql: ${TABLE}.companies__type ;;
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

  dimension: custom_attributes__job_title {
    type: string
    sql: ${TABLE}.custom_attributes__job_title ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: has_hard_bounced {
    type: yesno
    sql: ${TABLE}.has_hard_bounced ;;
  }

  dimension_group: last_request {
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
    sql: ${TABLE}.last_request_at ;;
  }

  dimension: last_seen_ip {
    type: string
    sql: ${TABLE}.last_seen_ip ;;
  }

  dimension: location_data__city_name {
    type: string
    sql: ${TABLE}.location_data__city_name ;;
  }

  dimension: location_data__continent_code {
    type: string
    sql: ${TABLE}.location_data__continent_code ;;
  }

  dimension: location_data__country_code {
    type: string
    sql: ${TABLE}.location_data__country_code ;;
  }

  dimension: location_data__country_name {
    type: string
    sql: ${TABLE}.location_data__country_name ;;
  }

  dimension: location_data__latitude {
    type: number
    sql: ${TABLE}.location_data__latitude ;;
  }

  dimension: location_data__longitude {
    type: number
    sql: ${TABLE}.location_data__longitude ;;
  }

  dimension: location_data__postal_code {
    type: string
    sql: ${TABLE}.location_data__postal_code ;;
  }

  dimension: location_data__region_name {
    type: string
    sql: ${TABLE}.location_data__region_name ;;
  }

  dimension: location_data__timezone {
    type: string
    sql: ${TABLE}.location_data__timezone ;;
  }

  dimension: location_data__type {
    type: string
    sql: ${TABLE}.location_data__type ;;
  }

  dimension: marked_email_as_spam {
    type: yesno
    sql: ${TABLE}.marked_email_as_spam ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: pseudonym {
    type: string
    sql: ${TABLE}.pseudonym ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: segments__type {
    type: string
    sql: ${TABLE}.segments__type ;;
  }

  dimension: session_count {
    type: number
    sql: ${TABLE}.session_count ;;
  }

  dimension: social_profiles__type {
    type: string
    sql: ${TABLE}.social_profiles__type ;;
  }

  dimension: tags__type {
    type: string
    sql: ${TABLE}.tags__type ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unsubscribed_from_emails {
    type: yesno
    sql: ${TABLE}.unsubscribed_from_emails ;;
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

  dimension: user_agent_data {
    type: string
    sql: ${TABLE}.user_agent_data ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      location_data__region_name,
      location_data__country_name,
      location_data__city_name,
      users.name,
      users.location_data__region_name,
      users.location_data__country_name,
      users.location_data__city_name,
      users.id
    ]
  }
}
