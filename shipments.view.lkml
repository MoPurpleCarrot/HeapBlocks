view: shipments {
  sql_table_name: heroku_postgres.shipments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    hidden: yes
  }

  dimension_group: _sdc_batched {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes

  }

  dimension_group: _sdc_extracted {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_extracted_at ;;
    hidden: yes

  }

  dimension_group: _sdc_received {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: yes

  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes

  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes

  }

  dimension: box_size {
    type: string
    sql: ${TABLE}.box_size ;;
    hidden: yes

  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    hidden: yes

  }

  dimension_group: delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.delivery_on ;;
    hidden: yes

  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
    hidden: yes

  }

  dimension: point_value {
    type: number
    sql: ${TABLE}.point_value ;;
    hidden: yes

  }

  dimension_group: ship_template_delivery {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ship_template_delivery_date ;;
    hidden: yes

  }

  dimension: ship_template_fulfillment_center {
    type: string
    sql: ${TABLE}.ship_template_fulfillment_center ;;
    hidden: yes

  }

  dimension_group: ship_template_ship {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.ship_template_ship_date ;;
    hidden: yes

  }

  dimension: ship_template_shipping_cost {
    type: number
    sql: ${TABLE}.ship_template_shipping_cost ;;
    hidden: yes

  }

  dimension: ship_template_shipping_provider {
    type: string
    sql: ${TABLE}.ship_template_shipping_provider ;;
    hidden: yes

  }

  dimension: ship_template_tnt {
    type: number
    sql: ${TABLE}.ship_template_tnt ;;
    hidden: yes

  }

  dimension: shipment_identifier {
    type: string
    sql: ${TABLE}.shipment_identifier ;;
    hidden: yes

  }

  dimension: shipment_status {
    type: number
    sql: ${TABLE}.shipment_status ;;
    hidden: yes

  }

  dimension: shipping_carrier {
    type: string
    sql: ${TABLE}.shipping_carrier ;;
    hidden: yes

  }

  dimension: tracking_number {
    type: string
    sql: ${TABLE}.tracking_number ;;
    hidden: yes

  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
    hidden: yes

  }

  measure: count {
    type: count
    drill_fields: [id, shipment_items.count]
    hidden: yes

  }
}
