view: sab_sent {
  derived_table: {
    sql: select distinct user_id, order_of_invite,
      case when order_of_invite = 1 then '1'
      when order_of_invite = 2 then '2'
      when order_of_invite = 3 then '3'
      when order_of_invite = 4 then '4'
      when order_of_invite = 5 then '5'
      when order_of_invite > 5 then '6+'
      end "Sent SAB Group"
      from heroku_postgres.giveaways
      where status = 1
       ;;
  }

  measure: count {
    type: count_distinct
    sql: ${user_id} ;;
      }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: order_of_invite {
    type: number
    sql: ${TABLE}.order_of_invite ;;
  }

  dimension: sent_sab_group {
    type: string
    label: "sent sab group"
    sql: ${TABLE}."sent sab group" ;;
  }

}
