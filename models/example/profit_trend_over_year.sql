WITH lag_profit AS(
SELECT *, LAG(avg_profit, 1) OVER (ORDER BY production_year DESC) AS last_year_avg_profit
FROM {{ ref('year_profit') }}
)
SELECT production_year, (avg_profit - last_year_avg_profit) AS profit_diff
FROM lag_profit
