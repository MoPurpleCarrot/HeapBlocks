view: user_facts_email_opened {
  derived_table: {
    sql: SELECT
      user_facts.id,
      user_facts.under_16_days_step_2_to_3 as under_16_days_step_2_to_3,
      user_facts.days_step_2_to_3 as days_step_2_to_3,
      orders.coupon_code as coupon_code

      FROM ${user_facts.SQL_TABLE_NAME} as user_facts
      LEFT JOIN customerio.email_opened as email_opened
      ON user_facts.id = email_opened.user_id
      GROUP BY user_facts.id, email_opened.sent_date
       ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_order_coupon_code {
    type: string
    sql: ${TABLE}.coupon_code ;;
  }
}
