connection: "bqtest-looker-idobrovols-connection"

# include all the views
include: "*.view"

datagroup: bq_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bq_test_default_datagroup
