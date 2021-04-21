view: facebook_ads_adsets {
  sql_table_name: facebook_ads.adsets
      ;;


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

  dimension: bid_info__actions {
    type: number
    sql: ${TABLE}.bid_info__actions ;;
  }

  dimension: budget_remaining {
    type: number
    sql: ${TABLE}.budget_remaining ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension_group: created_time {
    type: time
    sql: ${TABLE}.created_time ;;
  }

  dimension: daily_budget {
    type: number
    sql: ${TABLE}.daily_budget ;;
  }

  dimension: effective_status {
    type: string
    sql: ${TABLE}.effective_status ;;
  }

  dimension_group: end_time {
    type: time
    sql: ${TABLE}.end_time ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: lifetime_budget {
    type: number
    sql: ${TABLE}.lifetime_budget ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: promoted_object__custom_event_type {
    type: string
    sql: ${TABLE}.promoted_object__custom_event_type ;;
  }

  dimension: promoted_object__pixel_id {
    type: string
    sql: ${TABLE}.promoted_object__pixel_id ;;
  }

  dimension: promoted_object__pixel_rule {
    type: string
    sql: ${TABLE}.promoted_object__pixel_rule ;;
  }

  dimension: promoted_object__product_set_id {
    type: string
    sql: ${TABLE}.promoted_object__product_set_id ;;
  }

  dimension_group: start_time {
    type: time
    sql: ${TABLE}.start_time ;;
  }


  dimension_group: updated_time {
    type: time
    sql: ${TABLE}.updated_time ;;
  }

  dimension: promoted_object__page_id {
    type: string
    sql: ${TABLE}.promoted_object__page_id ;;
  }

  dimension: bid_info__impressions {
    type: number
    sql: ${TABLE}.bid_info__impressions ;;
  }

  set: detail {
    fields: [
      _sdc_batched_at_time,
      _sdc_extracted_at_time,
      _sdc_received_at_time,
      _sdc_sequence,
      _sdc_table_version,
      account_id,
      bid_info__actions,
      budget_remaining,
      campaign_id,
      created_time_time,
      daily_budget,
      effective_status,
      end_time_time,
      id,
      lifetime_budget,
      name,
      promoted_object__custom_event_type,
      promoted_object__pixel_id,
      promoted_object__pixel_rule,
      promoted_object__product_set_id,
      start_time_time,
      updated_time_time,
      promoted_object__page_id,
      bid_info__impressions
    ]
  }
}
