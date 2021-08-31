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
explore:weekly_orders_trackings {

  join: menus {
    relationship: one_to_many
    sql_on: ${menus.id}=${weekly_orders_trackings.menu_id} ;;
  }
  }


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

  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id}    ;;
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

  join: order_items {
    relationship: one_to_many
    sql_on: ${first_order.id} = ${order_items.order_id} ;;
  }

  join: orders {
    relationship: many_to_one
    sql_on: ${order_items.order_id}=${orders.id} ;;
  }

  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id} = ${order_items.sku_id};;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }

  join: recipes {
    relationship: one_to_one
    sql_on: ${order_items.recipe_id} = ${recipes.id};;
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

  join: order_items {
    relationship: one_to_many
    sql_on: ${orders.id}=${order_items.order_id} ;;
  }
  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id} = ${order_items.sku_id};;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }
  join: users {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_many
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
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }



}
#  join: stripe_customers__cards_data {
#    relationship: many_to_one
#    sql_on: ${strip_charges__cards} = ${stripe_charges.id} ;;
#  }

explore: users {
  persist_for: "1 hour"
  label: "Customer Service Portal"
  fields: [ALL_FIELDS*, -customer_issues.ab_anomalies]

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
    relationship: one_to_many
    sql_on: ${users.id} = ${subscription_cancellations.user_id} ;;
  }

  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: subscription_recipe_preferences {
    relationship: many_to_one
    sql_on: ${subscription_recipe_preferences.subscription_id} = ${subscriptions.id} ;;
  }

  join: subscription_events {
    relationship: many_to_one
    sql_on: ${subscription_events.user_id}=${users.id} ;;
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

  join: ces_surveys {
    relationship: many_to_one
    sql_on: ${ces_surveys.user_id} = ${users.id} ;;
  }

  join: nps_surveys {
    relationship: many_to_one
    sql_on: ${nps_surveys.user_id} = ${users.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_many
    sql_on: ${users.id} = ${shipping_addresses.user_id} ;;
  }

  join: orders {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders.subscription_id} ;;
  }

  join: customer_issues {
    relationship: one_to_many
    sql_on: ${orders.id}=${customer_issues.order_id} ;;
  }

  join: customization_events_derived {
    relationship: many_to_one
    sql_on: ${customization_events_derived.order_id} = ${orders.id} ;;
  }
  join: order_items {
    relationship: one_to_many
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: recipes {
    relationship: one_to_one
    sql_on: ${order_items.recipe_id} = ${recipes.id};;
  }

  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id} = ${order_items.sku_id};;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }

  join: recipe_plans {
    relationship: many_to_one
    sql_on: ${recipe_plans.recipe_id} = ${recipes.id};;
  }

  join: recipe_tags_recipes {
    relationship: many_to_one
    sql_on: ${recipe_tags_recipes.recipe_id} = ${recipes.id} ;;
  }

  join: recipe_tags {
    relationship: one_to_many
    sql_on: ${recipe_tags.id} = ${recipe_tags_recipes.recipe_tag_id} ;;
  }

  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }

  join: gift_purchases {
    relationship: many_to_one
    sql_on: ${gift_purchases.purchaser_id} = ${users.id} ;;
  }

  join: menus {
    relationship: many_to_one
    sql_on: ${orders.menu_id} = ${menus.id} ;;
  }

  join: menu_items_new {
    relationship: many_to_one
    sql_on: ${menu_items_new.sku_id}= ${skus.id} and ${menu_items_new.menu_id}=${menus.id} ;;
  }

  join: mktg_channel_metrics {
    relationship: many_to_one
    sql_on:  ${mktg_channel_metrics.ship_week} =${menus.shipping_week} ;;
  }
  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }

  join: user_facts_extras {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts_extras.id} ;;
  }

  join: user_facts_extra_breakfast {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts_extra_breakfast.id} ;;
  }

  join: user_facts_extra_lunch{
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts_extra_lunch.id} ;;
  }

  join: user_facts_extra_extension {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts_extra_extension.id} ;;
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

  join: user_facts_order {
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${user_facts_order.id} ;;
  }

  join: user_facts_credit {
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${user_facts_credit.id} ;;
  }

  join: credit_transaction_groups {
    relationship: many_to_one
    sql_on: ${credit_transaction_groups.user_id} = ${users.id};;
  }
  join: credit_transactions {
    relationship: one_to_one
    sql_on: ${credit_transactions.credit_transaction_group_id} = ${credit_transaction_groups.id} ;;
  }
  join: skip_surveys {
    relationship: many_to_one
    sql_on: ${skip_surveys.menu_id} = ${menus.id} AND ${skip_surveys.user_id} = ${users.id} ;;
  }
  join: events {
    relationship: many_to_one
    sql_on: ${events.subscription_id} = ${subscriptions.id} ;;
  }
  join: payment_methods {
    relationship: many_to_one
    sql_on: ${payment_methods.user_id} = ${users.id} ;;
  }

  join: sab_avail_derived {
    relationship: one_to_one
    sql_on: ${users.id} = ${sab_avail_derived.sab_purchaser_id} ;;

  }

  join: sab_sent_derived {
    relationship: one_to_one
    sql_on: ${users.id} = ${sab_sent_derived.sab_purchaser_id} ;;

  }

  join: sab_redeem_derived {
    relationship: one_to_one
    sql_on: ${users.id} = ${sab_redeem_derived.sab_purchaser_id} ;;

  }

  join: sab_order_derived {
    relationship: one_to_one
    sql_on: ${users.id} = ${sab_order_derived.sab_purchaser_id} ;;

  }

  join: meal_combo_derived {
    relationship: one_to_one
    sql_on: ${meal_combo_derived.order_id}=${orders.id} ;;
  }

  join: giveaways {
    view_label: "SAB"
    relationship: many_to_one
    sql_on: ${giveaways.user_id} = ${users.id} ;;
  }

    join: sab_sent {
      relationship: one_to_one
      sql_on: ${users.id} = ${sab_sent.user_id} ;;

    }

    join: sab_avail {
      relationship: one_to_one
      sql_on: ${users.id} = ${sab_avail.user_id} ;;


### add carts data
  }
  join: post_cart_carts {
    from: carts
    relationship: one_to_many
    sql_on: ${users.id} = ${post_cart_carts.user_id} ;;
  }

  join: post_cart_menus {
    from: menus
    relationship: one_to_many
    sql_on: ${post_cart_menus.id}=${post_cart_carts.menu_id} ;;
  }

  join: post_cart_cart_items {
    from: cart_items
    relationship: one_to_many
    sql_on: ${post_cart_carts.id} = ${post_cart_cart_items.cart_id} ;;
  }
  join: post_cart_orders {
    from: orders
    relationship: one_to_one
    sql_on: ${post_cart_carts.order_id} = ${post_cart_orders.id} ;;
  }
  join: post_cart_order_items {
    from: order_items
    relationship: one_to_many
    sql_on: ${post_cart_orders.id} = ${post_cart_order_items.order_id} ;;
  }

  join: post_cart_skus {
    from: skus
    relationship: one_to_many
    sql_on: ${post_cart_skus.id} = ${post_cart_cart_items.sku_id};;
  }

  join: post_cart_products {
    from: products
    relationship: one_to_many
    sql_on: ${post_cart_products.id}=${post_cart_skus.product_id};;
  }

  join: post_cart_menu_items {
    from: menu_items_new
    relationship: many_to_one
    sql_on: ${post_cart_menu_items.sku_id}= ${post_cart_skus.id} and ${post_cart_menu_items.menu_id}=${post_cart_menus.id} ;;
  }
  join: post_cart_customization_events_derived {
    relationship: many_to_one
    sql_on: ${post_cart_customization_events_derived.cart_id} = ${post_cart_carts.id} ;;
  }
  ##test
  join: test_cart {
    from: carts
    relationship: one_to_one
    sql_on: ${test_cart.order_id}=${orders.id} ;;
  }

}

