view: shipment_items {
  sql_table_name: heroku_postgres.shipment_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
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
    hidden: yes
  }

  dimension_group: _sdc_extracted {
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
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
    hidden: yes
  }

  dimension: shipment_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.shipment_id ;;
    hidden: yes
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
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
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, shipments.id]
    hidden: yes
  }

  dimension: recipe_meal_type {
    type: string
    sql: ${products.recipe_meal_type};;
    hidden: yes
  }

  dimension: item_quantity_post_carts {
    type: number
    sql:  CASE WHEN ${recipe_meal_type} = 3 THEN ${TABLE}.quantity
        WHEN (${skus.plan_group} = 'prepared_one_serving' and ${recipe_meal_type} = 0) THEN ${TABLE}.quantity
        WHEN (${skus.plan_group} = 'four_servings' and ${recipe_meal_type} = 0) THEN (2*${TABLE}.quantity)
        Else (1*${TABLE}.quantity)
        END
        ;;
  }

  dimension: item_type {
    type: string
    sql:  CASE
          WHEN ${recipe_meal_type} = 2 THEN 'Lunch'
          WHEN ${recipe_meal_type} = 1 THEN 'Breakfast'
          WHEN ${recipe_meal_type} = 3 THEN 'Extension'
          WHEN ${recipe_meal_type} = 0 AND ${skus.plan_group} = 'prepared_one_serving' THEN 'Dinner - Prep'
          WHEN ${recipe_meal_type} = 0 AND ${skus.plan_group} = 'four_servings' THEN 'Dinner - MK - 4'
          WHEN ${recipe_meal_type} = 0 THEN 'Dinner - MK - 2'
          END
          ;;
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

  measure: total_items_post_carts {
    type: sum
    sql: ${item_quantity_post_carts} ;;
  }


  measure: mk_count {
    type:  count_distinct
    filters: [item_type: "Breakfast,Lunch,Dinner - MK - 2,Dinner - MK - 4"]
    sql:${sku_id} ;;
  }

  measure: prep_count {
    type:  count_distinct
    filters: [item_type: "Dinner - Prep"]
    sql:${sku_id} ;;
  }

  measure: flex_contract_box_type {
    type:  string
    sql: case when ${mk_count}>0 and ${prep_count}>0 then 'Flex'
      when  ${mk_count}>0 and ${prep_count}=0 then 'Meal Kit'
      when ${mk_count}=0 and  ${prep_count}>0 then 'Prepared'
      else null
      end;;

    }

}
