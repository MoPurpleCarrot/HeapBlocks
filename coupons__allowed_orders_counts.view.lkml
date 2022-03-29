view: coupons__allowed_orders_counts {
  sql_table_name: heroku_postgres.coupons__allowed_orders_counts ;;


  dimension: _sdc_source_key_id {
    type: number
    sql: ${TABLE}._sdc_source_key_id ;;
    primary_key: yes
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
