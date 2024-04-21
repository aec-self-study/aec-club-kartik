SELECT 
  c.id, 
  c.name, 
  c.email, 
  COUNT(o.id), 
  MIN(o.created_at)
FROM `analytics-engineers-club.coffee_shop.customers` c
  JOIN analytics-engineers-club.coffee_shop.orders o ON c.id = o.customer_id
WHERE c.name IN ('Catherine Huff', 'Aaron Newton', 'Jacob Smith', 'Shelly Black', 'Alex Lopez')
GROUP BY ALL