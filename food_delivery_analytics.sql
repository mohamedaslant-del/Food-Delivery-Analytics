USE food_delivery_analytics;

-- 1. Total Orders
SELECT COUNT(*) AS total_orders
FROM food_orders;

-- 2. Revenue by Platform
SELECT platform,
       COUNT(*) AS total_orders,
       ROUND(SUM(order_value), 2) AS total_revenue
FROM food_orders
GROUP BY platform
ORDER BY total_revenue DESC;

-- 3. Orders by Cuisine
SELECT cuisine,
       COUNT(*) AS total_orders
FROM food_orders
GROUP BY cuisine
ORDER BY total_orders DESC;

-- 4. Average Delivery Time by Platform
SELECT platform,
       ROUND(AVG(delivery_time), 2) AS avg_delivery_time
FROM food_orders
GROUP BY platform
ORDER BY avg_delivery_time ASC;

-- 5. Average Restaurant Rating by Platform
SELECT platform,
       ROUND(AVG(restaurant_rating), 2) AS avg_rating
FROM food_orders
GROUP BY platform
ORDER BY avg_rating DESC;

-- 6. Top 5 Localities by Revenue
SELECT locality,
       COUNT(*) AS total_orders,
       ROUND(SUM(order_value), 2) AS total_revenue
FROM food_orders
GROUP BY locality
ORDER BY total_revenue DESC
LIMIT 5;

-- 7. Top 5 Cuisines by Revenue
SELECT cuisine,
       COUNT(*) AS total_orders,
       ROUND(SUM(order_value), 2) AS total_revenue
FROM food_orders
GROUP BY cuisine
ORDER BY total_revenue DESC
LIMIT 5;

-- 8. Peak Ordering Hour
SELECT HOUR(`timestamp`) AS order_hour,
       COUNT(*) AS total_orders
FROM food_orders
WHERE `timestamp` IS NOT NULL
GROUP BY HOUR(`timestamp`)
ORDER BY total_orders DESC;

-- 9. Top 5 Dates by Order Count
SELECT DATE(`timestamp`) AS order_date,
       COUNT(*) AS total_orders
FROM food_orders
WHERE `timestamp` IS NOT NULL
GROUP BY DATE(`timestamp`)
ORDER BY total_orders DESC
LIMIT 5;