view: sab_total_derived {
  derived_table: {
    sql:SELECT
          gift_purchases.purchaser_id  AS "sab_purchaser_id",
          gift_purchases.sent_to_recipient_date as "sab_sent_date"
          gift_purchases.id as "sab_id"
       COUNT(*) AS "sab_available"
        FROM heroku_postgres.gift_purchases  AS gift_purchases
        WHERE (((CASE
        WHEN gift_purchases.sending_method = 0 OR gift_purchases.sending_method = 1  THEN 'Gift'
        WHEN gift_purchases.sending_method = 3  THEN 'Send Free Meal'
        ELSE 'Other'
        END) = 'Send Free Meal')) AND (gift_purchases.expired_at IS NULL)
       COUNT(*) AS "sab_sent"
        FROM heroku_postgres.gift_purchases  AS gift_purchases
        WHERE (((CASE
        WHEN gift_purchases.sending_method = 0 OR gift_purchases.sending_method = 1  THEN 'Gift'
        WHEN gift_purchases.sending_method = 3  THEN 'Send Free Meal'
        ELSE 'Other'
        END) = 'Send Free Meal')) AND (gift_purchases.expired_at IS NULL) and (gift_purchases.giveaway_sent_at  IS NOT NULL)

        GROUP BY 1
        ORDER BY 2 DESC
        ;;
  }
  measure: count_distinct_users {
    type: count_distinct
    sql: ${sab_purchaser_id} ;;
  }
  measure: count_distinct_sabs {
    type: count_distinct
    sql: ${sab_id} ;;
  }

  dimension: sab_purchaser_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."sab_purchaser_id" ;;
  }

  dimension: sab_id {
    type: number
    sql: ${TABLE}."sab_id" ;;
  }

  dimension: total_sab {
    type: number
    sql: ${TABLE}."total_sab" ;;
  }

  dimension: sab_sent_date {
    type: number
    sql: ${TABLE}."sab_sent_date" ;;
  }

  dimension: sab_sent {
    type: string
    sql:  CASE WHEN ${sab_sent_date} is Null THEN 'no'
          ELSE 'yes'
          END
          ;;
  }

}
