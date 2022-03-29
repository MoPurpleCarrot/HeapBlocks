view: flex_contract_carts {
  derived_table: {
    explore_source: users {
      column: cart_id { field: post_cart_carts.id }
      column: box_type { field: post_cart_cart_items.flex_contract_box_type }
      filters: {
        field: post_cart_cart_items.deleted_date
        value: "NULL"
      }
    }
  }
  dimension: cart_id {
    primary_key: yes
    type: number
  }
  dimension: box_type {
    type: string
  }
}