explore: carts {
  label: "Skip Surveys - TEMP"
  fields: [ALL_FIELDS*, -users.utm_source_groups, -subscriptions.winback_utm_source_groups]
  join: users {
    relationship: one_to_many
    sql_on: ${users.id}=${carts.user_id} ;;

  }
  join: menus {
    relationship: one_to_many
    sql_on: ${menus.id}=${carts.menu_id} ;;
  }
  join: skip_surveys {
    relationship: many_to_one
    sql_on: ${skip_surveys.menu_id} = ${menus.id} AND ${skip_surveys.user_id} = ${users.id} ;;
  }
  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }
  join: subscription_order_num_derrived {
    relationship: one_to_one
    sql_on: ${subscription_order_num_derrived.subscriptions_id} = ${subscriptions.id} ;;
  }
}

explore: zd_tickets{
  join: zd_users {
    relationship: many_to_one
    sql_on: ${zd_tickets.submitter_id} = ${zd_users.zd_id};;
  }
  join: zd_custom_fields {
    relationship: many_to_one
    sql_on: ${zd_custom_fields.ticket_id} = ${zd_tickets.id};;
  }
  join: zd_ticket_fields {
    relationship: one_to_many
    sql_on:  ${zd_ticket_fields.field_id}=${zd_custom_fields.field_id};;
  }
  join: zd_field_custom_values {
    relationship: one_to_many
    sql_on: ${zd_field_custom_values.options_customfield}=${zd_custom_fields.customfield_options} and ${zd_field_custom_values.field_id}=${zd_ticket_fields.field_id};;
  }
  join: zd_field_system_values {
    relationship: one_to_many
    sql_on: ${zd_field_system_values.options_customfield}=${zd_custom_fields.customfield_options}and ${zd_field_custom_values.field_id}=${zd_ticket_fields.field_id};;
  }



  join: users {
    relationship: one_to_one
    sql_on: ${zd_users.email} = ${users.email};;
  }
  join: subscriptions{
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id};;
  }
  join: orders{
    relationship: one_to_one
    sql_on: ${orders.subscription_id} = ${subscriptions.id};;
  }
  join: menus{
    relationship: one_to_one
    sql_on: ${orders.menu_id} = ${menus.id};;
  }
  join: user_facts{
    relationship: one_to_one
    sql_on: ${user_facts.id} = ${users.id};;
  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }
}



