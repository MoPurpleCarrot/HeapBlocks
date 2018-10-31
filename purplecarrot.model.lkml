connection: "redshift"
week_start_day: wednesday

# include all views in this project
include: "*.view"

# include all dashboards in this project
# include: "*.dashboard"

datagroup: hourly_sync  {
  sql_trigger: SELECT DATE_PART('hour', getdate()) ;;
  }

datagroup:batch_date_update {
 sql_trigger: SELECT max(_sdc_batch_date) FROM zendesk.tickets__custom_fields ;;
 }

explore:heap_registration_complete {}
explore:heap_first_session {}
explore:heap_account_created {}

explore: heap_users{
  label: "Heap Attribution"

  join: heap_first_session {
    relationship: one_to_one
    sql_on: ${heap_first_session.user_id} = ${heap_users.user_id} ;;
    type: left_outer
  }

  join: heap_account_created {
    relationship: one_to_one
    sql_on: ${heap_account_created.user_id} = ${heap_users.user_id} ;;
    type: left_outer
  }

  join: heap_registration_complete {
    relationship: one_to_one
    sql_on: ${heap_registration_complete.user_id} = ${heap_users.user_id} ;;
    type: left_outer
  }

  join: users {
    relationship: one_to_one
    sql_on: ${users.email} = ${heap_users._email} ;;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }

  join: email_delivered {
    relationship: many_to_one
    sql_on: ${email_delivered.user_id} = ${users.id} ;;
  }

#could have multiple opens to one delivered, but treating as one to one for data model simplicity
  join: email_opened {
    relationship: one_to_one
    sql_on: ${email_opened.email_id} = ${email_delivered.email_id} ;;
  }

#could have multiple clicks to one open, but treating as one to one for data model simplicity
  join: email_link_clicked {
    relationship: many_to_one
    sql_on: ${email_link_clicked.email_id} = ${email_opened.email_id} ;;
  }

  join: first_order {
    from: orders
    relationship: many_to_one
    sql_on: ${first_order.id} = ${user_facts.first_order_id} ;;
  }

  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${shipping_addresses.subscription_id} ;;
  }

  join: heap_sessions {
    relationship: one_to_one
    sql_on:  ${heap_sessions.user_id} = ${heap_users.user_id} ;;
  }



}

explore: subscriptions {
  label: "Users, Orders & Recipes"
  fields: [ALL_FIELDS*, -orders.days_since_created, -orders.month_num, -orders.week_num]

  join: orders {
    relationship: many_to_one
    sql_on: ${orders.subscription_id} = ${subscriptions.id} ;;
  }

  join: users {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_one
    sql_on: ${subscriptions.id} = ${shipping_addresses.subscription_id} ;;
  }

  join: menus {
    relationship: many_to_one
    sql_on: ${orders.menu_id} = ${menus.id} ;;
  }

  join: menu_items {
    relationship: one_to_many
    #this is a mapping/join table
    fields: []
    sql_on: ${menus.id} = ${menu_items.menu_id} ;;
  }

  join: recipes {
    relationship: many_to_one
    sql_on: ${menu_items.recipe_id} = ${recipes.id} ;;
  }

  join: recipe_tags_recipes {
    relationship: one_to_many
    #this is a mapping/join table
    fields: []
    sql_on: ${recipes.id} = ${recipe_tags_recipes.recipe_id} ;;
  }

  join: recipe_tags {
    relationship: many_to_one
    sql_on: ${recipe_tags_recipes.recipe_tag_id} = ${recipe_tags.id} ;;
  }

  join: scheduled_menus {
    relationship: many_to_one
    sql_on: ${scheduled_menus.subscription_id} =  ${subscriptions.id} ;;
  }

  join: chefs {
    relationship: many_to_one
    sql_on: ${recipes.chef_id} = ${chefs.id} ;;
  }

  join: stripe_charges {
    relationship: one_to_one
    sql_on: ${orders.stripe_charge_id} = ${stripe_charges.id} ;;
  }
}
#  join: stripe_customers__cards_data {
#    relationship: many_to_one
#    sql_on: ${strip_charges__cards} = ${stripe_charges.id} ;;
#  }

