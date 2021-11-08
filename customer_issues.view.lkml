view: customer_issues {
  sql_table_name: heroku_postgres.customer_issues ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
  }

  dimension: admin_id {
    type: number
    sql: ${TABLE}.admin_id ;;

  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: box_type {
    type: string
    sql: ${TABLE}.box_type ;;
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
  }

  dimension: delivery_tnt {
    type: string
    sql: ${TABLE}.delivery_tnt ;;
    hidden: yes
  }

  dimension: fulfillment_center {
    type: string
    sql: ${TABLE}.fulfillment_center ;;
    hidden:  yes
  }

  dimension: ingredient_id {
    type: number
    sql: ${TABLE}.ingredient_id ;;
    hidden:  yes
  }

  dimension: meal_combo {
    type: string
    sql: ${TABLE}.meal_combo ;;
  }

  dimension: notes {
    type: string
    case_sensitive: no
    drill_fields: [created_date, menus.shipping_date, reason, meal_letter, meal_combo, notes, orders_data.count, count, credit_transactions.sum_cx_credits, refunds.sum_cx_refunds]
    sql: ${TABLE}.notes ;;
  }

  dimension: ingredient_quantity {
    type: number
    sql: ${TABLE}.number_of_ingredients ;;
  }

  dimension: meal_quantity {
    type: number
    sql: ${TABLE}.number_of_skus ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    hidden:  yes
  }

  dimension: passed_five_days_freshness {
    type: string
    sql: ${TABLE}.passed_five_days_freshness ;;
  }

  dimension: plan {
    type: string
    sql: ${TABLE}.plan ;;
    hidden:  yes
  }

  dimension: meal_letter {
    type: string
    sql: ${TABLE}.print_label ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
    hidden:  yes
  }

  dimension: reason {
    type: string
    sql: ${TABLE}.reason ;;
  }

  dimension: refund_id {
    type: number
    sql: ${TABLE}.refund_id ;;
    hidden:  yes
  }

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}.shipping_carrier ;;
    hidden:  yes
  }

  dimension_group: shipping {
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
    sql: ${TABLE}.shipping_on ;;
    hidden:  yes
  }

  dimension: sku_id {
    type: number
    sql: ${TABLE}.sku_id ;;
    hidden:  yes
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

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
    hidden:  yes
  }

  dimension: zendesk_ticket_id {
    type: number
    sql: ${TABLE}.zendesk_ticket_id ;;
  }

  dimension: category {
    type: string
    sql:
     case
          when (${product_type}='Prepared' and ${TABLE}."reason" = 'Container Broken') then 'Fulfillment'
          when (${product_type}='Prepared'and ${TABLE}."reason" = 'Overripe') then 'Bad Entry'
          when (${product_type}='Prepared'and ${TABLE}."reason" = 'Underripe') then 'Bad Entry'
          when (${product_type}='Prepared'and ${TABLE}."reason" = 'Damaged Garlic') then 'Bad Entry'
          when (${product_type}='Prepared'and ${TABLE}."reason" = 'Missing Booklet') then 'Bad Entry'
          when (${product_type}='Prepared'and ${TABLE}."reason" = 'Missing Garlic') then 'Bad Entry'
          when (${product_type}='Prepared'and ${TABLE}."reason" = 'Missing Ingredient') then 'Bad Entry'

          when ${TABLE}."reason" = 'Arrived After Dinner' then 'Shipping'
          when ${TABLE}."reason" = 'Arrived Late 1+ Days' then 'Shipping'
          when ${TABLE}."reason" = 'Arrived Warm' then 'Shipping'
          when ${TABLE}."reason" = 'Damaged Box' then 'Shipping'
          when ${TABLE}."reason" = 'Delivery Instructions Not Followed' then 'Shipping'
          when ${TABLE}."reason" = 'Didn''t Arrive' then 'Shipping'
          when ${TABLE}."reason" = 'Tape Lifted/Open Box' then 'Shipping'
          when ${TABLE}."reason" = 'Tracking Number Issue' then 'Shipping'
          when ${TABLE}."reason" = 'Container Broken' then 'Shipping'
          when ${TABLE}."reason" = 'Broken Gel Pack' then 'Shipping'

          when ${TABLE}."reason" = 'Damaged' then 'Ingredient'
          when ${TABLE}."reason" = 'Food Poisoning' then 'Ingredient'
          when ${TABLE}."reason" = 'Spoiled' then 'Ingredient'
          when ${TABLE}."reason" = 'Overripe' then 'Ingredient'
          when ${TABLE}."reason" = 'Underripe' then 'Ingredient'
          when ${TABLE}."reason" = 'Damaged Garlic' then 'Ingredient'

          when ${TABLE}."reason" = 'Arrived Passed Expiration Date' then 'Fulfillment'
          when ${TABLE}."reason" = 'Incorrect Measurement' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Ingredient' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Meal' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Snack' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Booklet' then 'Fulfillment'
          when ${TABLE}."reason" = 'Missing Garlic' then 'Fulfillment'
          when ${TABLE}."reason" = 'Foreign Object' then 'Fulfillment'

          when ${TABLE}."reason" is null then null

          else 'Other'
          end;;
  }

  dimension: 2021_budget {
    type: number
    value_format_name: percent_2
    sql: case
    when ${category} = 'Shipping' then 0.0092
    when ${category} = 'Fulfillment' then 0.0079
    when ${category} = 'Ingredient' then .0117
    else null
    end
    ;;
    }



  measure: count_fulfillment_drills {
    type: count_distinct
    sql: case when (${action}= 0 or ${action} = 2) then ${id} else null end;;
    link: {
      label: "Issues Drilldown"
      url: "/explore/purplecarrot/users_data?fields=customer_issues.issues_drilldown*&f[customer_issues.category]={{ _filters['customer_issues.category'] | url_encode }}&f[orders_data.ship_template_fulfillment_center]={{ orders_data.ship_template_fulfillment_center._value | url_encode }}&f[menus.shipping_date]={{ menus.shipping_date._value | url_encode }}&f[customer_issues.reason]={{ customer_issues.reason._value | url_encode }}"
    }
    link: {
      label: "Orders Drilldown"
      url: "/explore/purplecarrot/users_data?fields=customer_issues.orders_drilldown*&f[customer_issues.category]={{ _filters['customer_issues.category'] | url_encode }}&f[orders_data.ship_template_fulfillment_center]={{ orders_data.ship_template_fulfillment_center._value | url_encode }}&f[menus.shipping_date]={{ menus.shipping_date._value | url_encode }}&f[customer_issues.reason]={{ customer_issues.reason._value | url_encode }}"
    }
    }

    measure: count_no_fulfillment_drills {
      type: count_distinct
      sql: case when (${action}= 0 or ${action} = 2) then ${id} else null end;;
      link: {
        label: "Issues Drilldown"
        url: "/explore/purplecarrot/users_data?fields=customer_issues.issues_drilldown*&f[customer_issues.category]={{ _filters['customer_issues.category'] | url_encode }}&f[menus.shipping_date]={{ menus.shipping_date._value | url_encode }}&f[customer_issues.reason]={{ customer_issues.reason._value | url_encode }}"
      }
      link: {
        label: "Orders Drilldown"
        url: "/explore/purplecarrot/users_data?fields=customer_issues.orders_drilldown*&f[customer_issues.category]={{ _filters['customer_issues.category'] | url_encode }}&f[menus.shipping_date]={{ menus.shipping_date._value | url_encode }}&f[customer_issues.reason]={{ customer_issues.reason._value | url_encode }}"
      }
     }

  measure: count {
    type: count_distinct
    sql:CASE WHEN ${action} != '1'
    THEN ${id}
    ELSE NULL
    END;;

  }

  measure: ing_count_errors {
    type: count_distinct
    sql:CASE WHEN ${action} != '1' and ${category} = 'Ingredient'
       THEN ${id}
       ELSE NULL
       END ;;
  }

  measure: ing_count_refunds{
    type: count_distinct
    sql: case when ${action}= 2 and ${category} = 'Ingredient'
      then ${id} else null end ;;
  }

  measure: ing_sum_credits{
    type: sum_distinct
    sql: case when ${action}= 0 and ${category} = 'Ingredient'
      then ${amount} else null end ;;
    value_format_name: usd
  }

  measure: ing_sum_refunds{
    type: sum
    sql: case when ${action}= 2 and ${category} = 'Ingredient'
      then ${amount} else null end ;;
    value_format_name: usd
  }


  measure: ful_count_errors {
    type: count_distinct
    sql:CASE WHEN ${action} != '1' and ${category} = 'Fulfillment'
       THEN ${id}
       ELSE NULL
       END ;;
  }
  measure: ful_count_refunds{
    type: count_distinct
    sql: case when ${action}= 2 and ${category} = 'Fulfillment'
      then ${id} else null end ;;
  }

  measure: ful_sum_credits{
    type: sum_distinct
    sql: case when ${action}= 0 and ${category} = 'Fulfillment'
      then ${amount} else null end ;;
    value_format_name: usd
  }

  measure: ful_sum_refunds{
    type: sum
    sql: case when ${action}= 2 and ${category} = 'Fulfillment'
      then ${amount} else null end ;;
    value_format_name: usd
  }

  measure: ship_count_errors {
    type: count_distinct
    sql:CASE WHEN ${action} != '1' and ${category} = 'Shipping'
       THEN ${id}
       ELSE NULL
       END ;;
  }
  measure: ship_count_refunds{
    type: count_distinct
    sql: case when ${action}= 2 and ${category} = 'Shipping'
      then ${id} else null end ;;
  }

  measure: ship_sum_credits{
    type: sum_distinct
    sql: case when ${action}= 0 and ${category} = 'Shipping'
      then ${amount} else null end ;;
    value_format_name: usd
  }

  measure: ship_sum_refunds{
    type: sum
    sql: case when ${action}= 2 and ${category} = 'Shipping'
      then ${amount} else null end ;;
    value_format_name: usd
  }

  measure: ops_count_errors {
    type: count_distinct
    sql:CASE WHEN ${action} != '1' and (${category} = 'Shipping' OR ${category} = 'Fulfillment' OR ${category} = 'Ingredient')
       THEN ${id} ELSE NULL END ;;
  }

  measure: ops_count_credits{
    type: count_distinct
    sql: case when ${action}= 0 and (${category} = 'Shipping' OR ${category} = 'Fulfillment' OR ${category} = 'Ingredient')
      then ${id} else null end ;;
  }

  measure: ops_count_refunds{
    type: count_distinct
    sql: case when ${action}= 2 and (${category} = 'Shipping' OR ${category} = 'Fulfillment' OR ${category} = 'Ingredient')
      then ${id} else null end ;;
  }

  measure: ops_sum_credits{
    type: sum_distinct
    sql: case when ${action}= 0 and (${category} = 'Shipping' OR ${category} = 'Fulfillment' OR ${category} = 'Ingredient')
    then ${amount} else null end ;;
    value_format_name: usd
  }

  measure: ops_sum_refunds{
    type: sum
    sql: case when ${action}= 2 and (${category} = 'Shipping' OR ${category} = 'Fulfillment' OR ${category} = 'Ingredient')
      then ${amount} else null end ;;
    value_format_name: usd
  }

  dimension: ab_anomalies {
    type: yesno
    sql: (${reason}='Missing Booklet' and ${menus.ship_week_mon_start_date}='2021/08/09' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='vegan sour cream' and ${menus.ship_week_mon_start_date}='2021/07/26' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Ingredient Substitution' and ${ingredients.ingredient_name}='almond milk' and ${menus.ship_week_mon_start_date}='2021/09/13' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='vegan cabbage kimchi' and ${menus.ship_week_mon_start_date}='2021/09/06' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='peanut butter' and ${menus.ship_week_mon_start_date}='2021/08/23' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Missing Ingredient' and ${ingredients.ingredient_name} like 'Treeline%' and ${ingredients.ingredient_name} not like '%French-Style%' and ${menus.ship_week_mon_start_date}='2021/08/16' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='nutritional yeast' and ${menus.ship_week_mon_start_date}='2021/10/18' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Ingredient Substitution'and ${ingredients.ingredient_name}='nutritional yeast' and ${menus.ship_week_mon_start_date}='2021/10/18' and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago') or (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='potato buns'and ${menus.ship_week_mon_start_date}='2021/10/25'and ${orders_data.ship_template_fulfillment_center}='AtomBanana_Chicago')  ;;
  }
  dimension: so_anomalies {
    type: yesno
    sql: (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='vegan cabbage kimchi' and ${menus.ship_week_mon_start_date}='2021/09/06' and ${orders_data.ship_template_fulfillment_center}='ShipOnce_Parsippany')   ;;
  }
  dimension: gf_anomalies {
    type: yesno
    sql: (${reason}='Ingredient Substitution' and ${ingredients.ingredient_name}='almond milk' and ${menus.ship_week_mon_start_date}='2021/09/13' and ${orders_data.ship_template_fulfillment_center}='Get_Fresh_Las_Vegas')   ;;
  }

  dimension: primo_anomalies {
    type: yesno
    sql: (${reason}='Missing Ingredient' and ${ingredients.ingredient_name}='tomato powder' and ${menus.ship_week_mon_start_date}='2021/10/25' and ${orders_data.ship_template_fulfillment_center}='Primo_Pennsylvania')   ;;
  }

  ## anomalies check   https://purplecarrot.looker.com/dashboards-next/130


  set: issues_drilldown{
    fields: [
      customer_issues.count,
      customer_issues.reason,
      products.meal_name,
      customer_issues.meal_letter,
      customer_issues.meal_combo,
      customer_issues.meal_quantity,
      customer_issues.ingredient_quantity,
      ingredients.ingredient_name,
      customer_issues.ops_sum_credits,
      customer_issues.ops_sum_refunds
    ]
  }


  set: orders_drilldown{
    fields: [
        orders_data.id,
        customer_issues.category,
        customer_issues.reason,
        customer_issues.ops_sum_credits,
        customer_issues.ops_sum_refunds
    ]
  }

}
