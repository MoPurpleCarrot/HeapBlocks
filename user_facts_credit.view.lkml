view: user_facts_credit {
  derived_table: {
    sql: SELECT user_facts.id,
      credit_transactions.source_type as source_type
      FROM ${user_facts.SQL_TABLE_NAME} as user_facts
      LEFT JOIN heroku_postgres.credit_transactions as credit_transactions
      ON user_facts.first_order_id = credit_transactions.source_id
      GROUP BY 1, 2
       ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_order_source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }
}
