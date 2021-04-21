view: facebook_ads_adcreative {
  sql_table_name: facebook_ads.adcreative
      ;;


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: _sdc_batched_at {
    type: time
    sql: ${TABLE}._sdc_batched_at ;;
  }

  dimension_group: _sdc_extracted_at {
    type: time
    sql: ${TABLE}._sdc_extracted_at ;;
  }

  dimension_group: _sdc_received_at {
    type: time
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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: actor_id {
    type: string
    sql: ${TABLE}.actor_id ;;
  }

  dimension: call_to_action_type {
    type: string
    sql: ${TABLE}.call_to_action_type ;;
  }

  dimension: effective_instagram_story_id {
    type: string
    sql: ${TABLE}.effective_instagram_story_id ;;
  }

  dimension: effective_object_story_id {
    type: string
    sql: ${TABLE}.effective_object_story_id ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: image_hash {
    type: string
    sql: ${TABLE}.image_hash ;;
  }

  dimension: image_url {
    type: string
    sql: ${TABLE}.image_url ;;
  }

  dimension: instagram_actor_id {
    type: string
    sql: ${TABLE}.instagram_actor_id ;;
  }

  dimension: instagram_permalink_url {
    type: string
    sql: ${TABLE}.instagram_permalink_url ;;
  }

  dimension: object_story_id {
    type: string
    sql: ${TABLE}.object_story_id ;;
  }

  dimension: object_story_spec__instagram_actor_id {
    type: string
    sql: ${TABLE}.object_story_spec__instagram_actor_id ;;
  }

  dimension: object_story_spec__link_data__attachment_style {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__attachment_style ;;
  }

  dimension: object_story_spec__link_data__call_to_action__type {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__call_to_action__type ;;
  }

  dimension: object_story_spec__link_data__call_to_action__value__link {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__call_to_action__value__link ;;
  }

  dimension: object_story_spec__link_data__caption {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__caption ;;
  }

  dimension: object_story_spec__link_data__image_hash {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__image_hash ;;
  }

  dimension: object_story_spec__link_data__multi_share_end_card {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__multi_share_end_card ;;
  }

  dimension: object_story_spec__link_data__multi_share_optimized {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__multi_share_optimized ;;
  }

  dimension: object_story_spec__link_data__name {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__name ;;
  }

  dimension: object_story_spec__page_id {
    type: string
    sql: ${TABLE}.object_story_spec__page_id ;;
  }

  dimension: object_story_spec__video_data__call_to_action__type {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__call_to_action__type ;;
  }

  dimension: object_story_spec__video_data__call_to_action__value__link_caption {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__call_to_action__value__link_caption ;;
  }

  dimension: object_story_spec__video_data__image_hash {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__image_hash ;;
  }

  dimension: object_story_spec__video_data__title {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__title ;;
  }

  dimension: object_story_spec__video_data__video_id {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__video_id ;;
  }

  dimension: object_type {
    type: string
    sql: ${TABLE}.object_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: thumbnail_url {
    type: string
    sql: ${TABLE}.thumbnail_url ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: url_tags {
    type: string
    sql: ${TABLE}.url_tags ;;
  }

  dimension: video_id {
    type: string
    sql: ${TABLE}.video_id ;;
  }

  dimension: object_story_spec__link_data__description {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__description ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: object_story_spec__link_data__message {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__message ;;
  }

  dimension: object_story_spec__template_data__multi_share_end_card {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__multi_share_end_card ;;
  }

  dimension: object_story_spec__template_data__message {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__message ;;
  }

  dimension: object_story_spec__template_data__link {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__link ;;
  }

  dimension: object_story_spec__photo_data__image_hash {
    type: string
    sql: ${TABLE}.object_story_spec__photo_data__image_hash ;;
  }

  dimension: product_set_id {
    type: string
    sql: ${TABLE}.product_set_id ;;
  }

  dimension: object_story_spec__template_data__name {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__name ;;
  }

  dimension: object_story_spec__template_data__call_to_action__type {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__call_to_action__type ;;
  }

  dimension: object_story_spec__template_data__description {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__description ;;
  }

  dimension: object_story_spec__video_data__call_to_action__value__link_format {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__call_to_action__value__link_format ;;
  }

  dimension: object_story_spec__template_data__caption {
    type: string
    sql: ${TABLE}.object_story_spec__template_data__caption ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: object_story_spec__video_data__message {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__message ;;
  }

  dimension: object_story_spec__video_data__link_description {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__link_description ;;
  }

  dimension: object_story_spec__video_data__call_to_action__value__lead_gen_form_id {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__call_to_action__value__lead_gen_form_id ;;
  }

  dimension: link_og_id {
    type: string
    sql: ${TABLE}.link_og_id ;;
  }

  dimension: link_url {
    type: string
    sql: ${TABLE}.link_url ;;
  }

  dimension: object_id {
    type: string
    sql: ${TABLE}.object_id ;;
  }

  dimension: object_story_spec__link_data__picture {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__picture ;;
  }

  dimension: object_story_spec__link_data__link {
    type: string
    sql: ${TABLE}.object_story_spec__link_data__link ;;
  }

  dimension: object_story_spec__photo_data__caption {
    type: string
    sql: ${TABLE}.object_story_spec__photo_data__caption ;;
  }

  dimension: object_story_spec__video_data__call_to_action__value__link {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__call_to_action__value__link ;;
  }

  dimension: object_story_spec__video_data__image_url {
    type: string
    sql: ${TABLE}.object_story_spec__video_data__image_url ;;
  }

  set: detail {
    fields: [
      _sdc_batched_at_time,
      _sdc_extracted_at_time,
      _sdc_received_at_time,
      _sdc_sequence,
      _sdc_table_version,
      account_id,
      actor_id,
      call_to_action_type,
      effective_instagram_story_id,
      effective_object_story_id,
      id,
      image_hash,
      image_url,
      instagram_actor_id,
      instagram_permalink_url,
      object_story_id,
      object_story_spec__instagram_actor_id,
      object_story_spec__link_data__attachment_style,
      object_story_spec__link_data__call_to_action__type,
      object_story_spec__link_data__call_to_action__value__link,
      object_story_spec__link_data__caption,
      object_story_spec__link_data__image_hash,
      object_story_spec__link_data__multi_share_end_card,
      object_story_spec__link_data__multi_share_optimized,
      object_story_spec__link_data__name,
      object_story_spec__page_id,
      object_story_spec__video_data__call_to_action__type,
      object_story_spec__video_data__call_to_action__value__link_caption,
      object_story_spec__video_data__image_hash,
      object_story_spec__video_data__title,
      object_story_spec__video_data__video_id,
      object_type,
      status,
      thumbnail_url,
      title,
      url_tags,
      video_id,
      object_story_spec__link_data__description,
      name,
      object_story_spec__link_data__message,
      object_story_spec__template_data__multi_share_end_card,
      object_story_spec__template_data__message,
      object_story_spec__template_data__link,
      object_story_spec__photo_data__image_hash,
      product_set_id,
      object_story_spec__template_data__name,
      object_story_spec__template_data__call_to_action__type,
      object_story_spec__template_data__description,
      object_story_spec__video_data__call_to_action__value__link_format,
      object_story_spec__template_data__caption,
      body,
      object_story_spec__video_data__message,
      object_story_spec__video_data__link_description,
      object_story_spec__video_data__call_to_action__value__lead_gen_form_id,
      link_og_id,
      link_url,
      object_id,
      object_story_spec__link_data__picture,
      object_story_spec__link_data__link,
      object_story_spec__photo_data__caption,
      object_story_spec__video_data__call_to_action__value__link,
      object_story_spec__video_data__image_url
    ]
  }
}
