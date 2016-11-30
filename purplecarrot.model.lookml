- connection: redshift

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project




- explore: report

- explore: users
  joins:
    - join: tickets
      relationship: one_to_many
      sql_on: ${users.email} = ${tickets.email}

- explore: orders
  label: "(1) Users, Orders & Recipes"
  joins:
    - join: users
      relationship: many_to_one
      sql_on: ${orders.user_id} = ${users.id}
      
    - join: subscriptions
      relationship: many_to_one
      sql_on: ${orders.subscription_id} = ${subscriptions.id}
      
    - join: menus
      relationship: many_to_one
      sql_on: ${orders.menu_id} = ${menus.id}
      
    - join: menu_items
      relationship: one_to_many
      #this is a mapping/join table
      fields: []
      sql_on: ${menus.id} = ${menu_items.menu_id}
      
    - join: recipes
      relationship: many_to_one
      sql_on: ${menu_items.recipe_id} = ${recipes.id}
      
      