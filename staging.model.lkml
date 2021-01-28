connection: "staging"
week_start_day: wednesday

# include all views in this project
include: "*.view"

# include all dashboards in this project
# include: "*.dashboard"

datagroup: hourly_sync  {
  sql_trigger: SELECT DATE_PART('hour', getdate()) ;;
}

datagroup:batch_date_update {
  sql_trigger: SELECT max(_sdc_batch_date) FROM zendesk.tickets__custom_fields ;;
}

explore: staging_users {}
