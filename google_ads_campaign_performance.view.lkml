view: google_ads_campaign_performance {
  sql_table_name:google_ads.campaign_performance_report
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: __sdc_primary_key {
    type: string
    primary_key: yes
    sql: ${TABLE}.__sdc_primary_key ;;
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

  dimension_group: _sdc_report_datetime {
    type: time
    sql: ${TABLE}._sdc_report_datetime ;;
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
  }

  dimension: advertisingchannel {
    type: string
    sql: ${TABLE}.advertisingchannel ;;
  }

  dimension: avgcost {
    type: number
    sql: ${TABLE}.avgcost ;;
  }

  dimension: avgcpc {
    type: number
    sql: ${TABLE}.avgcpc ;;
  }

  dimension: avgcpe {
    type: number
    sql: ${TABLE}.avgcpe ;;
  }

  dimension: avgcpm {
    type: number
    sql: ${TABLE}.avgcpm ;;
  }

  dimension: avgcpv {
    type: number
    sql: ${TABLE}.avgcpv ;;
  }

  dimension: bidstrategytype {
    type: string
    sql: ${TABLE}.bidstrategytype ;;
  }

  dimension: bouncerate {
    type: number
    sql: ${TABLE}.bouncerate ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaigngroupid {
    type: number
    sql: ${TABLE}.campaigngroupid ;;
  }

  dimension: campaignid {
    type: number
    sql: ${TABLE}.campaignid ;;
  }

  dimension: campaignservingstatus {
    type: string
    sql: ${TABLE}.campaignservingstatus ;;
  }

  dimension: campaignstate {
    type: string
    sql: ${TABLE}.campaignstate ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: convrate {
    type: number
    sql: ${TABLE}.convrate ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: costconv {
    type: number
    sql: ${TABLE}.costconv ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: customerid {
    type: number
    sql: ${TABLE}.customerid ;;
  }

  dimension_group: day {
    type: time
    sql: ${TABLE}.day ;;
  }

  dimension: engagementrate {
    type: number
    sql: ${TABLE}.engagementrate ;;
  }

  dimension: engagements {
    type: number
    sql: ${TABLE}.engagements ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interactionrate {
    type: number
    sql: ${TABLE}.interactionrate ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.interactions ;;
  }

  dimension: interactiontypes {
    type: string
    sql: ${TABLE}.interactiontypes ;;
  }

  dimension: newsessions {
    type: number
    sql: ${TABLE}.newsessions ;;
  }

  dimension: pagessession {
    type: number
    sql: ${TABLE}.pagessession ;;
  }

  dimension_group: startdate {
    type: time
    sql: ${TABLE}.startdate ;;
  }

  dimension: totalconvvalue {
    type: number
    sql: ${TABLE}.totalconvvalue ;;
  }

  set: detail {
    fields: [
      __sdc_primary_key,
      _sdc_batched_at_time,
      _sdc_customer_id,
      _sdc_extracted_at_time,
      _sdc_received_at_time,
      _sdc_report_datetime_time,
      _sdc_sequence,
      _sdc_table_version,
      advertisingchannel,
      avgcost,
      avgcpc,
      avgcpe,
      avgcpm,
      avgcpv,
      bidstrategytype,
      bouncerate,
      budget,
      campaign,
      campaigngroupid,
      campaignid,
      campaignservingstatus,
      campaignstate,
      clicks,
      conversions,
      convrate,
      cost,
      costconv,
      ctr,
      customerid,
      day_time,
      engagementrate,
      engagements,
      impressions,
      interactionrate,
      interactions,
      interactiontypes,
      newsessions,
      pagessession,
      startdate_time,
      totalconvvalue
    ]
  }
}
