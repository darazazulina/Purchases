-- ЗАПРОСЫ ДЛЯ МЕТРИК --

-- 1) какую сумму в среднем в месяц тратит: пользователи в возрастном диапазоне от 18 до 25 лет включительно
SELECT strftime('%m', date) AS month, AVG(price) AS avg_by_month
FROM Purchases p
LEFT JOIN Items i
  ON p.item_id = i.item_id
LEFT JOIN Users u
  ON p.user_id = u.user_id
WHERE age >= 18 AND age <= 25
GROUP BY strftime('%m', date);

-- 2) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая
SELECT strftime('%m', date) AS month, SUM(price) AS revenue
FROM Purchases p
LEFT JOIN Items i
  ON p.item_id = i.item_id
LEFT JOIN Users u
  ON p.user_id = u.user_id
WHERE age > 35
GROUP BY strftime('%m', date)
ORDER BY SUM(price) DESC
LIMIT 1;

-- 3) какой товар дает наибольший вклад в выручку за последний год
SELECT item_id, item_revenue
FROM (
  SELECT item_id, 
         SUM(price) AS item_revenue, 
         RANK() OVER (ORDER BY SUM(price) DESC) AS top_rev
  FROM Items
  GROUP BY item_id
)
WHERE top_rev = 1;

-- 4) топ-3 товаров по выручке и их доля в общей выручке за любой год
SELECT item_id,
       share
FROM (
  SELECT item_id, 
       share,
       RANK() OVER (ORDER BY share DESC) AS top_rev
  FROM (
    SELECT item_id, 
           ROUND(SUM(price) OVER (PARTITION BY item_id) / SUM(price) OVER (), 3) AS share
    FROM Items
  ) 
)
WHERE top_rev <= 3;

