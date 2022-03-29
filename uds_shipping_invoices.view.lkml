view: uds_shipping_invoices {
  derived_table: {
    sql: select distinct 'UDS' shipper, "box id",split_part("box id", ' - ', 1) order_id, "tracking id", "delivery date", "weight lbs", "total rate", "base rate", "fuel surcharge"
      from temptablesmo.udsinvoices
       ;;
  }


  dimension: shipper {
    type: string
    sql: ${TABLE}.shipper ;;
  }

  dimension: box_id {
    type: number
    label: "box id"
    sql: ${TABLE}."box id" ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: tracking_id {
    type: string
    label: "tracking id"
    sql: ${TABLE}."tracking id" ;;
  }

  dimension: delivery_date {
    type: string
    label: "delivery date"
    sql: ${TABLE}."delivery date" ;;
  }

  dimension: weight_lbs {
    type: number
    label: "weight lbs"
    sql: ${TABLE}."weight lbs" ;;
  }

  dimension: total_rate {
    type: number
    value_format: "$0.00"
    label: "total rate"
    sql: ${TABLE}."total rate" ;;
  }

  dimension: base_rate {
    type: number
    value_format: "$0.00"
    label: "base rate"
    sql: ${TABLE}."base rate" ;;
  }

  dimension: fuel_surcharge {
    type: number
    value_format: "$0.00"
    label: "fuel surcharge"
    sql: ${TABLE}."fuel surcharge" ;;
  }

  measure: total_orders {
    type: count_distinct
    sql: ${TABLE}.order_id;;
  }

  measure: sum_cost {
    type: sum
    value_format: "$0.00"
    sql: ${TABLE}."total rate" ;;
  }

  measure: avg_cost {
    type: average
    value_format: "$0.00"
    sql: ${TABLE}."total rate";;
  }

  set: detail {
    fields: [
      shipper,
      box_id,
      order_id,
      tracking_id,
      delivery_date,
      weight_lbs,
      total_rate,
      base_rate,
      fuel_surcharge
    ]
  }
}