explore: users {
  persist_for: "1 hour"
  label: "Customer Service Portal"

  join: tickets {
    relationship: one_to_many
    sql_on: ${users.email} = ${tickets.email} ;;
  }

  join: zendesk_ticket_metrics {
    relationship: one_to_one
    sql_on: ${tickets.id} = ${zendesk_ticket_metrics.ticket_id} ;;
  }

  join: zendesk_custom_fields {
    relationship: one_to_one
    sql_on: ${tickets.id} = ${zendesk_custom_fields._sdc_source_key_id} ;;
  }

  join: delighted {
    relationship: one_to_many
    sql_on: ${users.email} = ${delighted.event_data__person__email} ;;
  }

  join: subscription_cancellations {
    relationship: one_to_one
    sql_on: ${users.id} = ${subscription_cancellations.user_id} ;;
  }

  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: subscription_order_num_derrived {
    relationship: one_to_one
    sql_on: ${subscription_order_num_derrived.subscriptions_id} = ${subscriptions.id} ;;
  }

  join: scheduled_menus {
    relationship: many_to_one
    sql_on: ${scheduled_menus.subscription_id} =  ${subscriptions.id} ;;
  }

  join: welcome_surveys {
    relationship: one_to_one
    sql_on: ${welcome_surveys.user_id} = ${users.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${shipping_addresses.subscription_id} ;;
  }

  join: orders {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders.subscription_id} ;;
  }

  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = coupons.id ;;

  }
  join: gift_redemptions {
    relationship: one_to_many
    sql_on: ${gift_redemptions.user_id} = ${users.id} ;;
  }

  join: gift_purchases {
    relationship: one_to_one
    sql_on: ${gift_purchases.id} = ${gift_redemptions.gift_purchase_id} ;;
  }

  join: menus {
    relationship: many_to_one
    sql_on: ${orders.menu_id} = ${menus.id} ;;
  }

  join: google_analytics_user {
    relationship: one_to_many
    sql_on: ${users.id} = ${google_analytics_user.dimension1} ;;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }

  join: last_order {
    from: orders
    relationship: many_to_one
    sql_on: ${last_order.id} = ${user_facts.last_order_id} ;;
  }

  join: first_order {
    from: orders
    relationship: many_to_one
    sql_on: ${first_order.id} = ${user_facts.first_order_id} ;;
  }

  join: google_analytics_traffic {
    relationship: one_to_one
    sql_on: ${orders.id} = ${google_analytics_traffic.transactionid} ;;
  }

  join: user_facts_traffic {
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${user_facts_traffic.id} ;;
  }

  join: user_facts_order {
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${user_facts_order.id} ;;
  }

  join: user_facts_credit {
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${user_facts_credit.id} ;;
  }

}

explore: google_analytics_age {}

explore: google_analytics_wau {
  label: "Google Analytics Active Users"

  join: google_analytics_mau {
    relationship: one_to_one
    sql_on: ${google_analytics_wau.date_date} = ${google_analytics_mau.date_date} ;;
  }

  join: google_analytics_dau {
    relationship: one_to_one
    sql_on: ${google_analytics_wau.date_date} = ${google_analytics_dau.date_date} ;;
  }
}

explore: gift_purchases {
  label: "Gift Purchases and Redemptions - Redeemer"

  join: gift_redemptions {
    relationship: one_to_one
    type: left_outer
    sql_on: ${gift_purchases.id} = ${gift_redemptions.gift_purchase_id};;
  }

  join: users {
    relationship: one_to_one
    type: left_outer
    sql_on: ${gift_redemptions.user_id} = ${users.id} ;;
  }

  join: subscriptions {
    relationship: one_to_one
    type: left_outer
    sql_on: ${users.id}=${subscriptions.user_id};;
  }

  join: orders {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders.subscription_id} ;;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }
}

explore: ingredients {

  join: recipes {
    relationship: many_to_one
    sql_on: ${ingredients.recipe_id} = ${recipes.id} ;;
  }

  join: recipe_plans {
    relationship: many_to_one
    sql_on: ${ingredients.recipe_plan_id} = ${recipe_plans.id} ;;
  }

  join: recipes_thru_plan {
    from: recipes
    relationship: many_to_one
    sql_on: ${recipe_plans.recipe_id} = ${recipes.id} ;;
  }

  join: menu_items {
    relationship: one_to_one
    sql_on: ${recipes.id} = ${menu_items.recipe_id}  ;;
  }

  join: menus {
    relationship: one_to_one
    sql_on: ${menu_items.menu_id} = ${menus.id} ;;
  }
  }

explore: google_analytics_conversion {}

explore: paused_and_cancelled_users {}

explore: recipes {}

explore: email_delivered {
  label: "Customer.io Email"

  join: email_opened {
    relationship: many_to_many
    sql_on: ${email_delivered.email_id} = ${email_opened.email_id} ;;
  }

  join: users {
    relationship: many_to_one
    sql_on: ${email_delivered.user_id} = ${users.id} ;;
  }

}


