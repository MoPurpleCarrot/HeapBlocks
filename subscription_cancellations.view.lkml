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
    case:{
      when:{
        sql: ${reason} = 0 ;;
        label: "Dietary Preference"
      }
      when:{
        sql: ${reason} = 1 ;;
        label: "Meal Choice"
      }
      when:{
        sql: ${reason} = 2 ;;
        label: "Didn't Like Recipe"
      }
      when: {
        sql: ${reason} = 3 ;;
        label: "Ingredient Quality"
      }
      when: {
        sql: ${reason} = 4 ;;
        label: "Fewer Meals"
      }
      when: {
        sql: ${reason} = 5 ;;
        label: "More Meals"
      }
      when: {
        sql: ${reason} = 6 ;;
        label: "Too Expensive"
      }
      when: {
        sql: ${reason} = 7 ;;
        label: "Too Long"
      }
      when: {
        sql: ${reason} = 8 ;;
        label: "Packaging"
      }
      when: {
        sql: ${reason} = 9 ;;
        label: "Delivery Issues"
      }
      when: {
        sql: ${reason} = 10 ;;
        label: "Used Gift Credit"
      }
      when: {
        sql: ${reason} = 11 ;;
        label: "Cooking Independently"
      }
      }}

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

  measure: count {
    type: count
    drill_fields: [id]
  }



    dimension: datediff_days_since_cancelled {
      type: number
      sql:  DATEDIFF('day', ${created_date}, 'today')  ;;
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
