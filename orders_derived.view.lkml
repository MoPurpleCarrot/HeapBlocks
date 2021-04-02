view: orders_derived {
    derived_table: {
      sql:SELECT
          menus.id  AS "menus_id",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) THEN 1 ELSE NULL END) AS "total_orders",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1 and orders.ship_template_fulfillment_center = 'ShipOnce_Parsippany') THEN 1 ELSE NULL END) AS "total_orders_so"
        FROM heroku_postgres.menus
        join heroku_postgres.orders on orders.menu_id = menus.id
        group by 1
        ;;
        }

    dimension: menus_id {
      primary_key: yes
      type: number
      sql: ${TABLE}."menus_id" ;;
    }

   dimension: total_orders_dimension {
    type: number
    sql: ${TABLE}."total_orders" ;;
    }

  dimension: total_orders_so {
    type: number
    sql: ${TABLE}."total_orders_so" ;;
  }


  measure: total_orders_measure{
    type:  sum_distinct
    sql: ${total_orders_dimension};;
   }

  measure: total_orders_so_measure{
    type:  sum_distinct
    sql: ${total_orders_so};;
  }

  }
