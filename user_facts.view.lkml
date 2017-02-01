view: user_facts {
  derived_table: {
    sql: SELECT users.id,
      COUNT(orders.id) as num_orders,
      SUM(orders.price) as total_revenue,
      MIN(orders.created_at) as first_order,
      MIN(orders.id) as first_order_id,
      MAX(orders.created_at) as last_order,
      MAX(orders.id) as last_order_id
      FROM heroku_postgres.users as users
      LEFT JOIN heroku_postgres.subscriptions as subscriptions
      ON users.id = subscriptions.user_id
      LEFT JOIN heroku_postgres.orders as orders
      ON subscriptions.id = orders.subscription_id
      GROUP BY 1
       ;;
#       sql_trigger_value: select current_date ;;
  }

  measure: count {
    type: count
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: num_orders {
    type: number
    sql: ${TABLE}.num_orders ;;
  }

  dimension: orders_group {
    type: string
    sql:  CASE WHEN ${num_orders} >= 20 THEN 'g) >20'
    WHEN ${num_orders} > 15 THEN 'f) 16 to 20'
    WHEN ${num_orders} > 10 THEN 'e) 11 to 15'
    WHEN ${num_orders} > 5 THEN 'd) 6 to 10'
    WHEN ${num_orders} > 3 THEN 'c) 4 to 5'
    WHEN ${num_orders} > 1 THEN 'b) 2 to 3'
    WHEN ${num_orders} = 1 THEN 'a) 1'
    ELSE NULL
    END
    ;;
  }

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension: first_order_id {
    type: number
    sql: ${TABLE}.first_order_id ;;
  }

  dimension_group: last_order {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_order ;;
  }

  dimension: last_order_id {
    type: number
    sql: ${TABLE}.last_order_id ;;
  }

}
