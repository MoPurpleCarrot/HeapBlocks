view: orders_derived {
    derived_table: {
      sql:SELECT
          menus.id  AS "menus_id",
          COUNT(CASE WHEN (orders.billing_status  = 4) THEN 1 ELSE NULL END) AS "total_orders"
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

    measure: total_orders_measure{
      type:  sum_distinct
      sql: ${total_orders_dimension} ;;
    }


  }
