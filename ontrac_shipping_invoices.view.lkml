view: ontrac_shipping_invoices {
  derived_table: {
    sql: select distinct 'Ontrac' shipper, reference, "ship date", tracking, "total cost", "service charge", "cod charge", "declared value charge", "add'l charge 1", "add'l charge 2", "saturday charge", "fuel surcharge", "add'l charge 3"
      from temptablesmo.shippingdatatest3922
       ;;
  }

  dimension: shipper {
    type: string
    sql: ${TABLE}.shipper ;;
  }

  dimension: reference {
    type: number
    sql: ${TABLE}.reference ;;
  }

  dimension: ship_date {
    type: string
    label: "ship date"
    sql: ${TABLE}."ship date" ;;
  }

  dimension: tracking {
    type: string
    sql: ${TABLE}.tracking ;;
  }

  dimension: total_cost {
    type: number
    label: "total cost"
    sql: ${TABLE}."total cost" ;;
  }

  dimension: service_charge {
    type: number
    label: "service charge"
    sql: ${TABLE}."service charge" ;;
  }

  dimension: cod_charge {
    type: number
    label: "cod charge"
    sql: ${TABLE}."cod charge" ;;
  }

  dimension: declared_value_charge {
    type: number
    label: "declared value charge"
    sql: ${TABLE}."declared value charge" ;;
  }

  dimension: addl_charge_1 {
    type: number
    label: "add'l charge 1"
    sql: ${TABLE}."add'l charge 1" ;;
  }

  dimension: addl_charge_2 {
    type: number
    label: "add'l charge 2"
    sql: ${TABLE}."add'l charge 2" ;;
  }

  dimension: saturday_charge {
    type: number
    label: "saturday charge"
    sql: ${TABLE}."saturday charge" ;;
  }

  dimension: fuel_surcharge {
    type: number
    label: "fuel surcharge"
    sql: ${TABLE}."fuel surcharge" ;;
  }

  dimension: addl_charge_3 {
    type: number
    label: "add'l charge 3"
    sql: ${TABLE}."add'l charge 3" ;;
  }

  measure: total_orders {
    type: count_distinct
    sql: ${TABLE}.reference;;
  }

  measure: sum_cost {
    type: sum
    sql: ${TABLE}."total cost" ;;
  }

  measure: avg_cost {
    type: average
    sql: ${total_cost};;
  }


  set: detail {
    fields: [
      shipper,
      reference,
      ship_date,
      tracking,
      total_cost,
      service_charge,
      cod_charge,
      declared_value_charge,
      addl_charge_1,
      addl_charge_2,
      saturday_charge,
      fuel_surcharge,
      addl_charge_3
    ]
  }
}
