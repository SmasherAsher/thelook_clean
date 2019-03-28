- dashboard: bug_131_
  title: 'bug 131 '
  layout: newspaper
  elements:
  - name: 30+ columns
    title: 30+ columns
    model: thelook_clean
    explore: order_items
    type: table
    fields: [order_items.returned_date, order_items.returned_month, order_items.returned_quarter,
      order_items.returned_time, order_items.returned_week, order_items.returned_year,
      orders.created_date, orders.created_month, orders.created_quarter, orders.created_time,
      orders.created_week, orders.created_year, users.created_date, users.created_month,
      users.created_quarter, users.created_time, users.created_week, users.created_year,
      inventory_items.created_date, inventory_items.created_month, inventory_items.created_quarter,
      inventory_items.created_time, inventory_items.created_week, inventory_items.created_year,
      inventory_items.sold_date, inventory_items.sold_month, inventory_items.sold_quarter,
      inventory_items.sold_time, inventory_items.sold_week, inventory_items.sold_year]
    sorts: [order_items.returned_date desc]
    limit: 5
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    width: 24
    height: 6
