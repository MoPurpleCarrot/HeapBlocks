view: zendesk_custom_fields {
  derived_table: {
    sql: select ticket_id._sdc_source_key_id, ship_date, shipping_provider, shipping_zone, product_line, packing_issue_type_1, packing_issue_detail_1, packing_issue_type_2, packing_issue_detail_2, packing_issue_type_3, packing_issue_detail_3, ingredient_issue_type_1, ingredient_issue_detail_1, ingredient_issue_type_2, ingredient_issue_detail_2, ingredient_issue_type_3, ingredient_issue_detail_3, shipping_issue_type_1, shipping_issue_detail_1, shipping_issue_type_2, shipping_issue_detail_2, kitting_partner from

            (select distinct _sdc_source_key_id FROM zendesk.tickets__custom_fields) ticket_id

#             left join
#             (SELECT _sdc_source_key_id, _sdc_batched_at as created_date
#             FROM zendesk.tickets__custom_fields) created_date
#             on ticket_id._sdc_source_key_id = created_date._sdc_source_key_id
#
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
            (SELECT _sdc_source_key_id, value as kitting_partner
            FROM zendesk.tickets__custom_fields
            WHERE id = 24160883) kitting_partner
            on ticket_id._sdc_source_key_id = kitting_partner._sdc_source_key_id
             ;;

      datagroup_trigger: daily_sync
      distribution: "_sdc_batched_at"
      sortkeys: ["_sdc_batched_at"]

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
      sql: ${TABLE}.packing_issue_type_2 ;;
    }

    dimension: packing_issue_detail_2 {
      type: string
      sql: ${TABLE}.packing_issue_detail_2 ;;
    }

    dimension: packing_issue_type_3 {
      type: string
      sql: ${TABLE}.packing_issue_type_3 ;;
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
      sql: ${TABLE}.ingredient_issue_type_2 ;;
    }

    dimension: ingredient_issue_detail_2 {
      type: string
      sql: ${TABLE}.ingredient_issue_detail_2 ;;
    }

    dimension: ingredient_issue_type_3 {
      type: string
      sql: ${TABLE}.ingredient_issue_type_3 ;;
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
      sql: ${TABLE}.shipping_issue_type_2 ;;
    }

    dimension: shipping_issue_detail_2 {
      type: string
      sql: ${TABLE}.shipping_issue_detail_2 ;;
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
