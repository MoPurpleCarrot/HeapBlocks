view: customer_io_conversions_derived {
    derived_table: {
      sql: select timestamp, data__campaign_id, count(distinct event_id) total_conversions
           from customerio_email.data
           where metric = 'converted'
           group by timestamp, data__campaign_id
               ;;
      persist_for: "24 hours"
      indexes: ["data__campaign_id"]
      distribution_style:  all
    }


    dimension_group: _sdc_batched_at {
      type: time
      sql: ${TABLE}._sdc_batched_at ;;
      hidden: yes
    }

    dimension_group: _sdc_received_at {
      type: time
      sql: ${TABLE}._sdc_received_at ;;
      hidden: yes
    }

    dimension: _sdc_sequence {
      type: number
      sql: ${TABLE}._sdc_sequence ;;
      hidden: yes
    }

    dimension: _sdc_table_version {
      type: number
      sql: ${TABLE}._sdc_table_version ;;
      hidden: yes
    }

    dimension: message_id {
      type: number
      sql: ${TABLE}.data__action_id ;;
      primary_key: yes
    }

    dimension: campaign_id {
      type: number
      sql: ${TABLE}.data__campaign_id ;;
    }

    dimension: user_id {
      type: string
      sql: ${TABLE}.data__customer_id ;;
    }

    dimension: data__delivery_id {
      type: string
      sql: ${TABLE}.data__delivery_id ;;
      hidden: yes
    }

    dimension: data__journey_id {
      type: string
      sql: ${TABLE}.data__journey_id ;;
      hidden: yes
    }

    dimension: user_email {
      type: string
      sql: ${TABLE}.data__recipient ;;
    }

    dimension: event_id {
      type: string
      sql: ${TABLE}.event_id ;;
    }

    dimension: action {
      type: string
      sql: ${TABLE}.metric ;;
    }

    dimension: message_type {
      type: string
      sql: ${TABLE}.object_type ;;
    }

    dimension_group: timestamp {
      type: time
      timeframes: [time, date, week, month, raw]
      datatype: epoch
      sql: ${TABLE}.timestamp ;;
    }

    dimension: data__content_id {
      type: number
      sql: ${TABLE}.data__content_id ;;
      hidden: yes
    }

    dimension: broadcast_api_id {
      type: number
      sql: ${TABLE}.data__broadcast_id ;;
    }

    dimension: data__link_id {
      type: number
      sql: ${TABLE}.data__link_id ;;
      hidden: yes
    }

    dimension: broadcast_newsletter_id {
      type: number
      sql: ${TABLE}.data__newsletter_id ;;
    }

    dimension: data__href {
      type: string
      sql: ${TABLE}.data__href ;;
      hidden: yes
    }

    dimension: data__failure_message {
      type: string
      sql: ${TABLE}.data__failure_message ;;
      hidden: yes
    }

    dimension: subject {
      type: string
      sql: ${TABLE}.data__subject ;;
    }

    dimension: data__identifiers__id {
      type: string
      sql: ${TABLE}.data__identifiers__id ;;
      hidden: yes
    }

    measure: total_conversions {
      type: count_distinct
      sql: ${event_id} ;;
    }

  }
