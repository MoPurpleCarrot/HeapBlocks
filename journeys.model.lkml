connection: "redshift"

include: "path_analyzer.view.lkml"

explore: path_analyzer {
}

explore: event_counts {
  hidden: yes
}
