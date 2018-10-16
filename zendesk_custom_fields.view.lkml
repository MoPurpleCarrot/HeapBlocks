view: zendesk_custom_fields {
  derived_table: {
    sql: select ticket_id._sdc_source_key_id, ship_date, shipping_provider, shipping_zone, product_line,
        packing_issue_type_1, packing_issue_detail_1, packing_issue_type_2, packing_issue_detail_2, packing_issue_type_3, packing_issue_detail_3,
        ingredient_issue_type_1, ingredient_issue_detail_1, ingredient_issue_type_2, ingredient_issue_detail_2, ingredient_issue_type_3, ingredient_issue_detail_3,
        shipping_issue_type_1, shipping_issue_detail_1, shipping_issue_type_2, shipping_issue_detail_2,
        ontrac_tracking_number, ontrac_claim_reason, lasership_tracking_number, lasership_claim_reason, fedex_tracking_number, fedex_claim_reason, fedex_claim_damage_detail,
        kitting_partner from

        (select distinct _sdc_source_key_id FROM zendesk.tickets__custom_fields) ticket_id

        left join
        (SELECT _sdc_source_key_id, _sdc_batched_at as created_date
        FROM zendesk.tickets__custom_fields) created_date
        on ticket_id._sdc_source_key_id = created_date._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ship_date
        FROM zendesk.tickets__custom_fields
        WHERE id = 24232336) ship_date
        on ticket_id._sdc_source_key_id = ship_date._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as shipping_provider
        FROM zendesk.tickets__custom_fields
        WHERE id = 24567223) shipping_provider
        on ticket_id._sdc_source_key_id = shipping_provider._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as shipping_zone
        FROM zendesk.tickets__custom_fields
        WHERE id = 24160883) shipping_zone
        on ticket_id._sdc_source_key_id = shipping_zone._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as product_line
        FROM zendesk.tickets__custom_fields
        WHERE id = 24775883) product_line
        on ticket_id._sdc_source_key_id = product_line._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as packing_issue_type_1
        FROM zendesk.tickets__custom_fields
        WHERE id = 24248833) packing_issue_type_1
        on ticket_id._sdc_source_key_id = packing_issue_type_1._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as packing_issue_detail_1
        FROM zendesk.tickets__custom_fields
        WHERE id = 24866783) packing_issue_detail_1
        on ticket_id._sdc_source_key_id = packing_issue_detail_1._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as packing_issue_type_2
        FROM zendesk.tickets__custom_fields
        WHERE id = 25089926) packing_issue_type_2
        on ticket_id._sdc_source_key_id = packing_issue_type_2._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as packing_issue_detail_2
        FROM zendesk.tickets__custom_fields
        WHERE id = 25025743) packing_issue_detail_2
        on ticket_id._sdc_source_key_id = packing_issue_detail_2._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as packing_issue_type_3
        FROM zendesk.tickets__custom_fields
        WHERE id = 25025783) packing_issue_type_3
        on ticket_id._sdc_source_key_id = packing_issue_type_3._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as packing_issue_detail_3
        FROM zendesk.tickets__custom_fields
        WHERE id = 25089946) packing_issue_detail_3
        on ticket_id._sdc_source_key_id = packing_issue_detail_3._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ingredient_issue_type_1
        FROM zendesk.tickets__custom_fields
        WHERE id = 24898906) ingredient_issue_type_1
        on ticket_id._sdc_source_key_id = ingredient_issue_type_1._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ingredient_issue_detail_1
        FROM zendesk.tickets__custom_fields
        WHERE id = 24837843) ingredient_issue_detail_1
        on ticket_id._sdc_source_key_id = ingredient_issue_detail_1._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ingredient_issue_type_2
        FROM zendesk.tickets__custom_fields
        WHERE id = 25025703) ingredient_issue_type_2
        on ticket_id._sdc_source_key_id = ingredient_issue_type_2._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ingredient_issue_detail_2
        FROM zendesk.tickets__custom_fields
        WHERE id = 25089746) ingredient_issue_detail_2
        on ticket_id._sdc_source_key_id = ingredient_issue_detail_2._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ingredient_issue_type_3
        FROM zendesk.tickets__custom_fields
        WHERE id = 25089906) ingredient_issue_type_3
        on ticket_id._sdc_source_key_id = ingredient_issue_type_3._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ingredient_issue_detail_3
        FROM zendesk.tickets__custom_fields
        WHERE id = 25025723) ingredient_issue_detail_3
        on ticket_id._sdc_source_key_id = ingredient_issue_detail_3._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as shipping_issue_type_1
        FROM zendesk.tickets__custom_fields
        WHERE id = 24899106) shipping_issue_type_1
        on ticket_id._sdc_source_key_id = shipping_issue_type_1._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as shipping_issue_detail_1
        FROM zendesk.tickets__custom_fields
        WHERE id = 24866763) shipping_issue_detail_1
        on ticket_id._sdc_source_key_id = shipping_issue_detail_1._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as shipping_issue_type_2
        FROM zendesk.tickets__custom_fields
        WHERE id = 25089966) shipping_issue_type_2
        on ticket_id._sdc_source_key_id = shipping_issue_type_2._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as shipping_issue_detail_2
        FROM zendesk.tickets__custom_fields
        WHERE id = 25089986) shipping_issue_detail_2
        on ticket_id._sdc_source_key_id = shipping_issue_detail_2._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ontrac_tracking_number
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000106443) ontrac_tracking_number
        on ticket_id._sdc_source_key_id = ontrac_tracking_number._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as ontrac_claim_reason
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000105846) ontrac_claim_reason
        on ticket_id._sdc_source_key_id = ontrac_claim_reason._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as lasership_tracking_number
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000093506) lasership_tracking_number
        on ticket_id._sdc_source_key_id = lasership_tracking_number._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as lasership_claim_reason
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000093546) lasership_claim_reason
        on ticket_id._sdc_source_key_id = lasership_claim_reason._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as fedex_tracking_number
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000107166) fedex_tracking_number
        on ticket_id._sdc_source_key_id = fedex_tracking_number._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as fedex_claim_reason
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000107363) fedex_claim_reason
        on ticket_id._sdc_source_key_id = fedex_claim_reason._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as fedex_claim_damage_detail
        FROM zendesk.tickets__custom_fields
        WHERE id = 360000107383) fedex_claim_damage_detail
        on ticket_id._sdc_source_key_id = fedex_claim_damage_detail._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as kitting_partner
        FROM zendesk.tickets__custom_fields
        WHERE id = 24160883) kitting_partner
        on ticket_id._sdc_source_key_id = kitting_partner._sdc_source_key_id

        left join
        (SELECT _sdc_source_key_id, value as user_experience
        FROM zendesk.tickets__custom_fields
        WHERE id = 24249023) user_experience
        on ticket_id._sdc_source_key_id = user_experience._sdc_source_key_id
               ;;

    # persist_with: batch_date_update

    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: _sdc_source_key_id {
      type: number
      sql: ${TABLE}._sdc_source_key_id ;;
    }

    dimension: ship_date {
      type: string
      sql: ${TABLE}.ship_date ;;
    }

    dimension: shipping_provider {
      type: string
      sql: ${TABLE}.shipping_provider ;;
    }

    dimension: shipping_zone {
      type: string
      sql: ${TABLE}.shipping_zone ;;
    }

    dimension: product_line {
      type: string
      sql: ${TABLE}.product_line ;;
    }

    dimension: packing_issue_type_1 {
      type: string
      sql: ${TABLE}.packing_issue_type_1 ;;
    }

    dimension: packing_issue_detail_1 {
      type: string
      sql: ${TABLE}.packing_issue_detail_1 ;;
    }

    dimension: packing_issue_type_2 {
      type: string
      sql: trim('2' from ${TABLE}.packing_issue_type_2)  ;;
    }

    dimension: packing_issue_detail_2 {
      type: string
      sql: ${TABLE}.packing_issue_detail_2 ;;
    }

    dimension: packing_issue_type_3 {
      type: string
      sql: trim('3' from ${TABLE}.packing_issue_type_3)  ;;
    }

    dimension: packing_issue_detail_3 {
      type: string
      sql: ${TABLE}.packing_issue_detail_3 ;;
    }

    dimension: ingredient_issue_type_1 {
      type: string
      sql: ${TABLE}.ingredient_issue_type_1 ;;
    }

    dimension: ingredient_issue_detail_1 {
      type: string
      sql: ${TABLE}.ingredient_issue_detail_1 ;;
    }

    dimension: ingredient_issue_type_2 {
      type: string
      sql: trim('2' from ${TABLE}.ingredient_issue_type_2)  ;;
    }

    dimension: ingredient_issue_detail_2 {
      type: string
      sql: ${TABLE}.ingredient_issue_detail_2 ;;
    }

    dimension: ingredient_issue_type_3 {
      type: string
      sql: trim('3' from ${TABLE}.ingredient_issue_type_3) ;;
    }

    dimension: ingredient_issue_detail_3 {
      type: string
      sql: ${TABLE}.ingredient_issue_detail_3 ;;
    }

    dimension: shipping_issue_type_1 {
      type: string
      sql: ${TABLE}.shipping_issue_type_1 ;;
    }

    dimension: shipping_issue_detail_1 {
      type: string
      sql: ${TABLE}.shipping_issue_detail_1 ;;
    }

    dimension: shipping_issue_type_2 {
      type: string
      sql: trim('2' from ${TABLE}.shipping_issue_type_2)  ;;
    }

    dimension: shipping_issue_detail_2 {
      type: string
      sql: ${TABLE}.shipping_issue_detail_2 ;;
    }

  dimension: ontrac_tracking_number {
    type: string
    sql: ${TABLE}.ontrac_tracking_number ;;
  }

  dimension: ontrac_claim_reason {
    type: string
    sql: ${TABLE}.ontrac_claim_reason ;;
  }

  dimension: lasership_tracking_number {
    type: string
    sql: ${TABLE}.lasership_tracking_number ;;
  }

  dimension: lasership_claim_reason {
    type: string
    sql: ${TABLE}.lasership_claim_reason ;;
  }

  dimension: fedex_tracking_number {
    type: string
    sql: ${TABLE}.fedex_tracking_number ;;
  }

  dimension: fedex_claim_reason {
    type: string
    sql: ${TABLE}.fedex_claim_reason ;;
  }

  dimension: fedex_claim_damage_detail {
    type: string
    sql: ${TABLE}.fedex_claim_damage_detail ;;
  }

    set: detail {
      fields: [
        _sdc_source_key_id,
        ship_date,
        shipping_provider,
        shipping_zone,
        product_line,
        packing_issue_type_1,
        packing_issue_detail_1,
        packing_issue_type_2,
        packing_issue_detail_2,
        packing_issue_type_3,
        packing_issue_detail_3,
        ingredient_issue_type_1,
        ingredient_issue_detail_1,
        ingredient_issue_type_2,
        ingredient_issue_detail_2,
        ingredient_issue_type_3,
        ingredient_issue_detail_3,
        shipping_issue_type_1,
        shipping_issue_detail_1,
        shipping_issue_type_2,
        shipping_issue_detail_2
      ]
    }
  }
