WITH id_movie AS (SELECT person_id, count(*) AS number
FROM {{ source("imdb","cast_sample") }} AS c
WHERE role_id = 1
GROUP BY person_id)
SELECT i.person_id, a.name, i.number
FROM  id_movie i
LEFT JOIN {{ source("imdb","actor_sample") }} AS a ON a.id = i.person_id
