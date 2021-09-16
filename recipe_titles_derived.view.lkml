view: recipe_titles_derived {
  derived_table: {
    sql: with all_recipes as(
      SELECT distinct
          "products"."title" AS Kit_Title,
          "products"."subtitle" AS "products.subtitle",
          "products"."title"||' '||"products"."subtitle" Recipe_Title,
          "products"."id" AS product_id,
          "recipe_feedbacks"."sku_id" AS "recipe_feedbacks.sku_id",
           replace(replace(replace(recipe_title, 'and', ''), '&',''), ' ', '') trimmed_recipe,
           "skus".created_at
      FROM
          "heroku_postgres"."recipe_feedback_surveys" AS "recipe_feedback_surveys"
          LEFT JOIN "heroku_postgres"."recipe_feedbacks" AS "recipe_feedbacks" ON "recipe_feedback_surveys"."id" = "recipe_feedbacks"."recipe_feedback_survey_id"
          LEFT JOIN "heroku_postgres"."orders" AS "orders" ON "recipe_feedback_surveys"."order_id" = "orders"."id"
          LEFT JOIN "heroku_postgres"."order_items" AS "order_items" ON "orders"."id" = "order_items"."order_id"
          LEFT JOIN "heroku_postgres"."skus" AS "skus" ON "recipe_feedbacks"."sku_id" = "skus"."id" AND "order_items"."sku_id" = "skus"."id"
          LEFT JOIN "heroku_postgres"."products" AS "products" ON "skus"."product_id" = "products"."id"
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7
      ORDER BY
          6)
      ,latest_recipe_title as (
      SELECT distinct
          "products"."title"||' '||"products"."subtitle" Recipe_Title,
           replace(replace(replace(recipe_title, 'and', ''), '&',''), ' ', '') trimmed_recipe,
           show_in_products_catalog
      FROM
          "heroku_postgres"."recipe_feedback_surveys" AS "recipe_feedback_surveys"
          LEFT JOIN "heroku_postgres"."recipe_feedbacks" AS "recipe_feedbacks" ON "recipe_feedback_surveys"."id" = "recipe_feedbacks"."recipe_feedback_survey_id"
          LEFT JOIN "heroku_postgres"."orders" AS "orders" ON "recipe_feedback_surveys"."order_id" = "orders"."id"
          LEFT JOIN "heroku_postgres"."order_items" AS "order_items" ON "orders"."id" = "order_items"."order_id"
          LEFT JOIN "heroku_postgres"."skus" AS "skus" ON "recipe_feedbacks"."sku_id" = "skus"."id" AND "order_items"."sku_id" = "skus"."id"
          LEFT JOIN "heroku_postgres"."products" AS "products" ON "skus"."product_id" = "products"."id"
          where show_in_products_catalog =1
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1
      )
      select distinct a.Kit_Title, b.recipe_title, product_id, "recipe_feedbacks.sku_id"
      from all_recipes a
      join latest_recipe_title b on b.trimmed_recipe=a.trimmed_recipe
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: kit_title {
    type: string
    sql: ${TABLE}.kit_title ;;
  }

  dimension: recipe_title {
    type: string
    sql: ${TABLE}.recipe_title ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: recipe_feedbacks_sku_id {
    type: number
    primary_key: yes
    sql: ${TABLE}."recipe_feedbacks.sku_id" ;;
  }

  set: detail {
    fields: [kit_title, recipe_title, product_id, recipe_feedbacks_sku_id]
  }
}
