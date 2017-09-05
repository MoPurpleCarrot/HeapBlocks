view: sign_up_completed {
  sql_table_name: main_production.sign_up_account_creation_submit_account_creation_form ;;

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: event_id {
    type: number
    sql: ${TABLE}.event_id ;;
  }

  dimension: hash {
    type: string
    sql: ${TABLE}.hash ;;
  }

  dimension: href {
    type: string
    sql: ${TABLE}.href ;;
  }

  dimension: ip {
    type: string
    sql: ${TABLE}.ip ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}.landing_page ;;
  }

  dimension: library {
    type: string
    sql: ${TABLE}.library ;;
  }

  dimension: path {
    type: string
    sql: ${TABLE}.path ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: search_keyword {
    type: string
    sql: ${TABLE}.search_keyword ;;
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension_group: session {
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
    sql: ${TABLE}.session_time ;;
  }

  dimension: target_text {
    type: string
    sql: ${TABLE}.target_text ;;
  }

  dimension_group: time {
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
    sql: ${TABLE}.time ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: utm_content {
    type: string
    sql: ${TABLE}.utm_content ;;
  }

  dimension: utm_medium {
    type: string
    sql: ${TABLE}.utm_medium ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_term {
    type: string
    sql: ${TABLE}.utm_term ;;
  }

  dimension: vwo_modal_login_signup_desktop_ {
    type: string
    sql: ${TABLE}.vwo_modal_login_signup_desktop_ ;;
  }

  dimension: vwo_modal_login_signup_mobile_ {
    type: string
    sql: ${TABLE}.vwo_modal_login_signup_mobile_ ;;
  }

  dimension: vwo_remove_header_and_footer_links_on_checkout {
    type: string
    sql: ${TABLE}.vwo_remove_header_and_footer_links_on_checkout ;;
  }

  dimension: vwo_video_on_menu_page {
    type: string
    sql: ${TABLE}.vwo_video_on_menu_page ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
