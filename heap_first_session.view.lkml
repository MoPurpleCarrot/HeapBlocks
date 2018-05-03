view: heap_first_session {
  derived_table: {
    sql: SELECT * FROM
      (SELECT user_id, referrer, landing_page, device_type, session_id, clean_utm_campaign_adwords_buckets, clean_utm_source, utm_source, utm_campaign, time as first_session_time, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY first_session_time asc) as rank
      FROM main_production.lead_source_tracking_1_start_session
      order by user_id, rank asc) as first_session
      WHERE rank = 1
       ;;

    datagroup_trigger: hourly_sync
    distribution: "first_session_time"
    sortkeys: ["first_session_time"]

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    primary_key: yes
  }

  dimension: session_id {
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension: utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: landing_page {
    type: string
    sql: ${TABLE}.landing_page ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: clean_utm_source {
    type: string
    sql: ${TABLE}.clean_utm_source ;;
  }

  dimension: clean_utm_campaign_adwords_buckets {
    type: string
    sql: ${TABLE}.clean_utm_campaign_adwords_buckets ;;
  }

  dimension_group: first_session {
    type: time
    sql: ${TABLE}.first_session_time ;;
    timeframes: [date, week, month, year]
  }

  set: detail {
    fields: [
      user_id,
      utm_source,
      utm_campaign,
      first_session_date
    ]
  }
}
