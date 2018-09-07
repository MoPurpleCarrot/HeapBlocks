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
WHERE author__type = 'admin'
GROUP BY _sdc_source_key_id ) c

ON a._sdc_source_key_id = c.secondary_sourcekey
ORDER BY secondstofirstmessage ASC ;;

}


  measure: avg_seconds_to_first_message {
    type: average
    sql: ${TABLE}.first_message ;;
  }


}
