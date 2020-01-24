view: shipping_addresses {
  sql_table_name: heroku_postgres.shipping_addresses ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

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

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address2 {
    type: string
    sql: ${TABLE}.address2 ;;
  }

  dimension: business_name {
    type: string
    sql: ${TABLE}.business_name ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: delivery_instructions {
    type: string
    sql: ${TABLE}.delivery_instructions ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: is_residential {
    type: yesno
    sql: ${TABLE}.is_residential ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: region_name {
    type: string
    sql: ${TABLE}.region_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: state_geo {
    type: string
    group_label: "Location"
    map_layer_name: us_states
    sql: CASE WHEN ${TABLE}.state = ' ' THEN NULL ELSE ${TABLE}.state END ;;
  }

  dimension: subscription_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.subscription_id ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: zip {
    type: string
    sql: ${TABLE}.zip ;;
  }

  dimension: zip_geo {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: primary {
    type: string
    sql: ${TABLE}.primary ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: sms_notification_status{
    type: string
    sql:  CASE WHEN $sms_notification_status} = 1 THEN 'Enabled'
          ELSE 'Not Enabled'
          END
          ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      business_name,
      first_name,
      last_name,
      region_name,
      subscriptions.id
    ]
  }
}
