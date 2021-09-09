view: max_week_recipe_feedback {
  derived_table: {
    sql: SELECT
          "products"."title" AS "products.meal_name",
          "products"."subtitle" AS "products.subtitle",
          "products"."sku_id" AS "products.sku_id"
              MAX((TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "recipe_feedbacks"."created_at")::integer - 3 + 7, 7)), "recipe_feedbacks"."created_at" )), 'YYYY-MM-DD'))) AS "recipe_feedbacks.created_week"
      FROM
          "heroku_postgres"."recipe_feedback_surveys" AS "recipe_feedback_surveys"
          LEFT JOIN "heroku_postgres"."recipe_feedbacks" AS "recipe_feedbacks" ON "recipe_feedback_surveys"."id" = "recipe_feedbacks"."recipe_feedback_survey_id"
          LEFT JOIN "heroku_postgres"."orders" AS "orders" ON "recipe_feedback_surveys"."order_id" = "orders"."id"
          LEFT JOIN "heroku_postgres"."order_items" AS "order_items" ON "orders"."id" = "order_items"."order_id"
          LEFT JOIN "heroku_postgres"."skus" AS "skus" ON "recipe_feedbacks"."sku_id" = "skus"."id" AND "order_items"."sku_id" = "skus"."id"
          LEFT JOIN "heroku_postgres"."products" AS "products" ON "skus"."product_id" = "products"."id"
      GROUP BY
          (DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "recipe_feedbacks"."created_at")::integer - 3 + 7, 7)), "recipe_feedbacks"."created_at" ))),
          1,
          2,
          3
      ORDER BY
          1
      LIMIT 500
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: products_meal_name {
    type: string
    sql: ${TABLE}."products.meal_name" ;;
  }

  dimension: products_subtitle {
    type: string
    sql: ${TABLE}."products.subtitle" ;;
  }

  dimension: products_sku_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."products.sku_id" ;;
  }

  dimension: recipe_feedbacks_created_week {
    type: string
    sql: ${TABLE}."recipe_feedbacks.created_week" ;;
  }

  set: detail {
    fields: [products_meal_name, products_subtitle, products_sku_id, recipe_feedbacks_created_week]
  }
}
