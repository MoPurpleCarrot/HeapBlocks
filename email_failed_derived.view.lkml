view: email_failed_derived {
    derived_table: {
      sql: SELECT
        users.id  AS "users.id",
        COUNT(*) AS "users.failed_email_count"
      FROM heroku_postgres.users  AS users
      LEFT JOIN customerio_email.data  AS customer_io_email ON users.id = customer_io_email.data__customer_id
      where (customer_io_email.metric = 'Attempted' or customer_io_email.metric = 'Deferred' or customer_io_email.metric = 'Unsubscribed' or customer_io_email.metric = 'Bounced' or customer_io_email.metric = 'Dropped' or customer_io_email.metric = 'Spammed' or customer_io_email.metric = 'Failed' or customer_io_email.metric = 'Undeliverable')

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
      hidden: yes
    }

    dimension: count_failed_emails{
      type: number
      sql: ${TABLE}."users.failed_email_count" ;;
    }


    dimension: receiving_emails{
      type: string
      sql:  CASE WHEN ${count_failed_emails} > 0 THEN 'Unsubscribed or Invalid'
          ELSE 'Eligible'
          END
          ;;
    }

  }
