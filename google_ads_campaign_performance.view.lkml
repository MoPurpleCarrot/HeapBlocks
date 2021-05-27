view: google_ads_campaign_performance {
  sql_table_name:google_ads.campaign_performance_report
      ;;

  measure: count {
    type: count
    drill_fields: [__sdc_primary_key, campaignid, campaign]
  }

  dimension: __sdc_primary_key {
    type: string
    primary_key: yes
    sql: ${TABLE}.__sdc_primary_key ;;
  }


  dimension: advertisingchannel {
    type: string
    sql: ${TABLE}.advertisingchannel ;;
  }

  dimension: avgcost {
    type: number
    description: "The average amount you pay per interaction."
    sql: ${TABLE}.avgcost/1000000 ;;
    value_format_name: usd
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

  dimension: daily_budget {
    type: number
    description: "The daily budget."
    sql: ${TABLE}.budget/1000000 ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaigntype {
    type: string
    sql: case when ${TABLE}.campaign like '%Discovery%' then 'Discovery'
              when ${TABLE}.campaign like '%Branded%' then 'Branded'
              else 'Non-Branded'
              end ;;
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
    description: "The number of conversions for all conversion actions that you have opted into optimization."
    sql: ${TABLE}.conversions ;;
  }

  dimension: convrate {
    type: number
    sql: ${TABLE}.convrate ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost/1000000 ;;
    value_format_name: usd
  }

  dimension: costconv {
    type: number
    description: "The Cost attributable to conversion-tracked clicks divided by the number of conversions."
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

  dimension: PercentNewVisitors {
    type: number
    description: "Percentage of first-time sessions (from people who had never visited your site before)."
    sql: ${TABLE}.newsessions ;;
  }

  dimension: AveragePageviews {
    type: number
    description: "Average number of pages viewed per session."
    sql: ${TABLE}.pagessession ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.startDate ;;
  }

  dimension: totalconvvalue {
    type: number
    description: "The sum of conversion values for all conversions. "
    sql: ${TABLE}.totalconvvalue ;;
  }

## Aggregated Measures


  measure: average_daily_bounce_rate {
    type: average
    value_format_name: percent_2
    description: "Percentage of clicks where the user only visited a single page on your site."
    sql: ${bouncerate} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    description: "The number of clicks."
    drill_fields: [start_date, total_impressions,total_clicks,total_conversions, total_cost]
  }

  measure: total_conversions {
    type: sum
    description: "The number of conversions for all conversion actions that you have opted into optimization."
    sql: ${conversions} ;;
    drill_fields: [start_date, total_conversions, total_cost]
  }

  measure: total_cost {
    type: sum
    description: "The sum of your cost-per-click (CPC) and cost-per-thousand impressions (CPM) costs during this period."
    sql: ${cost} ;;
    value_format_name: usd
    drill_fields: [start_date, campaigns.name, total_cost]
  }

  measure: total_engagements {
    type: sum
    description: "The number of engagements."
    sql: ${engagements} ;;
  }

  measure: total_interactions {
    type: sum
    sql: ${interactions} ;;
    description: "The number of interactions. An interaction is the main user action associated with an ad format—clicks for text and shopping ads, views for video ads, and so on."
  }

  measure: total_impressions {
    type: sum
    description: "Count of how often your ad has appeared on a search results page or website on the Google Network."
    sql: ${impressions} ;;
    drill_fields: [start_date, total_impressions, total_clicks,total_conversions, total_cost]
  }

  measure: avg_interaction_rate {
    type: average
    sql: ${interactionrate} ;;

  }

  measure: average_daily_cost {
    description: "The average amount you pay per interaction. This amount is the total cost of your ads divided by the total number of interactions."
    type: average
    value_format_name: usd
    sql: ${avgcost} ;;
  }

}
