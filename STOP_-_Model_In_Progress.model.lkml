connection: "redshift"
week_start_day: wednesday

# include all views in this project
include: "*.view"

datagroup: hourly_sync  {
  sql_trigger: SELECT DATE_PART('hour', getdate()) ;;
}


explore: users {
  persist_for: "1 hour"
  label: "Users Base"
  fields: [ALL_FIELDS*, -customer_issues.ab_anomalies,-customer_issues.gf_anomalies,-customer_issues.so_anomalies]


  join: subscription_cancellations {
    relationship: one_to_many
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

  join: welcome_surveys {
    relationship: one_to_one
    sql_on: ${welcome_surveys.user_id} = ${users.id} ;;
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

  join: order_items {
    relationship: one_to_many
    sql_on: ${orders.id} = ${order_items.order_id} ;;
  }

 join: skus {
    relationship: one_to_one
    sql_on: ${order_items.sku_id}=${skus.id} ;;
  }

  join: products{
    relationship: one_to_many
    sql_on:${products.id}=${skus.product_id};;

  }

  join: coupons {
    relationship: many_to_one
    sql_on: ${orders.coupon_id} = coupons.id ;;

  }
  join: gift_redemptions {
    relationship: many_to_one
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
}
