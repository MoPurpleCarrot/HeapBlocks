view: meal_combo_derived {
  derived_table: {
    sql:SELECT
        orders.id as "order_id",
        listagg(menu_items_new.print_label,',') within group (order by menu_items_new.print_label) AS "meal_combo"
      FROM heroku_postgres.orders  AS orders
      LEFT JOIN heroku_postgres.order_items  AS order_items ON orders.id = order_items.order_id
      LEFT JOIN heroku_postgres.skus  AS skus ON skus.id = order_items.sku_id
      LEFT JOIN heroku_postgres.menus  AS menus ON orders.menu_id = menus.id
      LEFT JOIN heroku_postgres.menu_items  AS menu_items_new ON menu_items_new.sku_id= skus.id and menu_items_new.menu_id=menus.id
      WHERE order_items.deleted_at is null
      GROUP BY 1
      ORDER BY 2 DESC
      ;;
  }


  measure: count_distinct {
    type: count_distinct
    sql: ${meal_combo} ;;
  }


  dimension: meal_combo {
    type: string
    sql: ${TABLE}."meal_combo" ;;
  }

  dimension: order_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."order_id" ;;
  }

}
