view: intercom_derived_firstmessage {
  derived_table: {
    sql:SELECT * FROM Intercom_conversation_parts
LEFT JOIN
( SELECT _sdc_source_key_id, MIN(created_time) as first_message
FROM Intercom_conversation_parts.created_time
WHERE Intercom_conversation_part.author__type = "admin"
GROUP BY _sdc_source_key_id ) c
ON Intercom_conversation_parts._sdc_source_key_id = c._sdc_source_key_id ;;
  }


  dimension_group: first_message {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year

    ]
    sql: ${TABLE}.first_message ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: _sdc_source_key_id {
    type: string
    sql: ${TABLE}._sdc_source_key_id ;;
  }

  dimension: author__type {
    type: string
    sql: ${TABLE}.author__type ;;
  }

measure: time_to_first_response {
  type: number
  sql: DATEDIFF('hour',${Intercom_conversations.created_hour}, ${first_message_hour}) ;;
}


  measure: average_time_to_first_response {
    type: average
    sql: DATEDIFF('hour',${Intercom_conversations.created_hour}, ${first_message_hour})  ;;
  }

  }

# view: intercom_dervied_firstmessage {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
