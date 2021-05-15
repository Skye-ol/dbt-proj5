{{ config(materialized = 'incremental')}}

SELECT production_year, AVG(profit) AS avg_profit
FROM {{ ref('clean_profit') }}
GROUP BY production_year
{% if is_incremental() %}
HAVING production_year > (SELECT MAX(production_year) FROM {{ this }})
{% endif %}
