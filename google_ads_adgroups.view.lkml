view: google_ads_adgroups {
  sql_table_name: google_ads.ad_groups
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

  dimension: adgrouptype {
    type: string
    sql: ${TABLE}.adgrouptype ;;
  }

  dimension: baseadgroupid {
    type: number
    sql: ${TABLE}.baseadgroupid ;;
  }

  dimension: basecampaignid {
    type: number
    sql: ${TABLE}.basecampaignid ;;
  }

  dimension: campaignid {
    type: number
    sql: ${TABLE}.campaignid ;;
  }

  dimension: campaignname {
    type: string
    sql: ${TABLE}.campaignname ;;
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
      adgrouptype,
      baseadgroupid,
      basecampaignid,
      campaignid,
      campaignname,
      id,
      name,
      status
    ]
  }
}
