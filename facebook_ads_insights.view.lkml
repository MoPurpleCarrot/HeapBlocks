view: facebook_ads_insights {
  sql_table_name: facebook_ads.ads_insights ;;

## STANDARD FIELDS


  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: adset_id {
    type: string
    sql: ${TABLE}.adset_id ;;
  }

  dimension: campaign_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: actions {
    type: number
    sql: ${TABLE}.actions ;;
  }
  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversion_rate_ranking {
    type: string
    sql: ${TABLE}.conversion_rate_ranking ;;
  }



  dimension: cost_per_unique_click {
    type: number
    sql: ${TABLE}.cost_per_unique_click ;;
  }


  dimension: CPC {
    type: number
    sql: ${TABLE}.cpc ;;
  }

  dimension: CPM {
    type: number
    sql: ${TABLE}.cpm ;;
  }

  dimension: CPP {
    type: number
    sql: ${TABLE}.cpp ;;
  }

  dimension: CTR {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
    type: time
    timeframes: [raw,
      time,
      date,
      week,
      month,
      quarter,
      year]
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
    type: time
    timeframes: [raw,
      time,
      date,
      week,
      month,
      quarter,
      year]
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: social_spend {
    type: number
    sql: ${TABLE}.social_spend ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
    value_format_name: usd
  }

  dimension: unique_clicks {
    type: number
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_CTR {
    type: number
    sql: ${TABLE}.unique_ctr ;;
  }

  dimension: unique_link_clicks_CTR {
    type: number
    sql: ${TABLE}.unique_link_clicks_ctr ;;
  }

  dimension: unique_inline_link_click_CTR {
    type: number
    sql: ${TABLE}.unique_inline_link_click_ctr ;;
  }


## AGGREGATED MEASURES

  measure: count {
    type: count
  }

  measure: total_reach {
    type: sum
    sql: ${reach} ;;
    drill_fields: [detail*]
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    drill_fields: [detail*]
  }

  measure: total_unique_clicks {
    type: sum
    sql: ${unique_clicks} ;;
    drill_fields: [detail*]
  }


  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
    drill_fields: [detail*]
  }

  measure: avg_frequency {
    description: "the average number of times your ad was served to each person"
    type: average
    sql: ${frequency} ;;
    value_format_name: decimal_2
    drill_fields: [detail*]
  }

  measure: avg_CPM {
    description: "The average cost you've paid to have 1,000 impressions on your ad."
    type: average
    sql: ${CPM} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: avg_CPP {
    description: "The average cost you've paid to have your ad served to 1,000 unique people."
    type: average
    sql: ${CPP} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: avg_CTR {
    type: average
    sql: ${CTR} ;;
    value_format: "0.00"
    drill_fields: [detail*]
  }

  measure: avg_CPC {
    type: average
    sql: ${CPC} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: total_spend {
    type: sum
    sql: ${spend} ;;
    value_format_name: usd
    drill_fields: [detail*]
  }

  measure: avg_unique_clicks {
    type: number
    sql: ${TABLE}.unique_clicks ;;
  }

  measure: total_unique_inline_link_clicks {
    type: sum
    sql: ${TABLE}.unique_inline_link_clicks ;;
  }

  measure: avg_inline_link_click_CTR {
    type: average
    sql: ${TABLE}.inline_link_click_CTR ;;
  }

  measure: avg_cost_per_inline_link_click {
    type: average
    sql: ${TABLE}.cost_per_inline_link_click ;;
  }

  measure: avg_cost_per_inline_post_engagement {
    type: average
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }


  set: detail {
    fields: [campaign_id, total_clicks, total_spend, total_impressions, total_reach, avg_frequency]
  }
}
