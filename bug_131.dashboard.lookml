- dashboard: bug_131_
  title: 'bug 131 '
  layout: static
  tile_size: 100
  elements:
  - name: '1'
    title: some columns
    model: thelook_clean
    explore: order_items
    type: table
    fields: [order_items.returned_date, order_items.returned_month, order_items.returned_quarter,
      order_items.returned_time, order_items.returned_week]
    sorts: [order_items.returned_date desc]
    limit: 5
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    height: 1
    width: 12
    top: 0
    left: 0
  - name: '2'
    title: some columns
    model: thelook_clean
    explore: order_items
    type: table
    fields: [order_items.returned_date, order_items.returned_month, order_items.returned_quarter,
      order_items.returned_time, order_items.returned_week]
    sorts: [order_items.returned_date desc]
    limit: 5
    query_timezone: America/Los_Angeles
    row: 0
    col: 0
    height: 1
    width: 12
    top: 0
    left: 0
