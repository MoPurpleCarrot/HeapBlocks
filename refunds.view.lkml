view: refunds {
  sql_table_name: heroku_postgres.refunds ;;

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

  dimension: admin_id {
    type: number
    sql: ${TABLE}.admin_id ;;
  }

  dimension: admin_reason {
    type: string
    sql: ${TABLE}.admin_reason ;;
  }

  dimension: cx_reason {
    type: string
    sql: ${TABLE}.cx_reason ;;
  }

  dimension: refund_reason_bucket {
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
  }


  dimension: refund_reason_bucket_legacy_2017 {
    case:{
      when:{
        sql: ${admin_reason} = 'Delivery issue' ;;
        label: "Delivery"
      }
      when:{
        sql: ${admin_reason} = 'Unwanted box' ;;
        label: "Unwanted Box"
      }
      when:{
        sql: ${admin_reason} = 'Damaged Ingredient(s)' ;;
        label: "Ingredient Damage"
      }
      when:{
        sql: ${admin_reason} = 'Coupon not applied' ;;
        label: "Coupon"
      }
      when:{
        sql: ${admin_reason} = 'Missing item(s)' ;;
        label: "Missing Item"
      }
      when:{
        sql: ${admin_reason} = 'Damaged (Interior)' ;;
        label: "Interior Damage"
      }
      when:{
        sql: ${admin_reason} = 'Damaged (Exterior)' ;;
        label: "Exterior Damage"
      }
      when:{
        sql: ${admin_reason} = 'Gift' ;;
        label: "Gift"
      }
      else: "Other"
    }}


  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_refund_amount {
    type: sum
    value_format_name: usd
    drill_fields:  [id, refundable_id, created_date, amount, refund_reason_bucket, refund_reason_bucket_legacy_2017, cx_reason]
    sql: ${amount} ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: refundable_id {
    type: number
    sql: ${TABLE}.refundable_id ;;
  }

  dimension: refundable_type {
    type: string
    sql: ${TABLE}.refundable_type ;;
  }

  dimension: stripe_reason {
    type: string
    sql: ${TABLE}.stripe_reason ;;
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

  measure: count {
    type: count
    drill_fields: [id]
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
    }
}