explore: google_analytics_data {}

explore: google_adwords {}

explore: heap_sessions {}

explore: facebook_ads_insights {}

explore: skip_menu_surveys {}

explore: credit_transactions{

  join: credit_transaction_groups {
    relationship: many_to_one
    sql_on: ${credit_transactions.credit_transaction_group_id} = ${credit_transaction_groups.id};;
    }

  join: users {
    relationship: one_to_many
    sql_on: ${users.id} = ${credit_transaction_groups.user_id} ;;
  }

  join: cx_rep_user {
    from: users
    relationship: many_to_one
    sql_on: ${credit_transactions.admin_id}=${cx_rep_user.id} ;;
  }

  join: cx_rep_subscription {
    from: subscriptions
    relationship: one_to_one
    sql_on: ${cx_rep_subscription.user_id}=${cx_rep_user.id} ;;
  }

  join: cx_rep_shipping_addresses {
    from: shipping_addresses
    relationship: one_to_one
    sql_on: ${cx_rep_subscription.id}=${cx_rep_shipping_addresses.subscription_id} ;;
  }

  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_one
    sql_on: ${subscriptions.id} = ${shipping_addresses.subscription_id} ;;
  }
}

explore: refunds {
  label: "Order Refunds"

  join: cx_rep_user {
      from: users
    relationship: many_to_one
    sql_on: ${refunds.admin_id}=${cx_rep_user.id} ;;
  }

  join: cx_rep_subscription {
    from: subscriptions
    relationship: one_to_one
    sql_on: ${cx_rep_subscription.user_id}=${cx_rep_user.id} ;;
  }

  join: cx_rep_shipping_addresses {
    from: shipping_addresses
    relationship: one_to_one
    sql_on: ${cx_rep_subscription.id}=${cx_rep_shipping_addresses.subscription_id} ;;
  }

  join: orders {
    relationship: one_to_one
    sql_on: ${refunds.refundable_id}_id}=${orders.id} ;;
  }

  join: subscriptions {
    relationship: many_to_one
    sql_on: ${orders.subscription_id}=${subscriptions.id} ;;
  }

  join: users {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id}=${users.id} ;;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }
  }

explore: stripe_customers {

  join: stripe_customers__cards__data {
    relationship: many_to_one
    sql_on: ${stripe_customers__cards__data.id} = ${stripe_customers.default_card} ;;
  }

  join: users {
    relationship: one_to_one
    sql_on: ${users.email}=${stripe_customers.email} ;;
  }

  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

}

explore: prep_needs {

  join: recipe_plans {
    relationship: many_to_one
    sql_on: ${prep_needs.recipe_plan_id} = ${recipe_plans.id} ;;
  }
}

explore: coupons {}
explore: stripe_charges {}
explore: live_chat_sessions {

  join: live_chat_session_tags {
    relationship: many_to_one
    sql_on: ${live_chat_session_tags._sdc_source_key___sdc_primary_key} = ${live_chat_sessions.__sdc_primary_key} ;;
  }
}


#Intercom joining

explore: Intercom_conversations {

  join: Intercom_users {
    relationship:  one_to_many
    sql_on:  ${Intercom_users.id} = ${Intercom_conversations.user__id} ;;
  }

  join: users {
    relationship:  one_to_one
    sql_on:  ${users.id} = ${Intercom_users.user_id} ;;
  }

join: subscriptions {
  relationship: one_to_one
  sql_on:  ${subscriptions.user_id} = ${users.id} ;;
}


join: Intercom_conversations__tags__tags {
  relationship:  many_to_one
  sql_on:  ${Intercom_conversations__tags__tags._sdc_source_key_id} = ${Intercom_conversations.id}
  ;;
}

join: Intercom_contacts {
  relationship:  one_to_one
  sql_on:  ${Intercom_contacts.id} = ${Intercom_conversations.user__id} ;;
}

join: subscription_cancellations {
  relationship:  one_to_one
  sql_on: ${subscription_cancellations.user_id} = ${users.id} ;;
}

join: Intercom_conversation_parts {
  relationship:  many_to_one
  sql_on: ${Intercom_conversation_parts._sdc_source_key_id} = ${Intercom_conversations.id} ;;
}

join: intercom_derived_firstmessage {
  relationship: many_to_one
  sql_on:  ${intercom_derived_firstmessage._sdc_source_key_id} = ${Intercom_conversations.id}  ;;
}

}
