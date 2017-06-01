view: main_production_heap {
  sql_table_name: main_production.session ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.session_id ;;
  }

  dimension: referring_url {
    type: string
    sql: ${TABLE}.referrer ;;
  }

  dimension: utm_source {
    type: string
    sql: ${TABLE}.utm_source ;;
  }

  dimension:utm_campaign {
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }

  dimension: session_time {
    type: date_time
    sql: ${TABLE}.time ;;
  }

  }
