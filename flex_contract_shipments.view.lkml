view: flex_contract_shipments {
  derived_table: {
    explore_source: users {
      column: shipment_id { field: shipments.id }
      column: box_type { field: shipment_items.flex_contract_box_type }
      filters: {
        field: shipment_items.deleted_date
        value: "NULL"
      }
    }
  }
  dimension: shipment_id {
    primary_key: yes
    type: number
  }
  dimension: box_type {
    type: string
  }
}
