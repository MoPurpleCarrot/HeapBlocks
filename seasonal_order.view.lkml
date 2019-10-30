view: seasonal_order {
  derived_table: {
    sql: SELECT * FROM heroku_postgres.orders
      WHERE plan = 9
       ;;

      datagroup_trigger: hourly_sync
      distribution: "updated_at"
      sortkeys: ["updated_at"]

    }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_charged {
    type: number
    value_format_name: usd
    sql: ${TABLE}.amount_charged ;;
  }

  dimension: coupon_code {
    type: string
    sql: ${TABLE}.coupon_code ;;
  }

  dimension: coupon_id {
    type: number
    sql: ${TABLE}.coupon_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month, quarter, raw]
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

}
