SELECT
	u.name,
	u.email,
	ROUND(SUM(o.quantity * p.price), 2) AS total_amount_spent
FROM
	users AS u
	JOIN orders AS o ON u.id = o.user_id
	JOIN products AS p ON o.product_id = p.id
WHERE
	p.category = 'Electronics'
GROUP BY
	u.id
HAVING
	COUNT(o.id) >= 3
	AND SUM(o.quantity * p.price) > 1000
ORDER BY
	total_amount_spent DESC;