view: sab_order_derived {
  derived_table: {
    sql:SELECT
        gift_purchases.purchaser_id  AS "sab_purchaser_id",
        COUNT(*) AS "ordered_sab"
      FROM heroku_postgres.gift_purchases  AS gift_purchases
      WHERE (((CASE
      WHEN gift_purchases.sending_method = 0 OR gift_purchases.sending_method = 1  THEN 'Gift'
      WHEN gift_purchases.sending_method = 3  THEN 'Send Free Meal'
      ELSE 'Other'
      END) = 'Send Free Meal')) AND (gift_purchases.status = 5 OR gift_purchases.status = 4)
      GROUP BY 1
      ORDER BY 2 DESC
      ;;
  }
  measure: count_distinct {
    type: count_distinct
    sql: ${sab_purchaser_id} ;;
  }

  dimension: sab_purchaser_id {
    primary_key: yes
    type: number
    sql: ${TABLE}."sab_purchaser_id" ;;
  }

  dimension: ordered_sab {
    type: number
    sql: ${TABLE}."ordered_sab" ;;
  }

}
