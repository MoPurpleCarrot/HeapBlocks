view: orders_derived {
    derived_table: {
      sql:SELECT
          menus.id  AS "menus_id",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) THEN 1 ELSE NULL END) AS "total_orders",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) and (orders.ship_template_fulfillment_center = 'Get_Fresh_Las_Vegas')THEN 1 ELSE NULL END) AS "total_orders_gf",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) and (orders.ship_template_fulfillment_center = 'FDM_Chicago')THEN 1 ELSE NULL END) AS "total_orders_fdm",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) and (orders.ship_template_fulfillment_center = 'ShipOnce_Parsippany')THEN 1 ELSE NULL END) AS "total_orders_so"
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

  dimension: total_orders_get_fresh {
    type: number
    sql: ${TABLE}."total_orders_gf" ;;
  }

  dimension: total_orders_ship_once {
    type: number
    sql: ${TABLE}."total_orders_so" ;;
  }

  dimension: total_orders_fdm {
    type: number
    sql: ${TABLE}."total_orders_fdm" ;;
  }

    measure: total_orders_measure{
      type:  sum_distinct
      sql: ${total_orders_dimension} ;;
    }


  }
