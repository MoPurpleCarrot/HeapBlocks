- connection: redshift

- include: "*.view.lookml"       # include all views in this project
- include: "*.dashboard.lookml"  # include all dashboards in this project


- explore: users
  persist_for: 1 hour
  label: "(2) Customer Service Portal"
  joins:
    - join: tickets
      relationship: one_to_many
      sql_on: ${users.email} = ${tickets.email}
      
    - join: subscriptions
      relationship: one_to_one
      sql_on: ${subscriptions.user_id} = ${users.id}
      
    - join: orders
      relationship: one_to_many
      sql_on: ${orders.subscription_id} = ${subscriptions.id}
    
    - join: google_analytics_user
      relationship: one_to_many
      sql_on: ${users.id} = ${google_analytics_user.dimension1}

- explore: orders
  persist_for: 1 hour
  label: "(1) Users, Orders & Recipes"
  joins:
    - join: subscriptions
      relationship: many_to_one
      sql_on: ${orders.subscription_id} = ${subscriptions.id}
     
    - join: users
      relationship: one_to_one
      sql_on: ${subscriptions.user_id} = ${users.id}
      
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
      
    - join: chefs
      relationship: many_to_one
      sql_on: ${recipes.chef_id} = ${chefs.id}
      
    - join: stripe_charges
      relationship: one_to_one
      sql_on: ${orders.stripe_charge_id} = ${stripe_charges.id}
      
- explore: google_analytics_age
  label: "(3) Google Analytics Age"
   
- explore: google_analytics_wau
  label: "(4) Google Analytics Active Users"
  joins:
    - join: google_analytics_mau
      relationship: one_to_one
      sql_on: ${google_analytics_wau.date_date} = ${google_analytics_mau.date_date}
      
    - join: google_analytics_dau
      relationship: one_to_one
      sql_on: ${google_analytics_wau.date_date} = ${google_analytics_dau.date_date}
      
- explore: google_analytics_conversion
  label: "(5) Google Analytics Conversion"