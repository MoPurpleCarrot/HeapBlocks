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

  dimension: total_orders_fedex_air {
    type: number
    sql: ${TABLE}."total_orders_fedex_air" ;;
  }

  dimension: total_orders_fedex_ground {
    type: number
    sql: ${TABLE}."total_orders_fedex_ground" ;;
  }

  dimension: total_orders_fedex_ground_sunday {
    type: number
    sql: ${TABLE}."total_orders_fedex_ground_sunday" ;;
  }

  dimension: total_orders_lasership {
    type: number
    sql: ${TABLE}."total_orders_lasership" ;;
  }

  dimension: total_orders_ontrac {
    type: number
    sql: ${TABLE}."total_orders_ontrac" ;;
  }

  dimension: total_orders_uds {
    type: number
    sql: ${TABLE}."total_orders_uds" ;;
  }

    measure: total_orders_measure{
      type:  sum_distinct
      sql: ${total_orders_dimension};;
    }

  measure: total_orders_get_fresh_measure{
    type:  sum_distinct
    sql: ${total_orders_get_fresh} ;;
  }

  measure: total_orders_ship_once_measure{
    type:  sum_distinct
    sql: ${total_orders_ship_once} ;;
  }

  measure: total_orders_fdm_measure{
    type:  sum_distinct
    sql: ${total_orders_fdm} ;;
  }

  measure: total_orders_fedex_air_measure {
    type: sum_distinct
    sql: ${total_orders_fedex_air} ;;
  }

  measure: total_orders_fedex_ground_measure {
    type: sum_distinct
    sql: ${total_orders_fedex_ground} ;;
  }

  measure: total_orders_fedex_ground_sunday_measure {
    type: sum_distinct
    sql: ${total_orders_fedex_ground_sunday} ;;
  }

  measure: total_orders_lasership_measure {
    type: sum_distinct
    sql: ${total_orders_lasership} ;;
  }

  measure: total_orders_ontrac_measure {
    type: sum_distinct
    sql: ${total_orders_ontrac} ;;
  }

   measure: total_orders_uds_measure {
    type: sum_distinct
    sql: ${total_orders_uds} ;;
  }

  }
