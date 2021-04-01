view: orders_derived_test {
  derived_table: {
    sql: SELECT
          menus.id  AS "menus_id",
          COUNT(CASE WHEN (orders.fulfillment_status  = 1) THEN 1 ELSE NULL END) AS "total_orders",
         ship_template_fulfillment_center
        FROM heroku_postgres.menus
        join heroku_postgres.orders on orders.menu_id = menus.id
        where   ship_template_fulfillment_center in ('Get_Fresh_Las_Vegas','FDM_Chicago','ShipOnce_Parsippany')
        group by menus.id , ship_template_fulfillment_center
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: menus_id {
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

  set: detail {
    fields: [menus_id, total_orders, ship_template_fulfillment_center]
  }
}
