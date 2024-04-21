SELECT 
  co.id, 
  co.name, 
  co.email, 
  COUNT(o.id), 
  MIN(o.created_at),
  SUM(total) AS total_value
FROM `analytics-engineers-club.coffee_shop.customers` co
  JOIN analytics-engineers-club.coffee_shop.orders o ON co.id = o.customer_id
WHERE co.name IN ('Catherine Huff', 'Aaron Newton', 'Jacob Smith', 'Shelly Black', 'Alex Lopez')
GROUP BY ALL
