view: sql_runner_query_test {
  derived_table: {
    sql: with tmp as(
      select cast(b.shipping_on as date) shipping_on
      ,count(distinct a.id) totalorders
      ,case when a.plan in (10) then 'Prepared' else 'Meal Kit'end plan, e.title meal
      ,case when e.recipe_meal_type = 0 then 'Dinner'
      when e.recipe_meal_type=1 then 'Breakfast'
      when e.recipe_meal_type = 2 then 'Lunch'
      when e.recipe_meal_type = 3 then 'Snack'
      end meal_type
      from heroku_postgres.orders a
      join heroku_postgres.menus b on b.id=a.menu_id
      join heroku_postgres.order_items c on c.order_id=a.id
      join heroku_postgres.skus d on d.id=c.sku_id
      join heroku_postgres.products e on e.id=d.product_id
      where b.shipping_on >= current_date-28 and b.shipping_on < current_date
      and a.fulfillment_status = 1
      and c.deleted_at is null
      and a.plan <> 10
      group by b.shipping_on
      ,case when a.plan in (10) then 'Prepared' else 'Meal Kit'end
      ,case when e.recipe_meal_type = 0 then 'Dinner'
      when e.recipe_meal_type=1 then 'Breakfast'
      when e.recipe_meal_type = 2 then 'Lunch'
      when e.recipe_meal_type = 3 then 'Snack'
      end
      ,e.title
      union all
      select cast(b.shipping_on as date) shipping_on
      ,sum(c.quantity) totalorders
      ,case when a.plan in (10) then 'Prepared' else 'Meal Kit'end plan, e.title meal
      ,case when e.recipe_meal_type = 0 then 'Dinner'
      when e.recipe_meal_type=1 then 'Breakfast'
      when e.recipe_meal_type = 2 then 'Lunch'
      when e.recipe_meal_type = 3 then 'Snack'
      end meal_type
      from heroku_postgres.orders a
      join heroku_postgres.menus b on b.id=a.menu_id
      join heroku_postgres.order_items c on c.order_id=a.id
      join heroku_postgres.skus d on d.id=c.sku_id
      join heroku_postgres.products e on e.id=d.product_id
      where b.shipping_on >= current_date-28 and b.shipping_on < current_date
      and a.fulfillment_status = 1
      and c.deleted_at is null
      and a.plan = 10
      group by b.shipping_on
      ,case when a.plan in (10) then 'Prepared' else 'Meal Kit'end
      ,case when e.recipe_meal_type = 0 then 'Dinner'
      when e.recipe_meal_type=1 then 'Breakfast'
      when e.recipe_meal_type = 2 then 'Lunch'
      when e.recipe_meal_type = 3 then 'Snack'
      end
      ,e.title
      ),
      tmp2 as(
      select a.*
      ,rank() over (partition by shipping_on,case when meal_type='Dinner' then plan else null end,meal_type order by totalorders desc) popularity
      from tmp a
      )
      select *
      from tmp2
      where meal_type = 'Dinner'
      and popularity in (1,2,3)
      union all
      select shipping_on, sum(totalorders) totalorders, 'Overall', meal, meal_type, popularity
      from tmp2
      where popularity = 1
      and meal_type in ('Breakfast','Lunch')
      group by shipping_on, meal, meal_type, popularity
      order by shipping_on, plan,meal_type, popularity asc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: shipping_on {
    type: date
    sql: ${TABLE}.shipping_on ;;
  }

  dimension: totalorders {
    type: number
    sql: ${TABLE}.totalorders ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
  }

  dimension: meal {
    type: string
    sql: ${TABLE}.meal ;;
  }

  dimension: meal_type {
    type: string
    sql: ${TABLE}.meal_type ;;
  }

  dimension: popularity {
    type: number
    sql: ${TABLE}.popularity ;;
  }

  set: detail {
    fields: [
      shipping_on,
      totalorders,
      plan,
      meal,
      meal_type,
      popularity
    ]
  }
}
