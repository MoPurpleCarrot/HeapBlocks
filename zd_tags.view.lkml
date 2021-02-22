view: zd_tags {
  sql_table_name: zendesk_current.tags ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
