view: current_date {
  derived_table: {
    sql: select current_date
      ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

}
