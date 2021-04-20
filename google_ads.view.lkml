view: google_ads {
  sql_table_name: google_ads.ads
      ;;

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

  dimension: adgroupid {
    type: number
    primary_key: yes
    sql: ${TABLE}.adgroupid ;;
  }

  dimension: baseadgroupid {
    type: number
    sql: ${TABLE}.baseadgroupid ;;
  }

  dimension: basecampaignid {
    type: number
    sql: ${TABLE}.basecampaignid ;;
  }

  dimension: policysummary__combinedapprovalstatus {
    type: string
    sql: ${TABLE}.policysummary__combinedapprovalstatus ;;
  }

  dimension: policysummary__denormalizedstatus {
    type: string
    sql: ${TABLE}.policysummary__denormalizedstatus ;;
  }

  dimension: policysummary__reviewstate {
    type: string
    sql: ${TABLE}.policysummary__reviewstate ;;
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
      adgroupid,
      baseadgroupid,
      basecampaignid,
      policysummary__combinedapprovalstatus,
      policysummary__denormalizedstatus,
      policysummary__reviewstate,
      status
    ]
  }
}
