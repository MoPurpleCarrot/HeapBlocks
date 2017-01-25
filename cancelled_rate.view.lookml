
- view: cancelled_rate
  derived_table:
    sql: |
      SELECT a.created_date, a.count, b.cancelled_count
      FROM
      (SELECT 
        DATE_TRUNC('day', users.created_at) AS created_date,
        COUNT(*) AS count
      FROM heroku_postgres.users AS users
      
      GROUP BY 1) a
      LEFT JOIN
      (SELECT 
        DATE_TRUNC('day', users.cancelled_at) AS cancelled_date,
        COUNT(*) AS cancelled_count
      FROM heroku_postgres.users AS users
      
      WHERE 
        (users.cancelled_at IS NOT NULL)
      GROUP BY 1) b
      ON a.created_date = b.cancelled_date
      ORDER BY 1

  fields:
  - dimension_group: date
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.created_date

  - dimension: users
    type: number
    hidden: true
    sql: ${TABLE}.count

  - dimension: cancelled_count
    type: number
    hidden: true
    sql: ${TABLE}.cancelled_count
    
  - measure: total_users
    type: sum
    sql: ${users}
    
  - measure: running_total_users
    type: running_total
    sql: ${total_users}

  - measure: cancelled_users
    type: sum
    sql: ${cancelled_count}