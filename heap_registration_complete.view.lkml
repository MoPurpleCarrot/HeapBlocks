view: heap_registration_complete {
  derived_table: {
    sql: Select * FROM
      (SELECT user_id, session_id, utm_source, utm_campaign, time as registration_complete_time, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY registration_complete_time asc) as rank
      FROM main_production.sign_up_completed
      order by user_id, rank asc) as account_created
      WHERE rank = 1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    primary_key: yes
    hidden: yes
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
