view: gift_purchases {
  sql_table_name: heroku_postgres.gift_purchases ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: gift_id {
    type: number
    sql: ${TABLE}.gift_id ;;
  }

  dimension: plan {
    type: number
    sql: ${TABLE}.plan ;;
  }

  dimension: purchaser_email {
    type: string
    sql: ${TABLE}.purchaser_email ;;
  }

  dimension: purchaser_name {
    type: string
    sql: ${TABLE}.purchaser_name ;;
  }

  dimension: purchaser_id {
    type: string
    sql: ${TABLE}.purchaser_id ;;
  }


  dimension: recipient_email {
    type: string
    sql: ${TABLE}.recipient_email ;;
  }

  dimension: recipient_name {
    type: string
    sql: ${TABLE}.recipient_name ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: sending_method {
    type: string
    sql: ${TABLE}.sending_method ;;
  }

  # Sending Method Codes
    # email = 0 (seems like gift-based)
    # gift card = 1
    # no method = 2 (rarely used)
    # giveaway = 3 (SFM program)

  dimension: gift_program_bucket {
    case:{
      when:{
        sql: ${sending_method} = 0 OR ${sending_method} = 1 ;;
        label: "Gift"
      }
      when:{
        sql: ${sending_method} = 3 ;;
        label: "Send Free Meal"
      }
      else: "Other"
    }}

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  # Status Codes
    # 1 = purchased
    # 2 = credit_card_error
    # 3 = redeemed
    # 4 = partially_applied
    # 5 = fully_applied
    # 6 = refunded
    # 7 = Partially_refunded

  dimension: gift_status_bucket {
    case:{
      when:{
        sql: ${status} = 1 ;;
        label: "Purchased"
      }

      when:{
        sql: ${status} = 2 ;;
        label: "Credit Card Error"
      }

      when:{
        sql: ${status} = 3 ;;
        label: "Redeemed"
      }

      when:{
        sql: ${status} = 4 ;;
        label: "Partially Applied"
      }

      when:{
        sql: ${status} = 5 ;;
        label: "Fully Applied"
      }

      when:{
        sql: ${status} = 6 ;;
        label: "Refunded"
      }

      when:{
        sql: ${status} = 7 ;;
        label: "Partially Refunded"
      }

      else: "Other"
  }}

    dimension: is_date_of_SAB_error {
      type: yesno
      sql: date(${created_date}) = '2017-12-13';;
    }

  dimension: stripe_charge_id {
    type: string
    sql: ${TABLE}.stripe_charge_id ;;
  }

  dimension: order_of_invite {
    type: number
    sql: ${TABLE}.order_of_invite ;;
  }

  dimension: stripe_token {
    type: string
    sql: ${TABLE}.stripe_token ;;
  }

  dimension: token {
    type: string
    sql: ${TABLE}.token ;;
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

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  dimension: value_applied {
    type: number
    sql: ${TABLE}.value_applied ;;
  }

  dimension: value_refunded {
    type: number
    sql: ${TABLE}.value_refunded ;;
  }


    dimension: PC_customer{
      type: string
      case:{
        when:{
          sql:${purchaser_id} is NULL  ;;
          label: "No"
          }
          else: "Yes"
    }}

      dimension: gift_used{
        type: string
        case:{
          when:{
            sql:${value_applied} = 0  ;;
            label: "No"
          }
          else: "Yes"
        }}


  dimension_group: sent_to_recipient {
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
    sql: ${TABLE}.giveaway_sent_at ;;
  }

    dimension_group: expired_at {
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
      sql: ${TABLE}.expired_at ;;
    }

        dimension: sent{
          type: string
          case:{
            when:{
              sql:${sent_to_recipient_date} is null  ;;
              label: "No"
            }
            else: "Yes"
          }}

          dimension: sent_1_week{
            type: string
            case:{
              when:{
                sql:datediff(day,${created_date},${sent_to_recipient_date})<8  ;;
                label: "Yes"
              }
              else: "No"
            }}

            dimension: sent_2_weeks{
              type: string
              case:{
                when:{
                  sql:datediff(day,${created_date},${sent_to_recipient_date})<15  ;;
                  label: "Yes"
                }
                else: "No"
              }}


  measure: count {
    type: count
    drill_fields: [id, purchaser_name, recipient_name, gift_redemptions.count]
  }

  measure: total_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }

  measure: redeemed_unapplied_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    filters: {
      field: status
      value: "3"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }

  measure: send_free_meal_count {
    type:  count
    filters: {
      field: gift_program_bucket
      value: "Send Free Meal"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }

  measure: partially_applied_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    filters: {
      field: status
      value: "4"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }


  measure: fully_applied_gift_value {
    type:  sum
    sql: ${value} ;;
    value_format_name: usd
    filters: {
      field: status
      value: "5"
    }
    drill_fields: [id, purchaser_name, purchaser_email, recipient_name, recipient_email]
  }
}
