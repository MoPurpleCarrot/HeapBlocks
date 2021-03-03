connection: "staging"
week_start_day: wednesday

include: "*.view"


#filter for only credit adds?

datagroup: hourly_sync  {
  sql_trigger: SELECT DATE_PART('hour', getdate()) ;;
}

datagroup:batch_date_update {
  sql_trigger: SELECT max(_sdc_batch_date) FROM zendesk.tickets__custom_fields ;;
}

explore: staging_users {
  label: "Ops Report"

join: staging_subscriptions {
  relationship: one_to_one
  sql_on: ${staging_subscriptions.user_id} = ${staging_users.id} ;;
}

 join: staging_orders {
    relationship: one_to_many
    sql_on: ${staging_orders.subscription_id} = ${staging_subscriptions.id} ;;
  }

  join: staging_customer_issues {
    relationship: many_to_one
    sql_on: ${staging_customer_issues.order_id} = ${staging_orders.id};;
  }


  join: staging_credits {
    relationship: one_to_one
    sql_on: ${staging_credits.customer_issue_id} = ${staging_customer_issues.id} ;;
  }

  join: staging_menus {
    relationship: one_to_many
    sql_on: ${staging_menus.id} = ${staging_orders.menu_id} ;;
  }

  join: staging_orders_derived {
    relationship: one_to_one
    sql_on: ${staging_orders_derived.menus_id} = ${staging_menus.id}  ;;
  }

}
