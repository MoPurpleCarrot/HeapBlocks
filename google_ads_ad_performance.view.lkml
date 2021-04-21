view: google_ads_ad_performance {
  sql_table_name: google_ads.ad_performance_report
      ;;


  measure: count {
    type: count
    drill_fields: [details*]
  }

  dimension: __sdc_primary_key {
    type: string
    sql: ${TABLE}.__sdc_primary_key ;;
  }


  dimension: adgroupid {
    type: number
    sql: ${TABLE}.adgroupid ;;
  }

  dimension: adid {
    type: number
    sql: ${TABLE}.adid ;;
  }

  dimension: avgcost {
    type: number
    sql: ${TABLE}.avgcost/1000000 ;;
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
    sql: ${TABLE}.cost/1000000 ;;
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

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
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

  dimension: totalconvvalue {
    type: number
    sql: ${TABLE}.totalconvvalue ;;
  }

## Aggregated Measures

  dimension: cost_per_click {
    type: number
    sql: ${cost}/(NULLIF(${clicks},0)) ;;
  }

  measure: average_cost_per_conversion {
    type: number
    sql: ${total_cost}*1.0 / NULLIF(${total_conversions},0) ;;
    value_format_name: usd
    drill_fields: [details*]
  }

  measure: average_daily_cost {
    description: "The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions."
    type: average
    value_format_name: usd
    sql: ${avgcost} ;;
    drill_fields: [details*]
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    description: "The number of clicks."
    drill_fields: [details*]
  }

  measure: total_conversions {
    type: sum
    description: "The number of conversions for all conversion actions that you have opted into optimization."
    sql: ${conversions} ;;
    drill_fields: [details*]
  }

  measure: total_cost {
    type: sum
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [details*]
  }

  measure: total_engagements {
    type: sum
    hidden: yes
    description: "The number of engagements. An engagement occurs when a viewer expands your Lightbox ad."
    sql: ${engagements} ;;
    drill_fields: [details*]
  }

  measure: total_impressions {
    type: sum
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${impressions} ;;
    drill_fields: [details*]
  }

  measure: total_interactions {
    type: sum
    sql: ${interactions} ;;
    description: "The number of interactions. An interaction is the main user action associated with an ad format—clicks for text and shopping ads, views for video ads, and so on."
    drill_fields: [details*]
  }


  set: details {
    fields: [adid, campaignid, cost, cost_per_click, total_impressions, total_clicks, total_conversions]
  }
}
