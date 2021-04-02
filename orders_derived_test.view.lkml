view: orders_derived_test {
  derived_table: {
    sql: SELECT
          menus.id  AS "menus_id",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) THEN 1 ELSE NULL END) AS "total_orders"
          ,ship_template_fulfillment_center
          ,plan
          ,ship_template_shipping_provider
          FROM heroku_postgres.menus
        join heroku_postgres.orders on orders.menu_id = menus.id
        where   ship_template_fulfillment_center in ('Get_Fresh_Las_Vegas','FDM_Chicago','ShipOnce_Parsippany')
        group by menus.id,ship_template_fulfillment_center,plan
          ,ship_template_shipping_provider
 ;;
  }


  dimension: menus_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.menus_id ;;
  }

  dimension: total_orders {
    type: number
    sql: ${TABLE}.total_orders ;;
  }

  dimension: ship_template_fulfillment_center {
    type: string
    sql: ${TABLE}.ship_template_fulfillment_center ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: ship_template_shipping_provider {
    type: string
    sql: ${TABLE}.ship_template_shipping_provider ;;
  }

  measure: total_orders_measure {
    type:  sum_distinct
    sql: ${total_orders} ;;
  }


}
