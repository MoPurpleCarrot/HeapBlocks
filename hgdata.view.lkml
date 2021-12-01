view: hgdata {
  sql_table_name: hgdata_v2.sheet1 ;;

  dimension: __sdc_row {
    type: number
    sql: ${TABLE}.__sdc_row ;;
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

  dimension: item_type {
    type: string
    sql: ${order_items.item_type};;
    hidden: yes
  }

  dimension: carbon_saved_default {
    type: number
    sql:${TABLE}."carbon saved";;
    hidden: yes
  }

  dimension: carbon_saved {
    type: number
    sql: case
          when ${item_type} = 'Dinner - MK - 4' then ${carbon_saved_default}*2
          else ${carbon_saved_default}
          end;;
    value_format: "0.00"
  }

  dimension: products_id {
    type: number
    sql: ${TABLE}."products id" ;;
  }

  dimension: water_saved_default {
    type: number
    sql: ${TABLE}."water saved";;
    hidden: yes
  }

  dimension: water_saved {
    type: number
    sql: case
          when ${item_type} = 'Dinner - MK - 4' then ${water_saved_default}*2
          else ${water_saved_default}
          end;;
    value_format: "0.00"
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: sum_carbon {
    type: sum
    sql: ${carbon_saved} ;;
  }

  measure: sum_water {
    type: sum
    sql: ${water_saved} ;;
  }

}
