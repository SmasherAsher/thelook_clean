connection: "thelook"

# include all the views
include: "*.view"
include: "*.dashboard"

datagroup: thelook_clean_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: thelook_clean_default_datagroup

# access_grant: is_sam {
#   user_attribute: id
#   allowed_values: ["306", "927"]
# }

explore: derived_base { hidden: yes}
explore: derived_extended { hidden: yes}

explore: order_items {
  hidden: yes
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }


  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

}

explore: sam_order_items {
  extends: [order_items]
  view_name: order_items
 # required_access_grants: [is_sam]
}
