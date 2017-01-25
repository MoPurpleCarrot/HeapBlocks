view: user_facts {
  derived_table: {
    sql: SELECT users.id,
      COUNT(orders.id) as num_orders,
      SUM(orders.price) as total_revenue,
      MIN(orders.created_at) as first_order,
      MAX(orders.created_at) as last_order
      FROM heroku_postgres.users as users
      LEFT JOIN heroku_postgres.subscriptions as subscriptions
      ON users.id = subscriptions.user_id
      LEFT JOIN heroku_postgres.orders as orders
      ON subscriptions.id = orders.subscription_id
      GROUP BY 1
       ;;
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

  dimension: total_revenue {
    type: number
    sql: ${TABLE}.total_revenue ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: last_order {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.last_order ;;
  }
}
