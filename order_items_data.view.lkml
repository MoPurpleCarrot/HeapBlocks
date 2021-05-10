view: order_items_data {
  # this is specifically for the ops report explore - it's a duplicate of the orders table without some specific fields
    sql_table_name: heroku_postgres.order_items ;;
    drill_fields: [id]

    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
      hidden:  yes
    }

    dimension_group: _sdc_batched {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      sql: ${TABLE}._sdc_batched_at ;;
      hidden:  yes
    }

    dimension_group: _sdc_received {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      sql: ${TABLE}._sdc_received_at ;;
      hidden:  yes
    }

    dimension: _sdc_sequence {
      type: number
      sql: ${TABLE}._sdc_sequence ;;
      hidden:  yes
    }

    dimension: _sdc_table_version {
      type: number
      sql: ${TABLE}._sdc_table_version ;;
      hidden:  yes
    }

    dimension_group: created {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      sql: ${TABLE}.created_at ;;
      hidden:  yes
    }

    dimension_group: deleted {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      sql: ${TABLE}.deleted_at ;;
    }

    dimension:  deleted_yn {
      type: yesno
      sql:  ${deleted_date} > 2015-01-01;;
      hidden:  yes
    }

    dimension: discount_cents {
      type: number
      sql: ${TABLE}.discount_cents ;;
      hidden: yes
    }

    dimension: discount_currency {
      type: string
      sql: ${TABLE}.discount_currency ;;
      hidden: yes
    }

    dimension: order_id {
      type: number
      sql: ${TABLE}.order_id ;;
      hidden:  yes
    }

    dimension: price_cents {
      type: number
      sql: ${TABLE}.price_cents ;;
      hidden: yes
    }

    dimension: price_currency {
      type: string
      sql: ${TABLE}.price_currency ;;
      hidden: yes
    }

    dimension: quantity {
      type: number
      sql: ${TABLE}.quantity ;;
      hidden: yes
    }

    dimension: recipe_id {
      type: number
      sql: ${TABLE}.recipe_id ;;
      hidden:  yes
    }

    dimension: tax_amount_cents {
      type: number
      sql: ${TABLE}.tax_amount_cents ;;
      hidden: yes
    }

    dimension: tax_amount_currency {
      type: string
      sql: ${TABLE}.tax_amount_currency ;;
      hidden: yes
    }

    dimension: tax_code {
      type: string
      sql: ${TABLE}.tax_code ;;
      hidden: yes
    }

    dimension: recipe_or_sku {
      type: string
      sql: ${TABLE}.type ;;
      hidden: yes
    }

    dimension: recipe_meal_type {
      type: string
      sql: ${products.recipe_meal_type};;
      hidden: yes
    }

    dimension: order_plan_code {
      type: number
      sql: ${orders_data.plan} ;;
      hidden: yes
    }

    dimension: order_plan_name {
      type: string
      sql: ${orders_data.plan_name} ;;
      hidden: yes
    }

    dimension: sku_id {
      type: string
      sql: ${TABLE}.sku_id ;;
      hidden:  yes
    }

    dimension: item_type {
      type: string
      sql:  CASE
          WHEN ${recipe_meal_type} = 2 THEN 'Lunch'
          WHEN ${recipe_meal_type} = 1 THEN 'Breakfast'
          WHEN ${recipe_meal_type} = 3 THEN 'Extension'
          WHEN ${recipe_meal_type} = 0 AND ${order_plan_name} = 'Prepared' THEN 'Dinner - Prep'
          WHEN ${recipe_meal_type} = 0 THEN 'Dinner - MK'
          END
          ;;
      hidden: yes
    }


    dimension: breakfast_binary {
      type: number
      sql: case when ${recipe_meal_type} = 1 Then 1
          Else 0
          END
          ;;
      hidden: yes
    }

    dimension: lunch_binary {
      type: number
      sql: case when ${recipe_meal_type} = 2 Then 1
          Else 0
          END
          ;;
      hidden: yes
    }

    dimension: dinner_binary {
      type: number
      sql: case when ${recipe_meal_type} = 0 Then 1
          Else 0
          END
          ;;
      hidden: yes
    }

    dimension: dinner_kit_count {
      type: number
      sql: case when ${recipe_meal_type} = 0 and ${skus.servings} = 4 Then 2
          When ${recipe_meal_type} = 0 and ${order_plan_code} = 6 Then 1
          When ${recipe_meal_type} = 0 Then 1
          Else 0
          END
          ;;
      hidden: yes
    }

    dimension: extension_binary {
      type: number
      sql: case when ${dinner_binary} = 1 Then 0
          when  ${lunch_binary} = 1 Then 0
          when ${breakfast_binary} = 1 Then 0
          Else 1*${quantity}
          END
          ;;
      hidden: yes
    }

    measure: count_breakfast_binary {
      type: sum
      sql: ${breakfast_binary} ;;
      hidden: yes
    }

    measure: count_lunch_binary {
      type: sum
      sql: ${lunch_binary} ;;
      hidden: yes
    }

    measure: count_dinner_binary {
      type: sum
      sql: ${dinner_binary} ;;
      hidden: yes
    }

    measure: count_dinner_kit {
      type: sum
      sql: ${dinner_kit_count} ;;
      hidden: yes
    }

    measure: count_extension_binary {
      type: sum
      sql: ${extension_binary} ;;
      hidden: yes
    }

    dimension: item_quantity {
      type: number
      sql:  CASE WHEN ${recipe_meal_type} = 3 THEN ${TABLE}.quantity
          WHEN ${order_plan_name} = 'Prepared' THEN ${TABLE}.quantity
          Else 1
          END
          ;;
    }

    measure: total_items {
      type: sum
      sql: ${item_quantity} ;;
    }

    dimension: breakfast_revenue {
      type: number
      sql: case when ${breakfast_binary} = 1 Then ${price_cents}
            Else 0
            END
            ;;
      hidden: yes
    }

    dimension: lunch_revenue {
      type: number
      sql: case when ${lunch_binary} = 1 Then ${price_cents}
          Else 0
          END
          ;;
      hidden: yes
    }

    dimension: dinner_revenue {
      type: number
      sql: case when ${dinner_binary} = 1 Then ${price_cents}
          Else 0
          END
          ;;
      hidden: yes
    }

    dimension: extension_revenue {
      type: number
      sql: case when ${extension_binary} > 0 Then ${price_cents}
          Else 0
          END
          ;;
      hidden: yes
    }

    measure: sum_breakfast_rev {
      type: sum
      sql: ${breakfast_revenue} ;;
      hidden: yes
    }

    measure: sum_lunch_rev {
      type: sum
      sql: ${lunch_revenue} ;;
      hidden: yes
    }

    measure: sum_dinner_rev {
      type: sum
      sql: ${dinner_revenue} ;;
      hidden: yes
    }

    measure: sum_extension_rev {
      type: sum
      sql: ${extension_revenue} ;;
      hidden: yes
    }

    dimension_group: updated {
      type: time
      timeframes: [
        raw,
        time,
        date,
        week,
        month,
        quarter,
        year
      ]
      sql: ${TABLE}.updated_at ;;
      hidden:  yes
    }

    measure: count {
      type: count
      drill_fields: [id]
    }

    measure: total_revenue{
      type: sum
      sql: ${price_cents} ;;
      value_format_name: usd
      hidden: yes
    }
  }
