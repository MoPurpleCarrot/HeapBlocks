view: user_facts_order {
  derived_table: {
    sql: SELECT user_facts.id,
      orders.coupon_code as coupon_code
      FROM ${user_facts.SQL_TABLE_NAME} as user_facts
      LEFT JOIN heroku_postgres.orders as orders
      ON user_facts.first_order_id = orders.id
      GROUP BY user_facts.id, orders.coupon_code
       ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_order_coupon_code {
    type: string
    sql: ${TABLE}.coupon_code ;;
  }
}
