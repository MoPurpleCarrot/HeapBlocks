view: google_ads_campaigns {
  derived_table: {
    sql: select * from google_ads.campaigns
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: _sdc_batched_at {
    type: time
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension: _sdc_customer_id {
    type: string
    sql: ${TABLE}._sdc_customer_id ;;
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

  dimension: adservingoptimizationstatus {
    type: string
    sql: ${TABLE}.adservingoptimizationstatus ;;
  }

  dimension: advertisingchanneltype {
    type: string
    sql: ${TABLE}.advertisingchanneltype ;;
  }

  dimension: basecampaignid {
    type: number
    sql: ${TABLE}.basecampaignid ;;
  }

  dimension: campaigntrialtype {
    type: string
    sql: ${TABLE}.campaigntrialtype ;;
  }

  dimension_group: enddate {
    type: time
    sql: ${TABLE}.enddate ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: servingstatus {
    type: string
    sql: ${TABLE}.servingstatus ;;
  }

  dimension_group: startdate {
    type: time
    sql: ${TABLE}.startdate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  set: detail {
    fields: [
      _sdc_batched_at_time,
      _sdc_customer_id,
      _sdc_extracted_at_time,
      _sdc_received_at_time,
      _sdc_sequence,
      _sdc_table_version,
      adservingoptimizationstatus,
      advertisingchanneltype,
      basecampaignid,
      campaigntrialtype,
      enddate_time,
      id,
      name,
      servingstatus,
      startdate_time,
      status
    ]
  }
}
