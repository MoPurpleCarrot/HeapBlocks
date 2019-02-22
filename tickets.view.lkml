view: tickets {
  sql_table_name: zendesk.tickets ;;

  dimension: via_source_from_ticket_id {
    type: number
    group_label: "Via"
    sql: ${TABLE}.via__source__from__ticket_id ;;
  }

  dimension_group: sdc_batched {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at ;;
    hidden: yes
  }

  dimension_group: sdc_received {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at ;;
    hidden: yes
  }

  dimension: sdc_sequence {
    type: number
    sql: ${TABLE}._sdc_sequence ;;
    hidden: yes
  }

  dimension: sdc_table_version {
    type: number
    sql: ${TABLE}._sdc_table_version ;;
    hidden: yes
  }

  dimension: allow_channelback {
    type: yesno
    sql: ${TABLE}.allow_channelback ;;
  }

  dimension: assignee_id {
    type: number
    sql: ${TABLE}.assignee_id ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at ;;
  }

  dimension: generated_timestamp {
    type: number
    sql: ${TABLE}.generated_timestamp ;;
    hidden: yes
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: has_incidents {
    type: yesno
    sql: ${TABLE}.has_incidents ;;
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;

    link: {
      label: "Lookup in ZenDesk"
      url: "https://thepurplecarrotxo.zendesk.com/agent/tickets/{{value}}"
      icon_url: "http://looker.com/favicon.ico"
    }
  }

  dimension: is_public {
    type: yesno
    sql: ${TABLE}.is_public ;;
  }

  dimension: organization_id {
    type: number
    sql: ${TABLE}.organization_id ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: raw_subject {
    type: string
    sql: ${TABLE}.raw_subject ;;
  }

  dimension: recipient {
    type: string
    sql: ${TABLE}.recipient ;;
  }

  dimension: requester_id {
    type: number
    sql: ${TABLE}.requester_id ;;
  }

  dimension: satisfaction_rating_comment {
    group_label: "Satisfaction"
    label: "Rating Comment"
    type: string
    sql: ${TABLE}.satisfaction_rating__comment ;;
  }

  dimension: satisfaction_rating_id {
    group_label: "Satisfaction"
    label: "Rating ID"
    hidden: yes
    type: number
    sql: ${TABLE}.satisfaction_rating__id ;;
  }

  dimension: satisfaction_rating_reason {
    group_label: "Satisfaction"
    label: "Rating Reason"
    type: string
    sql: ${TABLE}.satisfaction_rating__reason ;;
  }

  dimension: satisfaction_rating_reason_id {
    group_label: "Satisfaction"
    label: "Rating Reason ID"
    hidden: yes
    type: number
    sql: ${TABLE}.satisfaction_rating__reason_id ;;
  }

  dimension: satisfaction_rating_score {
    group_label: "Satisfaction"
    label: "Rating Score"
    type: string
    sql: ${TABLE}.satisfaction_rating__score ;;
  }

  dimension: is_bad_rating {
    type: yesno
    hidden: yes
    sql: ${satisfaction_rating_score} = 'bad' ;;
  }

  measure: count_bad_ratings {
    type: count

    filters: {
      field: is_bad_rating
      value: "yes"
    }

    drill_fields: [satisfaction_rating_reason, satisfaction_rating_comment, users.id, users.count]
  }

  dimension: is_good_rating {
    type: yesno
    hidden: yes
    sql: ${satisfaction_rating_score} = 'good' ;;
  }

  measure: count_good_ratings {
    type: count

    filters: {
      field: is_good_rating
      value: "yes"
    }
  }

  measure: ratio_good_to_bad_ratings {
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${count_good_ratings} / NULLIF((${count_bad_ratings} + ${count_good_ratings}),0) ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: submitter_id {
    type: number
    sql: ${TABLE}.submitter_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
    hidden: yes
  }

  dimension: via_channel {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__channel ;;
  }

  dimension: email {
    type: string
    hidden: yes
    sql: ${TABLE}.via__source__from__address ;;
  }

  dimension: via_source_from_facebook_id_account_id {
    group_label: "Via"
    type: number
    sql: ${TABLE}.via__source__from__facebook_id__account_id ;;
  }

  dimension: via_source_from_facebook_id_created_at {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__created_at ;;
  }

  dimension: via_source_from_facebook_id_deliverable_state {
    type: number
    group_label: "Via"
    value_format_name: id
    sql: ${TABLE}.via__source__from__facebook_id__deliverable_state ;;
  }

  dimension: via_source_from_facebook_id_id {
    type: number
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__id ;;
  }

  dimension: via_source_from_facebook_id_identity_type {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__identity_type ;;
  }

  dimension: via_source_from_facebook_id_is_verified {
    type: yesno
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__is_verified ;;
  }

  dimension: via_source_from_facebook_id_updated_at {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__updated_at ;;
  }

  dimension: via_source_from_facebook_id_user_id {
    type: number
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__user_id ;;
  }

  dimension: via_source_from_facebook_id_value {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__facebook_id__value ;;
  }

  dimension: via_source_from_formatted_phone {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__formatted_phone ;;
  }

  dimension: via_source_from_name {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__name ;;
  }

  dimension: via_source_from_phone {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__phone ;;
  }

  dimension: via_source_from_profile_url {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__profile_url ;;
  }

  dimension: via_source_from_subject {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__from__subject ;;
  }

  dimension: via_source_rel {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__rel ;;
  }

  dimension: via_source_to_address {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__to__address ;;
  }

  dimension: via_source_to_facebook_id {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__to__facebook_id ;;
  }

  dimension: via_source_to_formatted_phone {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__to__formatted_phone ;;
  }

  dimension: via_source_to_name {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__to__name ;;
  }

  dimension: via_source_to_phone {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__to__phone ;;
  }

  dimension: via_source_to_profile_url {
    type: string
    group_label: "Via"
    sql: ${TABLE}.via__source__to__profile_url ;;
  }

  measure: count {
    type: count
  }

  measure: count_distinct {
    type: count_distinct
    sql: ${id} ;;
  }

  dimension: Ticketdate_minus_canceldate{
    type: number
    sql: datediff( 'day', ${users.cancelled_date}, ${created_date}) ;;
  }



  dimension: cx_associate_name {
    case:{
      when:{
        sql: ${assignee_id} = 4837743386 ;;
        label: "Jessie Tarbox"
      }
      when:{
        sql: ${assignee_id} = 6907247066 ;;
        label: "Stephanie Grimaldi"
      }
      when:{
        sql: ${assignee_id} = 7061298586 ;;
        label: "Genesis Pepper"
      }
      when:{
        sql: ${assignee_id} = 7620123786 ;;
        label: "Taylor Newcomb"
      }
      when:{
        sql: ${assignee_id} = 360157798423 ;;
        label: "Sophia Tarquinio"
      }
      when:{
        sql: ${assignee_id} = 360230959363 ;;
        label: "Rachel Root"
      }
      when:{
        sql: ${assignee_id} = 360566443626 ;;
        label: "Amelia Yono"
      }
      when:{
        sql: ${assignee_id} = 360567551103 ;;
        label: "Sarah Spencer"
      }
      else: "Other"
    }
  }
}

#     drill_fields: detail*


#   sets:
#     detail:
#       - field_1
#       - field_2
#       - field_3
