view: user_facts_traffic {
  derived_table: {
    sql: SELECT user_facts.id,
      google_analytics_traffic.medium as medium
      FROM ${user_facts.SQL_TABLE_NAME} as user_facts
      LEFT JOIN google_analytics_traffic.report as google_analytics_traffic
      ON user_facts.first_order_id = google_analytics_traffic.transactionid
      GROUP BY user_facts.id, google_analytics_traffic.medium
       ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_order_medium {
    type: string
    sql: ${TABLE}.medium ;;
  }
}
