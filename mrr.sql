SELECT
	date_month,
	sum(is_active::integer) as customers,
	sum(mrr) as mrr
FROM analytics.fact_mrr
GROUP BY 1