explore: customer_io_email{
  label: "Customer.io Email"
  }

explore: users_for_email{
  from:  users
  label: "Customer.io Email With User Data"
  join: customer_io_email {
    relationship: one_to_many
    sql_on: ${users_for_email.id} = ${customer_io_email.user_id};;
  }
  join: subscriptions {
    relationship: one_to_one
    sql_on: ${users_for_email.id}=${subscriptions.user_id};;
  }
  join: orders_data {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders_data.subscription_id} ;;
  }
  join: user_facts {
    relationship: one_to_one
    sql_on: ${users_for_email.id} = ${user_facts.id} ;;
  }
  join: menus {
    relationship: many_to_one
    sql_on: ${orders_data.menu_id} = ${menus.id} ;;
  }
  join: subscription_order_num_derrived {
    relationship: one_to_one
    sql_on: ${subscription_order_num_derrived.subscriptions_id} = ${subscriptions.id} ;;
  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders_data.coupon_id} = ${coupons.id} ;;
  }
  join: subscription_cancellations {
    relationship: one_to_many
    sql_on: ${users_for_email.id} = ${subscription_cancellations.user_id} ;;
  }
  join: email_loyalty_test_derived {
    relationship: one_to_one
    sql_on: ${users_for_email.id} = ${email_loyalty_test_derived.users_id} ;;
  }
  join: email_failed_derived {
    relationship: one_to_one
    sql_on: ${users_for_email.id} = ${email_failed_derived.users_id} ;;
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

  join: order_items {
    relationship: one_to_many
    sql_on: ${orders.id} = ${order_items.order_id}  ;;
  }

  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id} = ${order_items.sku_id};;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }

  join: recipes {
    relationship: one_to_one
    sql_on: ${order_items.recipe_id} = ${recipes.id};;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }
  join: sab_avail_derived {
    relationship: one_to_one
    sql_on: ${gift_purchases.purchaser_id} = ${sab_avail_derived.sab_purchaser_id} ;;

  }

  join: sab_sent_derived {
    relationship: one_to_one
    sql_on: ${gift_purchases.purchaser_id} = ${sab_sent_derived.sab_purchaser_id} ;;

  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }

  join: shipping_addresses {
    relationship: one_to_many
    sql_on: ${users.id} = ${shipping_addresses.user_id} ;;

  }

  join: users_referrer {
    from:  users
    relationship: one_to_many
    sql_on: ${users_referrer.id} = ${gift_purchases.purchaser_id} ;;

  }

  join: shipping_addresses_referrer {
    from: shipping_addresses
    relationship: one_to_many
    sql_on: ${users_referrer.id} = ${shipping_addresses_referrer.user_id} ;;

  }

  join: welcome_surveys {
    relationship: one_to_one
    sql_on: ${welcome_surveys.user_id} = ${users.id} ;;
  }

  join: subscription_cancellations {
    relationship: one_to_many
    sql_on: ${users.id} = ${subscription_cancellations.user_id} ;;
  }


  join: first_order {
    from: orders
    relationship: many_to_one
    sql_on: ${first_order.id} = ${user_facts.first_order_id} ;;
  }

  join: menus {
    relationship: many_to_one
    sql_on: ${orders.menu_id} = ${menus.id} ;;
  }

  join: subscription_order_num_derrived {
    relationship: one_to_one
    sql_on: ${subscription_order_num_derrived.subscriptions_id} = ${subscriptions.id} ;;
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

explore: recipes {}

explore: recipe_feedback_surveys {
  label: "Recipe Feedback Surveys"
  fields: [ALL_FIELDS*, -customer_issues.ab_anomalies]

  join: recipe_feedbacks {
    relationship: one_to_many
    sql_on: ${recipe_feedback_surveys.id} = ${recipe_feedbacks.recipe_feedback_survey_id} ;;
  }

  join: orders {
    relationship: one_to_one
    sql_on: ${recipe_feedback_surveys.order_id}=${orders.id} ;;
  }

  join: menus {
    relationship: many_to_one
    sql_on: ${orders.menu_id} = ${menus.id} ;;
  }

  join: order_items {
    relationship: one_to_many
    sql_on:${order_items.order_id}=${orders.id};;
  }

  join: subscriptions {
    relationship: one_to_many
    sql_on: ${subscriptions.id}=${orders.subscription_id} ;;
  }

  join: users {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }

  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id}=${recipe_feedbacks.sku_id} and ${skus.id}=${order_items.sku_id} ;;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }

  join: segment_recipe_derived {
    relationship: one_to_many
    sql_on: ${users.id}=${segment_recipe_derived.user_id};;
  }

  join: customer_issues {
    relationship: many_to_one
    sql_on: ${customer_issues.order_id}=${orders.id} and ${customer_issues.sku_id}=${skus.id};;
  }

}


