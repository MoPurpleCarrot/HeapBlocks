view: mktg_channel_metrics {
  derived_table: {
    sql: WITH google_ads_campaign_performance AS (SELECT *
                  FROM (
                            SELECT *,
                            RANK() OVER (PARTITION BY day, _sdc_customer_id
                                         ORDER BY _sdc_report_datetime DESC)
                            FROM google_ads.campaign_performance_report
                            ORDER BY day ASC
                           ) AS latest
                     WHERE latest.rank = 1
),
bing_ads_ad_performance_report AS (SELECT *
  FROM (
        SELECT *,
        RANK() OVER (PARTITION BY TimePeriod
                     ORDER BY _sdc_report_datetime DESC)
        FROM bing_ads.ad_performance_report
        ORDER BY TimePeriod ASC
       ) AS latest
 WHERE latest.rank = 1
      )
select distinct (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD')) ship_week
,COALESCE(SUM(google.clicks ), 0) clicks
,COALESCE(SUM(( google.cost/1000000  ) ), 0) spend
from "heroku_postgres"."menus" menus
join google_ads_campaign_performance google on (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM google.day )::integer - 3 + 7, 7)), google.day  )), 'YYYY-MM-DD')) = (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD'))
group by (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD'))
union all
select distinct (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD')) ship_week
,COALESCE(SUM(bing.clicks ), 0)  clicks
,COALESCE(SUM(bing.spend ), 0) spend
from "heroku_postgres"."menus" menus
join bing_ads_ad_performance_report bing on  (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM bing.timeperiod )::integer - 3 + 7, 7)), bing.timeperiod  )), 'YYYY-MM-DD')) = (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD'))
group by (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD'))
union all
select distinct (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD')) ship_week
,COALESCE(SUM(facebook.inline_link_clicks ), 0) clicks
,COALESCE(SUM("spend"), 0) spend
from "heroku_postgres"."menus" menus
join "facebook_ads"."ads_insights" facebook on (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "facebook"."date_start")::integer - 3 + 7, 7)), "facebook"."date_start" )), 'YYYY-MM-DD')) = (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD'))
group by (TO_CHAR(DATE(DATEADD(day,(0 - MOD(EXTRACT(DOW FROM "menus"."shipping_on")::integer - 3 + 7, 7)), "menus"."shipping_on" )), 'YYYY-MM-DD'))
 ;;
  }


  dimension: ship_week {
    type: date
    sql: ${TABLE}.ship_week ;;
    primary_key: yes
  }


  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
    }

  measure: total_spend {
    type: sum
    value_format_name: usd
    sql: ${spend} ;;
  }

}
