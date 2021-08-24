view: sab_sent {
  derived_table: {
    sql: select user_id
    ,count(*) sent_sab
      from heroku_postgres.giveaways
      where status = 1
      group by user_id
       ;;
  }

  measure: count {
    type: count_distinct
    sql: ${user_id} ;;
      }

  dimension: user_id {
    type: number
    primary_key:  yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: sent_sab {
    type: number
    sql: ${TABLE}.sent_sab ;;
  }

  dimension: sent_sab_group {
    type: string
    label: "Sent SAB Group"
    sql: CASE WHEN ${sent_sab} = 0 THEN '0'
          WHEN ${sent_sab} = 1 THEN '1'
          WHEN ${sent_sab} = 2 THEN '2'
          WHEN ${sent_sab} = 3 THEN '3'
          WHEN ${sent_sab} = 4 THEN '4'
          WHEN ${sent_sab} = 5 THEN '5'
          WHEN ${sent_sab} > 5 THEN '6+'
          ELSE 'Never Sent'
          END;;
  }

}
