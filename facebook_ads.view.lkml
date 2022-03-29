view: facebook_ads {
 sql_table_name: facebook_ads.ads ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: _sdc_batched_at {
    type: time
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted_at {
    type: time
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received_at {
    type: time
    sql: ${TABLE}._sdc_received_at ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: created_time {
    type: time
    sql: ${TABLE}.created_time ;;
  }

  dimension: creative__id {
    type: string
    sql: ${TABLE}.creative__id ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: last_updated_by_app_id {
    type: string
    sql: ${TABLE}.last_updated_by_app_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: source_ad_id {
    type: string
    sql: ${TABLE}.source_ad_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_time {
    type: time
    sql: ${TABLE}.updated_time ;;
  }

  dimension: bid_info__actions {
    type: number
    sql: ${TABLE}.bid_info__actions ;;
  }

  dimension: bid_amount {
    type: number
    sql: ${TABLE}.bid_amount ;;
  }

  set: detail {
    fields: [
      _sdc_batched_at_time,
      _sdc_extracted_at_time,
      _sdc_received_at_time,
      _sdc_sequence,
      _sdc_table_version,
      account_id,
      adset_id,
      bid_type,
      campaign_id,
      created_time_time,
      creative__id,
      effective_status,
      id,
      last_updated_by_app_id,
      name,
      source_ad_id,
      status,
      updated_time_time,
      bid_info__actions,
      bid_amount
    ]
  }
}
