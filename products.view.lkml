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
    html: <p> Here is the </p>
    {{ value | replace: "106Shades", '<a href="https://google.com"> Link </a>' }} ;;
  }

  dimension: brand_image {
    type: string
    sql: ${brand} ;;
    html: <img src="https://feeling-lucky-looker.herokuapp.com/api.php?q={{value}}" ;;
  }


  parameter: p {type: unquoted}

  dimension: parameter_taker {
    sql: "{% parameter p %}" ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: is_sweaters {
    type: yesno
    sql: ${category} = 'Sweaters' ;;
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
