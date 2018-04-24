view: user_facts_email {
  derived_table: {
    sql: SELECT user_facts.id,
      credit_transactions.source_type as source_type
      FROM ${user_facts.SQL_TABLE_NAME} as user_facts
      LEFT JOIN heroku_postgres.email_delivered as email_delivered
      ON user_facts.first_order_id = credit_transactions.source_id
      GROUP BY 1, 2
       ;;
  }
}
