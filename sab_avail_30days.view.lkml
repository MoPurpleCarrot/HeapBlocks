view: sab_avail_30days {
  derived_table: {
    sql: select user_id
          ,count(*) available_sab
            from heroku_postgres.giveaways
            where status = 0
            and created_at >= current_date-30
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

  dimension: available_sab {
    type: number
    sql: ${TABLE}.available_sab ;;
  }

  dimension: avail_sab_group {
    type: string
    label: "Avail SAB Group"
    sql: CASE WHEN ${available_sab} = 0 THEN '0'
          WHEN ${available_sab} = 1 THEN '1'
          WHEN ${available_sab} = 2 THEN '2'
          WHEN ${available_sab} = 3 THEN '3'
          WHEN ${available_sab} = 4 THEN '4'
          WHEN ${available_sab} = 5 THEN '5'
          WHEN ${available_sab} > 5 THEN '6+'
          ELSE 'None Available'
          END ;;
  }

}
