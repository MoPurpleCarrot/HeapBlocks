view: user_facts_extra_breakfast {
  derived_table: {
    sql: SELECT users.id,
      COUNT(orders.id) as num_breakfast_orders,
      SUM(order_items.price_cents) as total_breakfast_revenue,
      MIN(orders.delivery_on) as first_breakfast_order,
      MIN(orders.id) as first_breakfast_order_id,
      MAX(orders.delivery_on) as last_breakfast_order,
      MAX(orders.id) as last_breakfast_order_id

      FROM heroku_postgres.users as users
      LEFT JOIN heroku_postgres.subscriptions as subscriptions
      ON users.id = subscriptions.user_id
      LEFT JOIN heroku_postgres.orders as orders
      ON subscriptions.id = orders.subscription_id
      Left Join heroku_postgres.order_items as order_items
      on orders.id = order_items.order_id
      left join heroku_postgres.skus as skus
      on order_items.sku_id = skus.id
      left join heroku_postgres.products as products
      on skus.product_id = products.id

      WHERE orders.status = 3 AND orders.extras_price > 0 AND products.recipe_meal_type = 1 and order_items.deleted_at is null
      GROUP BY 1
       ;;
# AND order_items.deleted_at = NULL
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

    dimension: num_breakfast_orders {
      type: number
      sql: ${TABLE}.num_breakfast_orders ;;
    }

    dimension: breakfast_num_orders_group {
      type: string
      sql:  CASE WHEN ${num_breakfast_orders} = 1 THEN '1'
            WHEN ${num_breakfast_orders} = 2 THEN '2'
            WHEN ${num_breakfast_orders} = 3 THEN '3'
            WHEN ${num_breakfast_orders} = 4 THEN '4'
            WHEN ${num_breakfast_orders} = 5 THEN '5'
            WHEN ${num_breakfast_orders} > 5 THEN '6+'
            ELSE NULL
            END
            ;;
    }

  dimension: breakfast_wk_adoption_group {
    type: string
    sql:  CASE WHEN ${week_registered_to_breakfast_order} = 1 THEN '1'
            WHEN ${week_registered_to_breakfast_order} = 2 THEN '2'
            WHEN ${week_registered_to_breakfast_order} = 3 THEN '3'
            WHEN ${week_registered_to_breakfast_order} = 4 THEN '4'
            WHEN ${week_registered_to_breakfast_order} = 5 THEN '5'
            WHEN ${week_registered_to_breakfast_order} > 5 THEN '6+'
            ELSE NULL
            END
            ;;
  }

    dimension: total_breakfast_revenue {
      type: number
      sql: ${TABLE}.total_breakfast_revenue ;;
    }

    dimension_group: first_breakfast_order {
      type: time
      timeframes: [date, week, month, quarter, year]
      sql: ${TABLE}.first_breakfast_order ;;
    }

    dimension: first_breakfast_order_id {
      type: number
      sql: ${TABLE}.first_breakfast_order_id ;;
    }

    dimension_group: last_breakfast_order {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.last_breakfast_order ;;
    }

    dimension: last_breakfast_order_id {
      type: number
      sql: ${TABLE}.last_breakfast_order_id ;;
    }

    dimension: days_registered_to_breakfast_order {
      type: number
      sql: DATEDIFF(day, subscriptions.registered_at, ${TABLE}.first_breakfast_order);;
    }

    dimension: week_registered_to_breakfast_order{
      type: number
      sql: round(${days_registered_to_breakfast_order}/7,0)
        ;;
    }


  }
