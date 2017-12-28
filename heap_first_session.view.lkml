view: heap_first_session {
  derived_table: {
    sql: SELECT * FROM
      (SELECT user_id, referrer, session_id, utm_source, utm_campaign, time as first_session_time, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY first_session_time asc) as rank
      FROM main_production.sessions
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
