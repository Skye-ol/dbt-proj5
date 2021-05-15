WITH actor_movie AS(
WITH cast_movie AS(
SELECT person_id, movie_id, title
FROM {{ source("imdb","cast_sample")}} c NATURAL JOIN {{ source("imdb","movie_sample")}} m)
SELECT a.*, movie_id, title
FROM {{ source("imdb","actor_sample")}} a, cast_movie cm
WHERE a.id = cm.person_id)
SELECT am.id, am.name, am.gender, MAX(profit) AS most_profit
FROM actor_movie am, {{ ref('clean_profit')}} p
WHERE am.movie_id = p.movie_id
GROUP BY am.id, am.name, am.gender
