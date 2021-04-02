view: segment_recipe {
  derived_table: {
    sql: select distinct u.id user_id, segment_membership, primary_reason, eating_habits,question_1_answer overall_rating, question_2_answer flavor_rating
      ,p.title recipe, i.name ingredient
      from heroku_postgres.users u
      left join heroku_postgres.welcome_surveys ws on ws.user_id=u.id
      left join heroku_postgres.recipe_feedback_surveys rfs on rfs.user_id=u.id
      left join heroku_postgres.recipe_feedbacks rf on rf.recipe_feedback_survey_id=rfs.id
      left join heroku_postgres.skus s on s.id=rf.sku_id
      left join heroku_postgres.products p on p.id=s.product_id
      left join heroku_postgres.ingredients i on i.sku_id=s.id
      where rfs.completed_at >= '2020-12-01'
       ;;
  }



  dimension: user_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: segment_membership {
    type: string
    sql: ${TABLE}.segment_membership ;;
  }

  dimension: primary_reason {
    type: string
    sql: ${TABLE}.primary_reason ;;
  }

  dimension: eating_habits {
    type: string
    sql: ${TABLE}.eating_habits ;;
  }

  dimension: overall_rating {
    type: number
    sql: ${TABLE}.overall_rating ;;
  }

  dimension: flavor_rating {
    type: number
    sql: ${TABLE}.flavor_rating ;;
  }

  dimension: recipe {
    type: string
    sql: ${TABLE}.recipe ;;
  }

  dimension: ingredient {
    type: string
    sql: ${TABLE}.ingredient ;;
  }

  measure: count_distinct_user {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: average_overall {
    type: average
    value_format: "0.0"
    sql: ${overall_rating}*1.0 ;;
  }

  measure: average_flavor {
    type: average
    value_format: "0.0"
    sql: ${flavor_rating}*1.0 ;;
  }

}
