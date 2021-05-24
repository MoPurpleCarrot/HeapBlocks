view: current_date{

  # No derived table or sql table name

  dimension_group: current_date{

    type: time

    timeframes: [time, hour, hour_of_day, day_of_week, day_of_year, date, week, month, month_num, month_name, quarter, day_of_month, year, raw, week_of_year]

    sql: CURRENT_DATE ;;

  }

}
