view: staging_orders_derived {
    derived_table: {
      sql:SELECT
          menus.id  AS "menus_id",
          COUNT(CASE WHEN (orders.billing_status  = 4) THEN 1 ELSE NULL END) AS "total_orders"
        FROM public.menus
        join public.orders on orders.menu_id = menus.id
        GROUP BY 1
        ;;
    }
  dimension: menus_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."menus_id" ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}."total_orders" ;;
  }

  measure: total_orders_count{
    type: list
    list_field: total_orders
}

}