explore: heap_sessions {}


explore: credit_transactions{
  label: "Order Credits"
  fields: [ALL_FIELDS*, -customer_issues.ab_anomalies]

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
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${shipping_addresses.subscription_id} ;;
  }

  join: orders {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders.subscription_id} ;;
  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }
  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id}    ;;
  }

  join: customer_issues {
    relationship: one_to_one
    sql_on: ${credit_transactions.customer_issue_id} = ${customer_issues.id} ;;
  }


}

explore: refunds {
  label: "Order Refunds"
  fields: [ALL_FIELDS*, -customer_issues.ab_anomalies]

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
    sql_on: ${refunds.refundable_id}=${orders.id} ;;
  }

  join: order_items {
    relationship: one_to_many
    sql_on: ${orders.id}=${order_items.order_id} ;;
  }

  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id} = ${order_items.sku_id};;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }

  join: recipes {
    relationship: one_to_one
    sql_on: ${order_items.recipe_id} = ${recipes.id};;
  }

  join: subscriptions {
    relationship: many_to_one
    sql_on: ${orders.subscription_id}=${subscriptions.id} ;;
  }

  join: shipping_addresses {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${shipping_addresses.subscription_id} ;;
  }

  join: users {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id}=${users.id} ;;
  }

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }
  join: customer_issues {
    relationship: one_to_many
    sql_on: ${refunds.id} = ${customer_issues.refund_id} ;;
  }


  }

