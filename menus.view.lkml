view: menus {
  sql_table_name: heroku_postgres.menus ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden:  yes
  }

  dimension_group: sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }

  dimension_group: sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: yes
  }

  dimension: sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
  }

  dimension_group: authorization {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.authorization_at ;;
    hidden: yes
  }

  dimension_group: capture {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.capture_at ;;
    hidden: yes
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
    hidden:  yes
  }

  dimension_group: end {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.end_at ;;
    hidden:  yes
  }

  dimension_group: order_cancellation_cutoff {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.order_cancellation_cutoff_at ;;
    hidden:  yes
  }

  dimension: is_published {
    type: yesno
    sql: ${TABLE}.published ;;
    hidden:  yes
  }

  dimension_group: shipping {
    type: time
    timeframes: [time, date, day_of_week, week, quarter, month, month_num, year]
    sql: ${TABLE}.shipping_on ;;
  }

  dimension_group: ship_week_mon_start{
    type: time
    timeframes: [date, day_of_week]
    convert_tz: no
    sql: case
            when ${shipping_day_of_week} = 'Monday' THEN ${shipping_date}
            when ${shipping_day_of_week} = 'Tuesday' THEN dateadd(d, -1, ${shipping_date})
            when ${shipping_day_of_week} = 'Wednesday' THEN dateadd(d, -2, ${shipping_date})
            when ${shipping_day_of_week} = 'Thursday' THEN dateadd(d, -3, ${shipping_date})
            when ${shipping_day_of_week} = 'Friday' THEN dateadd(d, -4, ${shipping_date})
            when ${shipping_day_of_week} = 'Saturday' THEN dateadd(d, -5, ${shipping_date})
            when ${shipping_day_of_week} = 'Sunday' then  dateadd(d, +1, ${shipping_date})
            END;;
    allow_fill: no

    }


  dimension_group: start {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.start_at ;;
    hidden:  yes
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
    hidden:  yes
  }

  dimension: status_message {
    type: string
    sql: ${TABLE}.status_message ;;
    hidden:  yes
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [id, menu_items.count, orders.count]
  }
}
