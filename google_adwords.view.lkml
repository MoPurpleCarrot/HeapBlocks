view: google_adwords {
  sql_table_name: google_adwords.adwords91792411_v2 ;;

  dimension_group: _sdc_batched {
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
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_received {
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

  dimension: accountid {
    type: string
    sql: ${TABLE}.accountid ;;
  }

  dimension: adclicks {
    type: number
    sql: ${TABLE}.adclicks ;;
  }

  measure: adclicks_sum {
    type: sum
    sql: ${adclicks} ;;
  }

  dimension: adcontent {
    type: string
    sql: ${TABLE}.adcontent ;;
  }

  dimension: adcost {
    type: number
    sql: ${TABLE}.adcost ;;
  }

  measure: adcost_sum {
    type: sum
    value_format_name: usd
    sql: ${adcost} ;;
  }

  dimension: addestinationurl {
    type: string
    sql: ${TABLE}.addestinationurl ;;
  }

  dimension: adgroup {
    type: string
    sql: ${TABLE}.adgroup ;;
  }

  dimension: adwordscampaignid {
    type: string
    sql: ${TABLE}.adwordscampaignid ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  measure: impressions_sum {
    type: sum
    sql: ${impressions} ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: profileid {
    type: string
    sql: ${TABLE}.profileid ;;
  }

  dimension: profilename {
    type: string
    sql: ${TABLE}.profilename ;;
  }

  measure: count {
    type: count
    drill_fields: [profilename]
  }
}
