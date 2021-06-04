view: bing_ads_ad_performance_report {
  derived_table: {
    sql: SELECT *
  FROM (
        SELECT *,
        RANK() OVER (PARTITION BY TimePeriod,
                     ORDER BY _sdc_report_datetime DESC)
        FROM bing_ads.ad_performance_report
        ORDER BY TimePeriod ASC
       ) AS latest
 WHERE latest.rank = 1
      ;;
  }


  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}.__sdc_primary_key ;;
  }

  dimension_group: _sdc_batched_at {
    type: time
    sql: ${TABLE}._sdc_batched_at ;;
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

  dimension: accountid {
    type: number
    sql: ${TABLE}.accountid ;;
  }

  dimension: addescription {
    type: string
    sql: ${TABLE}.addescription ;;
  }

  dimension: adgroupid {
    type: number
    sql: ${TABLE}.adgroupid ;;
  }

  dimension: adgroupname {
    type: string
    sql: ${TABLE}.adgroupname ;;
  }

  dimension: adgroupstatus {
    type: string
    sql: ${TABLE}.adgroupstatus ;;
  }

  dimension: adid {
    type: number
    sql: ${TABLE}.adid ;;
  }

  dimension: adstatus {
    type: string
    sql: ${TABLE}.adstatus ;;
  }

  dimension: adtype {
    type: string
    sql: ${TABLE}.adtype ;;
  }

  dimension: allconversionrate {
    type: string
    sql: ${TABLE}.allconversionrate ;;
  }

  dimension: allconversions {
    type: string
    sql: ${TABLE}.allconversions ;;
  }

  dimension: allcostperconversion {
    type: string
    sql: ${TABLE}.allcostperconversion ;;
  }

  dimension: allreturnonadspend {
    type: string
    sql: ${TABLE}.allreturnonadspend ;;
  }

  dimension: allrevenue {
    type: string
    sql: ${TABLE}.allrevenue ;;
  }

  dimension: allrevenueperconversion {
    type: string
    sql: ${TABLE}.allrevenueperconversion ;;
  }

  dimension: assists {
    type: number
    sql: ${TABLE}.assists ;;
  }

  dimension: averagecpc {
    type: number
    sql: ${TABLE}.averagecpc ;;
  }

  dimension: averagecpm {
    type: string
    sql: ${TABLE}.averagecpm ;;
  }

  dimension: averageposition {
    type: number
    sql: ${TABLE}.averageposition ;;
  }

  dimension: basecampaignid {
    type: string
    sql: ${TABLE}.basecampaignid ;;
  }

  dimension: bidmatchtype {
    type: string
    sql: ${TABLE}.bidmatchtype ;;
  }

  dimension: campaignid {
    type: number
    sql: ${TABLE}.campaignid ;;
  }

  dimension: campaignname {
    type: string
    sql: ${TABLE}.campaignname ;;
  }

  dimension: campaignstatus {
    type: string
    sql: ${TABLE}.campaignstatus ;;
  }

  dimension: campaigntype {
    type: string
    sql: ${TABLE}.campaigntype ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversionrate {
    type: number
    sql: ${TABLE}.conversionrate ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: costperassist {
    type: number
    sql: ${TABLE}.costperassist ;;
  }

  dimension: costperconversion {
    type: number
    sql: ${TABLE}.costperconversion ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension: customerid {
    type: string
    sql: ${TABLE}.customerid ;;
  }

  dimension: deviceos {
    type: string
    sql: ${TABLE}.deviceos ;;
  }

  dimension: devicetype {
    type: string
    sql: ${TABLE}.devicetype ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: returnonadspend {
    type: number
    sql: ${TABLE}.returnonadspend ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  dimension: revenueperassist {
    type: number
    sql: ${TABLE}.revenueperassist ;;
  }

  dimension: revenueperconversion {
    type: number
    sql: ${TABLE}.revenueperconversion ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  dimension_group: timeperiod {
    type: time
    sql: ${TABLE}.timeperiod ;;
  }

  measure: total_spend {
    type: sum
    sql: ${spend} ;;
    value_format_name: usd
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;
  }

}
