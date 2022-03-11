view: subscription_cancellations {
  sql_table_name: heroku_postgres.subscription_cancellations ;;

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
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: link_generated {
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
    sql: ${TABLE}.link_generated_at ;;
  }

  dimension: reason {
    type: number
    sql: ${TABLE}.reason ;;
  }

  dimension: reason_text {
    type: string
    sql:
    case when (${reason} = 0 and ${created_date}<'2021-11-17') then 'Dietary Preference'
    when (${reason} = 0 and ${created_date}>'2021-11-16') then 'Nutrition Goals'
    when (${reason} = 1 and ${created_date}<'2021-11-17') then 'Meal Choice'
    when (${reason} = 19 and ${created_date}>'2021-11-16') then 'Flavor/Taste'
    when (${reason} = 2 and ${created_date}<'2021-11-17') then 'Didn''t Like Recipe'
    when (${reason} = 2 and ${created_date}>'2021-11-16') then 'Didn''t Like Meal/Recipe Choices'
    when (${reason} = 3 and ${created_date}<'2021-11-17') then 'Ingredient Quality'
    when (${reason} = 3 and ${created_date}>'2021-11-16') then 'Ingredient Quality'
    when (${reason} = 4 and ${created_date}<'2021-11-17') then 'Fewer Meals'
    when (${reason} = 4 and ${created_date}>'2021-11-16') then 'Thrill is Gone'
    when (${reason} = 5 and ${created_date}<'2021-11-17') then 'More Meals'
    when (${reason} = 16 and ${created_date}>'2021-11-16') then 'More Variety'
    when (${reason} = 6 and ${created_date}<'2021-11-17') then 'Too Expensive'
    when (${reason} = 6 and ${created_date}>'2021-11-16') then 'No Longer Afford'
    when (${reason} = 7 and ${created_date}<'2021-11-17') then 'Too Long'
    when (${reason} = 7 and ${created_date}>'2021-11-16') then 'Too Long'
    when (${reason} = 8 and ${created_date}<'2021-11-17') then 'Packaging'
    when (${reason} = 8 and ${created_date}>'2021-11-16') then 'Packaging - Environment'
    when (${reason} = 9 and ${created_date}<'2021-11-17') then 'Delivery Issues'
    when (${reason} = 9 and ${created_date}>'2021-11-16') then 'Packaging - Quality'
    when (${reason} = 10 and ${created_date}<'2021-11-17') then 'Used Gift Credit'
    when (${reason} = 10 and ${created_date}>'2021-11-16') then 'Delivery Issues'
    when (${reason} = 11 and ${created_date}<'2021-11-17') then 'Cooking Independently'
    when (${reason} = 11 and ${created_date}>'2021-11-16') then 'Used Gift Credit'
    when (${reason} = 12 and ${created_date}<'2021-11-17') then 'Not Kid-Friendly'
    when (${reason} = 12 and ${created_date}>'2021-11-16') then 'Prefer to Shop, Prep, Cook Myself'
    when (${reason} = 13 and ${created_date}<'2021-11-17') then 'Prefer Meal Kit'
    when (${reason} = 13 and ${created_date}>'2021-11-16') then 'Not Kid-Friendly'
    when (${reason} = 14 and ${created_date}<'2021-11-17') then 'Want to Grocery Shop & Prepare'
    when (${reason} = 14 and ${created_date}>'2021-11-16') then 'Prefer Meal Kit'
    when (${reason} = 15 and ${created_date}<'2021-11-17') then 'Want More Variety'
    when (${reason} = 15 and ${created_date}>'2021-11-16') then 'Want to Grocery Shop & Prepare'
    when (${reason} = 17 and ${created_date}>'2021-11-16') then 'Portions Too Small'
    when (${reason} = 18 and ${created_date}>'2021-11-16') then 'Other'
    else null
    end;;
    }


  dimension: reason_details {
    type: string
    sql: ${TABLE}.reason_details ;;
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
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

    dimension: prepared_opt_in {
      type: string
      sql: ${TABLE}.prepared_follow_up_opt_in ;;
    }

  measure: count {
    type: count
    drill_fields: [id]
  }



    dimension: datediff_days_since_cancelled {
      type: number
      sql:  DATEDIFF('day', ${subscription_cancellations.created_date}, ${subscriptions.winback_date})  ;;
    }


   dimension: days_since_cancelled {
      case: {
        when: {
          sql: ${datediff_days_since_cancelled} < 30;;
          label: "30 days or less since cancelled"
        }
        when: {
          sql: ${datediff_days_since_cancelled} <60 AND ${datediff_days_since_cancelled} >= 30 ;;
          label: "30 to 60 days since cancelled"
        }
        when: {
          sql:  ${datediff_days_since_cancelled} >= 60 AND ${datediff_days_since_cancelled} < 90 ;;
          label: "60 to 90 days since cancelled"
        }
        when: {
          sql: ${datediff_days_since_cancelled} >= 90 AND ${datediff_days_since_cancelled} < 180 ;;
          label: "3 to 6 months since cancelled"
        }

        when: {
          sql:  ${datediff_days_since_cancelled} >= 180;;
          label: "6 months or greater since cancelled"
        }
      }
    }




}
