view: lasership_shipping_invoices {
  derived_table: {
    sql: select distinct 'Lasership' shipper, "inv no", "reference1", "lstracking number", "service amount", "extra 1 amount", "extra 2 amount", "extra 3 amount"
      , "extra 4 amount", "extra 5 amount", "extra 6 amount", "extra 7 amount", "extra 8 amount", "extra 9 amount", "extra 10 amount", "extra 11 amount", "extra 12 amount", "extra 13 amount", "extra 14 amount", "en", total, "pod datetime", "original deliver by"
      from temptablesmo.lasershipinvoices
       ;;
  }

  dimension: shipper {
    type: string
    sql: ${TABLE}.shipper ;;
  }

  dimension: inv_no {
    type: string
    label: "inv no"
    sql: ${TABLE}."inv no" ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.reference1 ;;
  }

  dimension: lstracking_number {
    type: string
    label: "lstracking number"
    sql: ${TABLE}."lstracking number" ;;
  }

  dimension: service_amount {
    type: number
    value_format: "$0.00"
    label: "service amount"
    sql: ${TABLE}."service amount" ;;
  }

  dimension: extra_1_amount {
    type: number
    value_format: "$0.00"
    label: "extra 1 amount"
    sql: ${TABLE}."extra 1 amount" ;;
  }

  dimension: extra_2_amount {
    type: number
    value_format: "$0.00"
    label: "extra 2 amount"
    sql: ${TABLE}."extra 2 amount" ;;
  }

  dimension: extra_3_amount {
    type: number
    value_format: "$0.00"
    label: "extra 3 amount"
    sql: ${TABLE}."extra 3 amount" ;;
  }

  dimension: extra_4_amount {
    type: number
    value_format: "$0.00"
    label: "extra 4 amount"
    sql: ${TABLE}."extra 4 amount" ;;
  }

  dimension: extra_5_amount {
    type: number
    value_format: "$0.00"
    label: "extra 5 amount"
    sql: ${TABLE}."extra 5 amount" ;;
  }

  dimension: extra_6_amount {
    type: number
    value_format: "$0.00"
    label: "extra 6 amount"
    sql: ${TABLE}."extra 6 amount" ;;
  }

  dimension: extra_7_amount {
    type: number
    value_format: "$0.00"
    label: "extra 7 amount"
    sql: ${TABLE}."extra 7 amount" ;;
  }

  dimension: extra_8_amount {
    type: number
    value_format: "$0.00"
    label: "extra 8 amount"
    sql: ${TABLE}."extra 8 amount" ;;
  }

  dimension: extra_9_amount {
    type: number
    value_format: "$0.00"
    label: "extra 9 amount"
    sql: ${TABLE}."extra 9 amount" ;;
  }

  dimension: extra_10_amount {
    type: number
    value_format: "$0.00"
    label: "extra 10 amount"
    sql: ${TABLE}."extra 10 amount" ;;
  }

  dimension: extra_11_amount {
    type: number
    value_format: "$0.00"
    label: "extra 11 amount"
    sql: ${TABLE}."extra 11 amount" ;;
  }

  dimension: extra_12_amount {
    type: number
    value_format: "$0.00"
    label: "extra 12 amount"
    sql: ${TABLE}."extra 12 amount" ;;
  }

  dimension: extra_13_amount {
    type: number
    value_format: "$0.00"
    label: "extra 13 amount"
    sql: ${TABLE}."extra 13 amount" ;;
  }

  dimension: extra_14_amount {
    type: number
    value_format: "$0.00"
    label: "extra 14 amount"
    sql: ${TABLE}."extra 14 amount" ;;
  }

  dimension: en {
    type: number
    sql: ${TABLE}.en ;;
  }

  dimension: total {
    type: number
    value_format: "$0.00"
    sql: ${TABLE}.total ;;
  }

  dimension_group: pod_datetime {
    type: time
    label: "pod datetime"
    sql: ${TABLE}."pod datetime" ;;
  }

  dimension_group: original_deliver_by {
    type: time
    label: "original deliver by"
    sql: ${TABLE}."original deliver by" ;;
  }

  measure: total_orders {
    type: count_distinct
    sql: ${TABLE}.reference1;;
  }

  measure: sum_cost {
    type: sum
    value_format: "$0.00"
    sql: ${TABLE}.total ;;
  }

  measure: avg_cost {
    type: average
    value_format: "$0.00"
    sql: ${TABLE}.total;;
  }

  set: detail {
    fields: [
      shipper,
      inv_no,
      order_id,
      lstracking_number,
      service_amount,
      extra_1_amount,
      extra_2_amount,
      extra_3_amount,
      extra_4_amount,
      extra_5_amount,
      extra_6_amount,
      extra_7_amount,
      extra_8_amount,
      extra_9_amount,
      extra_10_amount,
      extra_11_amount,
      extra_12_amount,
      extra_13_amount,
      extra_14_amount,
      en,
      total,
      pod_datetime_time,
      original_deliver_by_time
    ]
  }
}
