view: sab_count_derived {
    derived_table: {
sql:SELECT
  gift_purchases.purchaser_id  AS "sab_purchaser_id",
  COUNT(*) AS "available_sab_count"
FROM heroku_postgres.gift_purchases  AS gift_purchases
WHERE (((CASE
WHEN gift_purchases.sending_method = 0 OR gift_purchases.sending_method = 1  THEN 'Gift'
WHEN gift_purchases.sending_method = 3  THEN 'Send Free Meal'
ELSE 'Other'
END) = 'Send Free Meal')) AND (gift_purchases.giveaway_sent_at  IS NULL) AND (gift_purchases.expired_at  IS NULL)
GROUP BY 1
ORDER BY 2 DESC
;;
}
  measure: count {
    type: count
  }

  dimension: sab_purchaser_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."sab_purchaser_id" ;;
  }

  dimension: available_sab_count {
    type: number
    sql: ${TABLE}."available_sab_count" ;;
  }

  dimension: available_sab_group {
    type: string
    sql:  CASE WHEN ${available_sab_count} = 0 THEN '0)'
          WHEN ${available_sab_count} = 1 THEN '1'
          WHEN ${available_sab_count} = 2 THEN '2'
          WHEN ${available_sab_count} = 3 THEN '3'
          WHEN ${available_sab_count} = 4 THEN '4'
          WHEN ${available_sab_count} = 5 THEN '5'
          WHEN ${available_sab_count > 5 THEN '>5'
          ELSE NULL
          END
          ;;
  }
  }
