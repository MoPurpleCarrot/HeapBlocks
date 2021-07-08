view: loyalty_email_test_derived {
    derived_table: {
      sql: SELECT
        users.id  AS "users.id",
        COUNT(CASE WHEN ((customer_io_email.data__campaign_id = 1000397 or customer_io_email.data__campaign_id = 1000399 or customer_io_email.data__campaign_id = 1000398) and (customer_io_email.metric='sent')) THEN 1
      ELSE 0 END) AS "users.loyalty_email_count"
      FROM heroku_postgres.users  AS users
      LEFT JOIN customerio_email.data  AS customer_io_email ON users.id = customer_io_email.data__customer_id
      GROUP BY 1
      ORDER BY 2 DESC
       ;;
    }

    measure: count {
      type: count
    }

    dimension: users_id {
      primary_key: yes
      type: number
      sql: ${TABLE}."users.id" ;;
    }

    dimension: count_loyalty_emails{
      type: number
      sql: ${TABLE}."users.loyalty_email_count" ;;
    }

    dimension: loyalty_test {
      type: string
      sql:  CASE WHEN ${count_loyalty_emails} > 0 THEN 'Receiving Loyalty Emails'
          WHEN ${count_loyalty_emails} = 0 THEN 'Not Receiving Loyalty Emails'
          ELSE NULL
          END
          ;;
    }

  }
