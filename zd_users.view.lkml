view: zd_users {
  sql_table_name: zendesk_current.users ;;
  drill_fields: [zd_id]

  dimension: zd_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
}

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
  }
}
