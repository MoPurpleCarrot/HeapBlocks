- view: tickets
  sql_table_name: zendesk.tickets
  fields:

  - dimension: via__source__from__ticket_id
    type: number
    sql: ${TABLE}.via__source__from__ticket_id

  - dimension_group: _sdc_batched
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_batched_at

  - dimension_group: _sdc_received
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}._sdc_received_at

  - dimension: _sdc_sequence
    type: number
    sql: ${TABLE}._sdc_sequence

  - dimension: _sdc_table_version
    type: number
    sql: ${TABLE}._sdc_table_version

  - dimension: allow_channelback
    type: yesno
    sql: ${TABLE}.allow_channelback

  - dimension: assignee_id
    type: number
    sql: ${TABLE}.assignee_id

  - dimension: brand_id
    type: number
    sql: ${TABLE}.brand_id

  - dimension_group: created
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.created_at

  - dimension: generated_timestamp
    type: number
    sql: ${TABLE}.generated_timestamp

  - dimension: group_id
    type: number
    sql: ${TABLE}.group_id

  - dimension: has_incidents
    type: yesno
    sql: ${TABLE}.has_incidents

  - dimension: id
    type: number
    primary_key: true
    sql: ${TABLE}.id
    links:
    - label: ZenDesk
      url: https://thepurplecarrotxo.zendesk.com/agent/tickets/{{value}}
      icon_url: http://zendesk.com/favicon.ico


  - dimension: is_public
    type: yesno
    sql: ${TABLE}.is_public

  - dimension: organization_id
    type: number
    sql: ${TABLE}.organization_id

  - dimension: priority
    type: string
    sql: ${TABLE}.priority

  - dimension: raw_subject
    type: string
    sql: ${TABLE}.raw_subject

  - dimension: recipient
    type: string
    sql: ${TABLE}.recipient

  - dimension: requester_id
    type: number
    sql: ${TABLE}.requester_id

  - dimension: satisfaction_rating_comment
    type: string
    sql: ${TABLE}.satisfaction_rating__comment

  - dimension: satisfaction_rating_id
    type: number
    sql: ${TABLE}.satisfaction_rating__id

  - dimension: satisfaction_rating_reason
    type: string
    sql: ${TABLE}.satisfaction_rating__reason

  - dimension: satisfaction_rating_reason_id
    type: number
    sql: ${TABLE}.satisfaction_rating__reason_id

  - dimension: satisfaction_rating_score
    type: string
    sql: ${TABLE}.satisfaction_rating__score

  - dimension: is_bad_rating
    type: yesno
    hidden: true
    sql: ${satisfaction_rating_score} = 'bad'
    
  - measure: count_bad_ratings
    type: count
    filters:
      is_bad_rating: yes
    drill_fields: [satisfaction_rating_reason, satisfaction_rating_comment,users.id, users.count]
      
  - dimension: is_good_rating
    type: yesno
    hidden: true
    sql: ${satisfaction_rating_score} = 'good'
    
  - measure: count_good_ratings
    type: count
    filters:
      is_good_rating: yes
      
  - measure: ratio_good_to_bad_ratings
    type: number
    value_format_name: percent_2
    sql: 1.0 * ${count_good_ratings} / NULLIF((${count_bad_ratings} + ${count_good_ratings}),0)
  
  
  
  - dimension: status
    type: string
    sql: ${TABLE}.status

  - dimension: subject
    type: string
    sql: ${TABLE}.subject

  - dimension: submitter_id
    type: number
    sql: ${TABLE}.submitter_id

  - dimension: type
    type: string
    sql: ${TABLE}.type

  - dimension_group: updated
    type: time
    timeframes: [time, date, week, month]
    sql: ${TABLE}.updated_at

  - dimension: url
    type: string
    sql: ${TABLE}.url

  - dimension: via__channel
    type: string
    sql: ${TABLE}.via__channel

  - dimension: email
    type: string
    sql: ${TABLE}.via__source__from__address

  - dimension: via__source__from__facebook_id__account_id
    type: number
    sql: ${TABLE}.via__source__from__facebook_id__account_id

  - dimension: via__source__from__facebook_id__created_at
    type: string
    sql: ${TABLE}.via__source__from__facebook_id__created_at

  - dimension: via__source__from__facebook_id__deliverable_state
    type: number
    value_format_name: id
    sql: ${TABLE}.via__source__from__facebook_id__deliverable_state

  - dimension: via__source__from__facebook_id__id
    type: number
    sql: ${TABLE}.via__source__from__facebook_id__id

  - dimension: via__source__from__facebook_id__identity_type
    type: string
    sql: ${TABLE}.via__source__from__facebook_id__identity_type

  - dimension: via__source__from__facebook_id__is_verified
    type: yesno
    sql: ${TABLE}.via__source__from__facebook_id__is_verified

  - dimension: via__source__from__facebook_id__updated_at
    type: string
    sql: ${TABLE}.via__source__from__facebook_id__updated_at

  - dimension: via__source__from__facebook_id__user_id
    type: number
    sql: ${TABLE}.via__source__from__facebook_id__user_id

  - dimension: via__source__from__facebook_id__value
    type: string
    sql: ${TABLE}.via__source__from__facebook_id__value

  - dimension: via__source__from__formatted_phone
    type: string
    sql: ${TABLE}.via__source__from__formatted_phone

  - dimension: via__source__from__name
    type: string
    sql: ${TABLE}.via__source__from__name

  - dimension: via__source__from__phone
    type: string
    sql: ${TABLE}.via__source__from__phone

  - dimension: via__source__from__profile_url
    type: string
    sql: ${TABLE}.via__source__from__profile_url

  - dimension: via__source__from__subject
    type: string
    sql: ${TABLE}.via__source__from__subject

  - dimension: via__source__rel
    type: string
    sql: ${TABLE}.via__source__rel

  - dimension: via__source__to__address
    type: string
    sql: ${TABLE}.via__source__to__address

  - dimension: via__source__to__facebook_id
    type: string
    sql: ${TABLE}.via__source__to__facebook_id

  - dimension: via__source__to__formatted_phone
    type: string
    sql: ${TABLE}.via__source__to__formatted_phone

  - dimension: via__source__to__name
    type: string
    sql: ${TABLE}.via__source__to__name

  - dimension: via__source__to__phone
    type: string
    sql: ${TABLE}.via__source__to__phone

  - dimension: via__source__to__profile_url
    type: string
    sql: ${TABLE}.via__source__to__profile_url

  - measure: count
    type: count
#     drill_fields: detail*
    
    
#   sets:
#     detail:
#       - field_1
#       - field_2
#       - field_3
      
      


