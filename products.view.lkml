view: products {
  sql_table_name: demo_db.products ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }
  parameter: p {}
  dimension: parameter_taker {
    sql: {% parameter p %} ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }

  dimension: dummy_three {
    label: " "
    case: {


      when: {
        label: "ACORN Skus"
        sql: 1=1 ;;
      }
      when: {
        label: "Bench Skus"
        sql: 1=1 ;;
      }

    }
  }

  measure: ACORN_skus {
    type: sum
    filters: [brand: "ACORN"]
    sql: ${sku} ;;
  }
  measure: ACORN_ids {
    type: count_distinct
    filters: [brand: "ACORN"]
    sql: ${id} ;;
  }
  measure: Bench_skus {
    type: sum
    filters: [brand: "Bench"]
    sql: ${sku} ;;
  }

  measure: Bench_ids {
    type: count_distinct
    filters: [brand: "Bench"]
    sql: ${id} ;;
  }
}
