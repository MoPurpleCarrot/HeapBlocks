view: subscription_order_num_derrived {
  derived_table: {
    sql: SELECT
        subscriptions.id  AS "subscriptions.id",
        COUNT(CASE WHEN (orders.status  = 3) THEN 1 ELSE NULL END) AS "orders.total_billed_count"
      FROM heroku_postgres.users  AS users
      LEFT JOIN heroku_postgres.subscriptions  AS subscriptions ON subscriptions.user_id = users.id
      LEFT JOIN heroku_postgres.orders  AS orders ON subscriptions.id = orders.subscription_id

      GROUP BY 1
      ORDER BY 2 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: subscriptions_id {
    type: number
    sql: ${TABLE}."subscriptions.id" ;;
  }

  dimension: orders_total_billed_count {
    type: number
    sql: ${TABLE}."orders.total_billed_count" ;;
  }

  dimension: order_num_group {
    type: string
    sql:  CASE WHEN ${orders_total_billed_count} > 5 THEN 'Long Term (6+)'
          WHEN ${orders_total_billed_count} > 2 THEN 'Short Term (3-5)'
          WHEN ${orders_total_billed_count} > 0 THEN 'Testers (1-2)'
          WHEN ${orders_total_billed_count} = 0 THEN 'No Orders (0)'
          ELSE NULL
          END
          ;;
  }

  set: detail {
    fields: [subscriptions_id, orders_total_billed_count]
  }
}
