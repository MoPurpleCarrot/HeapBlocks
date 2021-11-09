view: flex_contract {
  derived_table: {
    explore_source: users {
      column: id { field: orders.id }
      column: flex_contract_box_type { field: order_items.flex_contract_box_type }
      filters: {
        field: order_items.deleted_date
        value: "NULL"
      }
    }
  }
  dimension: id {
    primary_key: yes
    type: number
  }
  dimension: box_type {
    type: number
  }
}
