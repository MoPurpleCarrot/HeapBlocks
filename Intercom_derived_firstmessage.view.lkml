view: intercom_derived_firstmessage {
  derived_table: {
    sql:
    SELECT _sdc_source_key_id,
a.author__type,
convo.created_at AS created_at,convo.id,c.first_message, DATEDIFF(second,convo.created_at,c.first_message) AS secondstofirstmessage FROM intercom_full_integration.conversations__conversation_parts a
  LEFT JOIN intercom_full_integration.conversations convo ON convo.id = _sdc_source_key_id
LEFT JOIN

(


SELECT _sdc_source_key_id AS secondary_sourcekey, MIN(created_at) as first_message
FROM intercom_full_integration.conversations__conversation_parts b
WHERE author__type = 'admin'AND
WHERE part_type = 'comment'
GROUP BY _sdc_source_key_id ) c

ON a._sdc_source_key_id = c.secondary_sourcekey
ORDER BY secondstofirstmessage ASC ;;

}


  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }



  dimension: _sdc_source_key_id {
    type: string
    sql: ${TABLE}._sdc_source_key_id ;;
  }


  dimension: author__type {
    type: string
    sql: ${TABLE}.author__type ;;
  }


  dimension_group: created_at {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      hour_of_day,
      date,
      week,
      day_of_week_index,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: first_message {
    type: date_time
    sql:  ${TABLE}.first_message ;;
  }

  dimension:  seconds_to_first_message {
    type:  number
    sql:${TABLE}.secondstofirstmessage ;;
  }

  measure: avg_seconds_to_first_message {
    type: average
    sql: ${seconds_to_first_message} ;;
  }



}
