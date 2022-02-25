view: users {
  sql_table_name: users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: me {
    type: string
    sql:  {{ _user_attributes['first_name'] | sql_quote }} ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_adams {
    label: "Count Adams (Rie Method)"
    type: sum
    sql: CASE WHEN ${email} LIKE '%adam.%' THEN 1 ELSE 0 END ;;
    drill_fields: [email]
  }

  measure: count_adams2 {
    label: "Count Adams (Sam Method)"
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: email
      value: "%adam.%"
    }
    drill_fields: [email]
  }

# measure: count_total {
#   type: count_distinct
#   sql: ${email}  ;;
# }


  measure: count_categories {
    label: "Count of categories for this email address"
    type: number
   # required_fields: [email]
    sql:  {% if users.email._is_selected %}
    (SELECT count(products.category) as c FROM order_items  AS order_items
LEFT JOIN demo_db.inventory_items  AS inventory_items ON order_items.inventory_item_id = inventory_items.id
LEFT JOIN orders  AS orders ON order_items.order_id = orders.id
LEFT JOIN products  AS products ON inventory_items.product_id = products.id
LEFT JOIN users  AS users ON orders.user_id = users.id
WHERE users.email = `users.email`
)
{% else %}
-1
{% endif %}
;;

html: {% if value == -1 %}
Please select users.email in order to use this field.
{% else %}
{{value}}
{% endif %}

;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      events.count,
      orders.count,
      user_data.count
    ]
  }
}