view: credit_transactions {
  sql_table_name: heroku_postgres.credit_transactions ;;

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
    hidden:  yes
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
    hidden:  yes
  }

  dimension: _sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden:  yes
  }

  dimension: _sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden:  yes
  }

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
    hidden:  yes
  }

  dimension: admin_id {
    type: number
    sql: ${TABLE}.admin_id ;;
    hidden:  yes
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    hidden:  yes
  }

  dimension: created_week_sun_start{
    type: date
    convert_tz: no
    sql: case
    when ${created_day_of_week} = 'Sunday' then ${created_date}
    when ${created_day_of_week} = 'Monday' THEN dateadd(d, -1, ${created_date})
    when ${created_day_of_week} = 'Tuesday' THEN dateadd(d, -2, ${created_date})
    when ${created_day_of_week} = 'Wednesday' THEN dateadd(d, -3, ${created_date})
    when ${created_day_of_week} = 'Thursday' THEN dateadd(d, -4, ${created_date})
    when ${created_day_of_week} = 'Friday' THEN dateadd(d, -5, ${created_date})
    when ${created_day_of_week} = 'Saturday' THEN dateadd(d, -6, ${created_date})
    END;;

  }


  dimension: credit_transaction_group_id {
    type: number
    sql: ${TABLE}.credit_transaction_group_id ;;
    hidden:  yes
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
    hidden: yes
  }

  dimension: cx_reason {
    type: string
    sql: ${TABLE}.cx_reason ;;
  }

  dimension: credit_reason_bucket {
   case:{
    when:{
      sql: ${cx_reason} = 'Billing' OR ${cx_reason} = 'Address'  ;;
      label: "Account Issue"
    }
    when:{
      sql: ${cx_reason} = 'Food poisoning' ;;
      label: "Allergen/Dietary Issues"
    }
    when:{
      sql: ${cx_reason} = 'Timeframe Confusion' OR ${cx_reason} = 'User Error' OR ${cx_reason} = 'Exceptional Circumstance (Weather/Life Event)' ;;
      label: "Cancel or Skip After Deadline"
    }
    when:{
      sql: ${cx_reason} = 'Expired Coupon' OR ${cx_reason} = 'Employee Coupon' OR ${cx_reason} = 'Gift code/voucher Invalid' OR ${cx_reason} = 'Gift Refunded (Retroactive)' OR ${cx_reason} = 'Referral Program Issue' OR ${cx_reason} = 'First Time Subscriber Code Error' ;;
      label: "Coupon Not Applied"
    }
    when:{
      sql: ${cx_reason} = 'Social Media' OR ${cx_reason} = 'Surprise & Delight' OR ${cx_reason} = 'Sweepstakes Winner' ;;
      label: "Customer Appreciation"
    }
    when:{
      sql: ${cx_reason} = 'Dissatisfied with service (escalation)' OR ${cx_reason} = 'Unsatisfied with order (escalation)' OR ${cx_reason} = 'Mass credit' ;;
      label: "Cx Issue"
    }
    when:{
      sql: ${cx_reason} = 'Missing Ingredient - 1' OR ${cx_reason} = 'Missing Ingredient - 2' Or ${cx_reason} = 'Missing Ingredient - 3' OR ${cx_reason} = 'Missing Meal' OR ${cx_reason} = 'Missing Recipe Card' ;;
      label: "Missing Item"
    }
    when:{
      sql: ${cx_reason} = 'Arrived Warm' OR ${cx_reason} = 'Arrived after Dinner' OR ${cx_reason} = 'Arrived Late 1' OR ${cx_reason} = 'Arrived Late 2+' OR ${cx_reason} = 'Didn''t arrive' ;;
      label: "Delivery"
    }
    when:{
      sql: ${cx_reason} = 'Damaged Produce' OR ${cx_reason} = 'Damaged non-produce Ingredient' OR ${cx_reason} = 'Incorrect Measurement' ;;
      label: "Ingredient Quality"
    }
    when:{
      sql: ${cx_reason} = 'Broken or Leaked Packaging' OR ${cx_reason} = 'Damaged (exterior)' OR ${cx_reason} = 'Damaged (interior - liner/gel packs)' OR  ${cx_reason} = 'Damaged (exterior)' ;;
      label: "Packaging Quality"
    }
    else: "Other"
  }
    hidden:  yes
}

  dimension: credit_reason_bucket_legacy_2017 {
    case:{
      when:{
        sql: ${description} = 'Delivery issue' ;;
        label: "Delivery"
      }
      when:{
        sql: ${description} = 'Damaged Ingredient(s)' ;;
        label: "Ingredient Damage"
      }
      when:{
        sql: ${description} = 'Coupon not applied' ;;
        label: "Coupon"
      }
      when:{
        sql: ${description} = 'Damaged (Interior)' ;;
        label: "Interior Damage"
      }
      when:{
        sql: ${description} = 'Damaged (Exterior)' ;;
        label: "Exterior Damage"
      }
      when:{
        sql: ${description} = 'Unwanted box' ;;
        label: "Unwanted Box"
      }
      when:{
        sql: ${description} = 'Missing item(s)' ;;
        label: "Missing Item"
      }
      when:{
        sql: ${description} = 'Gift' ;;
        label: "Gift"
      }
      else: "Other"
      }
    hidden:  yes
      }

  dimension: category {
    type: string
    sql: case
          when ${TABLE}."cx_reason" = 'Arrived After Dinner' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Arrived Late 1+ Days' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Arrived Warm' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Damaged Box' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Delivery Instructions Not Followed' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Didn''t Arrive' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Tape Lifted/Open Box' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Tracking Number Issue' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Container Broken' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Broken Gel Pack' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Didn''t arrive' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Arrived Late 1' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Arrived Late 2+' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Broken or Leaked Packaging' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Damaged (exterior)' then 'Shipping'
          when ${TABLE}."cx_reason" = 'Damaged (interior - liner/gel packs)' then 'Shipping'

          when ${TABLE}."cx_reason" = 'Damaged' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Food Poisoning' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Spoiled' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Overripe' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Underripe' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Damaged Garlic' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Damaged non-produce Ingredient' then 'Ingredient'
          when ${TABLE}."cx_reason" = 'Damaged Produce' then 'Ingredient'

          when ${TABLE}."cx_reason" = 'Arrived Passed Expiration Date' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Incorrect Measurement' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Ingredient' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Meal' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Snack' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Booklet' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Garlic' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Foreign Object' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Ingredient - 1' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Ingredient - 2' then 'Fulfillment'
          when ${TABLE}."cx_reason" = 'Missing Ingredient - 3' then 'Fulfillment'

          when ${TABLE}."cx_reason" is null then null

          else 'Other'
          end;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
    hidden:  yes
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
    hidden:  yes
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
    hidden:  yes
  }

  measure: total_credit_amount {
    type: sum
    sql: ${amount} ;;
    drill_fields: [id, source_id, created_date, amount, credit_reason_bucket, cx_reason]
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [id, source_id, created_date, amount, credit_reason_bucket, cx_reason]
  }


  dimension: CX_rep_name {
    case: {

       when: {
        sql: ${TABLE}.admin_id = '606964'  ;;
        label: "de Bourmont"
      }

      when: {
        sql: ${TABLE}.admin_id = '606965'  ;;
        label: "Gattoni"
      }

      when: {
        sql: ${TABLE}.admin_id = '581336'  ;;
        label: "Maville"
      }


      when: {
        sql: ${TABLE}.admin_id = '411741'  ;;
        label: "Root"
      }

      when: {
        sql: ${TABLE}.admin_id = '454797'  ;;
        label: "Spencer"
      }

      when: {
        sql: ${TABLE}.admin_id = '401679'  ;;
        label: "Tarquinio"
      }

      when: {
        sql: ${TABLE}.admin_id = '591647'  ;;
        label: "Yamaguchi"
      }

      when: {
        sql: ${TABLE}.admin_id = '463607'  ;;
        label: "Yono"
      }

      when: {
        sql: ${TABLE}.admin_id = '11200'  ;;
        label: "Deanna"
      }


      when: {
        sql: ${TABLE}.admin_id = '650495'  ;;
        label: "Orcutt"
      }

      when: {
        sql: ${TABLE}.admin_id = '726381'  ;;
        label: "Paschal"
      }

      when: {
        sql: ${TABLE}.admin_id = '731691'  ;;
        label: "Rees"
      }

      when: {
        sql: ${TABLE}.admin_id = '726666'  ;;
        label: "Reis"
      }

      when: {
        sql: ${TABLE}.admin_id = '812935'  ;;
        label: "Rios"
      }

      when: {
        sql: ${TABLE}.admin_id = '1147732'  ;;
        label: "Cabrera"
      }

      when: {
        sql: ${TABLE}.admin_id = '1133372'  ;;
        label: "Vespa"
      }

      when: {
        sql: ${TABLE}.admin_id = '1153590'  ;;
        label: "Kaneb"
      }

      when: {
        sql: ${TABLE}.admin_id = '1148155'  ;;
        label: "Ellison"
      }

      when: {
        sql: ${TABLE}.admin_id = '1070325'  ;;
        label: "Velazquez"
      }

      when: {
        sql: ${TABLE}.admin_id = '1070382'  ;;
        label: "Niezgoda"
      }

    }
    hidden:  yes
  }

    dimension: customer_issue_id {
      type: number
      sql: ${TABLE}.customer_issue_id ;;
      hidden:  yes
    }

    measure: sum_cx_credits {
      type: sum
      sql:(case when ${action}=3 then ${amount} else null end);;
      value_format_name: usd
    }


}
