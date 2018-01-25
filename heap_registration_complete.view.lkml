view: heap_registration_complete {
  derived_table: {
    sql: Select * FROM
      (SELECT user_id, session_id, landing_page, device_type, referrer, utm_source, utm_campaign, time as registration_complete_time, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY registration_complete_time asc) as rank
      FROM main_production.lead_source_tracking_3_combo_registration
      order by user_id, rank asc) as account_created
      WHERE rank = 1
 ;;

  datagroup_trigger: hourly_sync
  distribution: "registration_complete_time"
  sortkeys: ["registration_complete_time"]

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

  dimension: landing_page {
    type: string
    sql: ${TABLE}.landing_page ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: referrer {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension_group: registration_complete {
    type: time
    sql: ${TABLE}.registration_complete_time ;;
    timeframes: [date,week,month,year]
  }

  set: detail {
    fields: [
      user_id,
      session_id,
      utm_source,
      utm_campaign,
      registration_complete_date
    ]
  }
}
