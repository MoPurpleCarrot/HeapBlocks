view: user_facts_extras {
  derived_table: {
    sql: SELECT users.id,
      COUNT(orders.id) as num_extras_orders,
      SUM(orders.price) as total_revenue,
      SUM(orders.extras_price) as extras_revenue,
      MIN(orders.delivery_on) as first_extras_order,
      MIN(orders.id) as first_extras_order_id,
      MAX(orders.delivery_on) as last_extras_order,
      MAX(orders.id) as last_extras_order_id

      FROM heroku_postgres.users as users
      LEFT JOIN heroku_postgres.subscriptions as subscriptions
      ON users.id = subscriptions.user_id
      LEFT JOIN heroku_postgres.orders as orders
      ON subscriptions.id = orders.subscription_id

      WHERE orders.status = 3 AND orders.extras_price > 0

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

    dimension: num_extras_orders {
      type: number
      sql: ${TABLE}.num_extras_orders ;;
    }

  dimension: extra_num_orders_group {
    type: string
    sql:  CASE WHEN ${num_extras_orders} = 1 THEN '1'
            WHEN ${num_extras_orders} = 2 THEN '2'
            WHEN ${num_extras_orders} = 3 THEN '3'
            WHEN ${num_extras_orders} = 4 THEN '4'
            WHEN ${num_extras_orders} = 5 THEN '5'
            WHEN ${num_extras_orders} > 5 THEN '6+'
            ELSE NULL
            END
            ;;
  }

  dimension: extra_wk_adoption_group {
    type: string
    sql:  CASE WHEN ${week_registered_to_extra_order} = 1 THEN '1'
            WHEN ${week_registered_to_extra_order} = 2 THEN '2'
            WHEN ${week_registered_to_extra_order} = 3 THEN '3'
            WHEN ${week_registered_to_extra_order} = 4 THEN '4'
            WHEN ${week_registered_to_extra_order} = 5 THEN '5'
            WHEN ${week_registered_to_extra_order} > 5 THEN '6+'
            ELSE NULL
            END
            ;;
  }

    dimension: total_extras_revenue {
      type: number
      sql: ${TABLE}.total_extras_revenue ;;
    }

    dimension_group: first_extras_order {
      type: time
      timeframes: [date, week, month, quarter, year]
      sql: ${TABLE}.first_extras_order ;;
    }

    dimension: first_extras_order_id {
      type: number
      sql: ${TABLE}.first_extras_order_id ;;
    }

    dimension_group: last_extras_order {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.last_extras_order ;;
    }

    dimension: last_extras_order_id {
      type: number
      sql: ${TABLE}.last_extras_order_id ;;
    }

  dimension: days_registered_to_extra_order {
    type: number
    sql: DATEDIFF(day, subscriptions.registered_at, ${TABLE}.first_extras_order);;
  }

  dimension: week_registered_to_extra_order{
    type: number
    sql: round(${days_registered_to_extra_order}/7,0)
      ;;
  }


  }
