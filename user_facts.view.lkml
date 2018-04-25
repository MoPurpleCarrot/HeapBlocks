view: user_facts {
  derived_table: {
    sql: SELECT users.id,
      subscriptions.registered_at as registered_at,
      COUNT(orders.id) as num_orders,
      SUM(orders.price) as total_revenue,
      MIN(orders.delivery_on) as first_order,
      MIN(orders.id) as first_order_id,
      MAX(orders.delivery_on) as last_order,
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
    sql:  CASE WHEN ${num_orders} > 5 THEN 'c) Long Term (6+)'
    WHEN ${num_orders} > 1 THEN 'b) Short Term (2-5)'
    WHEN ${num_orders} = 1 THEN 'a) One & Done'
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
    timeframes: [date, week, month, quarter, year]
    sql: ${TABLE}.first_order ;;
  }

  dimension: days_step_2_to_3 {
    type: number
    sql: DATEDIFF(day, ${TABLE}.created, ${TABLE}.registered_at);;
  }

  dimension: under_16_days_step_2_to_3 {
    type:  yesno
    sql: ${days_step_2_to_3} < 16 ;;
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

  dimension: is_customer_after_6_months {
    type: yesno
    sql: DATEDIFF(month, ${first_order_date}, ${last_order_date}) > 6 ;;
  }

}