explore: prep_needs {

  join: recipe_plans {
    relationship: many_to_one
    sql_on: ${prep_needs.recipe_plan_id} = ${recipe_plans.id} ;;
  }
}

explore: seasonal_order {
  join: users {
    relationship:many_to_one
    sql_on: ${seasonal_order.customer_id}=${users.id} ;;
    }
  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users.id} ;;
  }
  join: orders {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders.subscription_id} ;;
  }
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = coupons.id ;;

  }
  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id}    ;;
  }

}

explore: coupons {}

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

  join: user_facts {
    relationship: one_to_one
    sql_on: ${users.id} = ${user_facts.id} ;;
  }

join: subscriptions {
  relationship: one_to_one
  sql_on:  ${subscriptions.user_id} = ${users.id} ;;
}

  join: orders {
    relationship: one_to_many
    sql_on: ${subscriptions.id} = ${orders.subscription_id} ;;
  }

  join: order_items {
    relationship:  one_to_many
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

  join: skus {
    relationship: one_to_many
    sql_on: ${skus.id} = ${order_items.sku_id};;
  }

  join: products {
    relationship: one_to_many
    sql_on: ${products.id}=${skus.product_id};;
  }

  join: recipes {
    relationship: one_to_one
    sql_on: ${order_items.recipe_id} = ${recipes.id};;
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

join: Intercom_contacts__social_profiles {
  relationship:  one_to_one
  sql_on:  ${Intercom_contacts__social_profiles.id} = ${Intercom_conversations.user__id} ;;
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
  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = ${coupons.id} ;;

  }
}

explore: users_data{
  from: users
  label: "Ops Report"

  join: subscriptions {
    relationship: one_to_one
    sql_on: ${subscriptions.user_id} = ${users_data.id};;
  }

  join: orders_data {
    relationship: many_to_one
    sql_on: ${subscriptions.id}=${orders_data.subscription_id} ;;
  }

  join: customer_issues {
    relationship: many_to_one
    sql_on: ${customer_issues.order_id}=${orders_data.id};;
  }

  join: menus {
    relationship: many_to_one
    sql_on: ${orders_data.menu_id}=${menus.id} ;;
  }

  join: order_items_data {
    relationship: many_to_one
    sql_on: ${order_items_data.order_id}=${orders_data.id}  ;;
    fields: []
  }

  join: skus {
    relationship: many_to_one
    sql_on:  ${customer_issues.sku_id}=${skus.id}  ;;
  }

  join: ingredients {
    relationship: many_to_one
    sql_on: ${customer_issues.ingredient_id}=${ingredients.id}  ;;
  }

  join: products {
    relationship: many_to_one
    sql_on: ${skus.product_id}=${products.id}  ;;
  }

  join: orders_derived {
    relationship: one_to_one
    sql_on: ${orders_derived.menus_id} = ${menus.id}  ;;
  }

  join: coupons {
    relationship: many_to_one
    sql_on: ${orders_data.coupon_id} = ${coupons.id} ;;
    fields: []
  }

  join: refunds_march21_only {
    relationship: many_to_one
    sql_on:${refunds_march21_only.refundable_id}=${orders_data.id} ;;
  }

  join: order_totals{
    view_label: "Order Totals (Filters MUST MATCH 'Orders Data' Filters)"
    from: orders_data
    relationship: many_to_one
    sql_on: ${order_totals.menu_id}=${menus.id} ;;
    sql_where: ${order_totals.fulfillment_status}= 'Confirmed' ;;
  }


  join: order_items_total{
    from: order_items_data
    relationship: many_to_one
    sql_on: ${order_items_total.order_id}=${order_totals.id}  ;;
    fields: []
  }

  join: skus_total {
    from: skus
    relationship: many_to_one
    sql_on:  ${order_items_total.sku_id}=${skus_total.id}  ;;
    fields: []
  }

  join: ingredients_total {
    from: ingredients
    relationship: many_to_one
    sql_on: ${skus_total.ingredient_id}=${ingredients_total.id}  ;;
    fields: []
  }

  join: products_total {
    from: products
    relationship: many_to_one
    sql_on: ${skus_total.product_id}=${products_total.id}  ;;
    fields: [id, meal_type]
  }

  join: cx_rep_user {
    from: users
    relationship: many_to_one
    sql_on: ${customer_issues.admin_id}=${cx_rep_user.id};;

  }
  join: user_facts {
    relationship: one_to_one
    sql_on: ${users_data.id} = ${user_facts.id}    ;;
    fields: []
  }


}

explore: facebook_ads{
  label: "Facebook Ads"

  join: facebook_ads_campaigns {
    relationship: many_to_one
    sql_on: ${facebook_ads.campaign_id} = ${facebook_ads_campaigns.id} ;;
  }

  join: facebook_ads_adsets {
    relationship: many_to_one
    sql_on: ${facebook_ads.adset_id} = ${facebook_ads_adsets.id} ;;
  }

  join: facebook_ads_adcreative {
    relationship: many_to_one
    sql_on: ${facebook_ads.creative__id} = ${facebook_ads_adcreative.id} ;;
  }

}

explore: facebook_ads_insights {
  label: "Facebook Ads Insights"

  join: facebook_ads {
    relationship: many_to_one
    sql_on: ${facebook_ads_insights.ad_id} = ${facebook_ads.id} ;;
  }
  join: facebook_ads_adsets {
    relationship: many_to_one
    sql_on: ${facebook_ads_insights.adset_id} = ${facebook_ads_adsets.id} ;;
  }

  join: facebook_ads_campaigns {
    relationship: many_to_one
    sql_on: ${facebook_ads_insights.ad_id} = ${facebook_ads_campaigns.id} ;;
    }

  join: facebook_ads_adcreative{
    relationship: many_to_one
    sql_on: ${facebook_ads.creative__id} = ${facebook_ads_adcreative.id} ;;
  }


}

explore: google_ads_campaign_performance {
  label: "Google Ads Campaign Performance"

  join: google_ads_campaigns {
    relationship: many_to_one
    sql_on: ${google_ads_campaign_performance.campaignid}=${google_ads_campaigns.id}  ;;
  }

  join: google_ads_adgroups {
    relationship: many_to_one
    sql_on: ${google_ads_adgroups.id}=${google_ads_campaigns.id}  ;;
  }
}

explore: google_ads_ad_performance {
  label: "Google Ads Ad Performance"

  join: google_ads_adgroups {
    relationship: many_to_one
    sql_on: ${google_ads_ad_performance.adgroupid} = ${google_ads_adgroups.id} ;;
  }
  join: google_ads {
    relationship: one_to_many
    sql_on: ${google_ads_adgroups.id} = ${google_ads.adgroupid} ;;
  }
  join: google_ads_campaigns {
    relationship: many_to_one
    sql_on: ${google_ads_adgroups.campaignid} = ${google_ads_campaigns.id} ;;
  }
}

explore: bing_ads_ad_performance_report {
  label: "Bing Ads Ad Performance Report"


}

explore: SAB {
  from: giveaways

  join: sab_sent {
    relationship:  one_to_one
    sql_on: ${SAB.user_id}= ${sab_sent.user_id} ;;
  }

  join: sab_avail {
    relationship:  one_to_one
    sql_on: ${SAB.user_id}= ${sab_avail.user_id} ;;
  }

  join: subscriptions {
    relationship:  one_to_one
    sql_on: ${SAB.user_id}= ${subscriptions.user_id} ;;
  }

  join: users {
    relationship:  one_to_one
    sql_on: ${SAB.user_id}= ${users.id} ;;
  }

  join: user_facts {
    relationship:  one_to_one
    sql_on: ${users.id}= ${user_facts.id} ;;
  }

  join: orders {
    relationship:  one_to_many
    sql_on: ${subscriptions.id}= ${orders.subscription_id} ;;
  }

  join: coupons {
    relationship:  many_to_one
    sql_on: ${orders.coupon_id}= ${coupons.id} ;;
  }
}
