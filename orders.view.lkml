view: orders {
  sql_table_name: demo_db.orders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
 parameter: pivot_selector {
   type: string
  allowed_value: {label:"Brand" value:"Brand"}
  allowed_value: {label:"Category" value:"Category"}
 }

dimension: pivot_acceptor {
  type: string
  label_from_parameter: pivot_selector
  sql: CASE WHEN {% parameter pivot_selector %} = 'Brand' THEN ${products.brand}
  ELSE ${products.category}
  END;;
}
  dimension_group: created {
    type: time

    sql: ${TABLE}.created_at ;;
  }

  dimension: future {
    type: date
    sql:DATE_ADD(${created_raw},INTERVAL 89 day) ;;
  }

  dimension_group: diff {
    type: duration
    sql_start: ${created_date} ;;
    sql_end: ${future} ;;
  }

  dimension: status {
    type: string
    view_label: "Orders"
    sql: ${TABLE}.status ;;
  }


  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    filters: {
      field: status
      value: "-'NULL'"
    }
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.first_name,
      users.last_name,
      users.id,
      hello_world.count,
      order_items.count
    ]
  }
}
