view: heap_attribution {
  derived_table: {
    sql: SELECT heap_users.id,
      MIN(heap_events.time) as first_heap_event,
      MIN(heap_events.event_id) as first_heap_event_id,

      FROM main_production.users as heap_users
      LEFT JOIN main_production.sessions as heap_sessions
      ON heap_users.id = heap_sessions.user_id
      LEFT JOIN main_production.all_events as heap_events
      ON heap_session.id = heap_events.session_id
      GROUP BY 1
               ;;
        #       sql_trigger_value: select current_date ;;
      }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    }

  dimension_group: first_heap_event {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.time ;;
    }

  dimension: first_heap_event_id {
    type: number
    sql: ${TABLE}.event_id ;;
    }

  measure: count {
    type: count
  }

    }
