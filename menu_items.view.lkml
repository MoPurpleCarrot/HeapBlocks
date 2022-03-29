view: menu_items {
  sql_table_name: heroku_postgres.menu_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: menu_id {
    type: number
    sql: ${TABLE}.menu_id ;;
  }

  dimension: recipe_id {
    type: number
    # hidden: true
    sql: ${TABLE}.recipe_id ;;
  }

  dimension: print_label {
    type: number

    sql: ${TABLE}.print_label ;;
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, menus.id, sku.id]
  }
}
