view: sales {
  sql_table_name: looker_public_ds_copy.sales ;;

  dimension_group: order_date {
    description: "The date of order"
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.date ;;
  }

  dimension: city {
    description: "The destination city of order"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: zip {
    description: "The destination zip code of order"
    type: zipcode
    sql:${TABLE}.zip_code ;;
  }

  dimension: sale_dollars {
    type:  number
    sql:${TABLE}.sale_dollars ;;
    value_format_name: usd
  }

  measure: total_sale_dollars  {
    description: "Total cost of order"
    type: sum
    sql: ${sale_dollars} ;;
  }

  measure: max_sale_dollars  {
    description: "Maximum cost of an order"
    type: max
    sql: ${sale_dollars} ;;
  }

  measure: avg_sale_dollars  {
    description: "Average cost of an order"
    type: average
    sql: ${sale_dollars} ;;
    value_format: "0.000,,\" M\""
  }

  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: sales {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
