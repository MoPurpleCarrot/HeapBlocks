view: heap_account_created {
  derived_table: {
    sql: Select * FROM
      (SELECT user_id, session_id, utm_source, utm_campaign, time as account_created_time, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY account_created_time asc) as rank
      FROM main_production.sign_up_account_creation_submit_account_creation_form
      order by user_id, rank asc) as account_created
      WHERE rank = 1
 ;;
    datagroup_trigger: hourly_sync
    distribution: "account_created_time"
    sortkeys: ["account_created_time"]
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

  dimension_group: account_created {
    type: time
    sql: ${TABLE}.account_created_time ;;
    timeframes: [date, week, month, year]
  }

  set: detail {
    fields: [
      user_id,
      session_id,
      utm_source,
      utm_campaign,
      account_created_date
    ]
  }
}
