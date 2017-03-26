connection: "redshift"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     sql_on: ${orders.id} = ${order_items.order_id}
#   }
#
#   join: users {
#     sql_on: ${users.id} = ${orders.user_id}
#   }
# }
explore:users {
  persist_for: "1 hour"
  label: "TEST User and Order"

  join:  orders {
  relationship: many_to_one
  sql_on: ${users.account_number} = ${orders.account_number} ;;
  fields: [orders.account_number]
  }
}
