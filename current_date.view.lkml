view: current_date {
  derived_table: {
    sql: select current_date
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  set: detail {
    fields: [date]
  }
}
