WITH c_profit AS(
SELECT c.*, p.profit, p.production_year
FROM {{ source("imdb","cast_sample") }} AS c, {{ ref("clean_profit") }} AS p
WHERE c.movie_id = p.movie_id)
SELECT a.*, AVG(profit) AS avg_profit, MAX(production_year) AS latest_year
FROM c_profit cp NATURAL JOIN {{ source("imdb","actor_sample") }} AS a
GROUP BY (a.id, a.name, a.gender)
