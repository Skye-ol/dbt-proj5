WITH available_info AS (SELECT info_type_id
FROM {{ source('imdb','movie_info_sample') }} AS mis
GROUP BY info_type_id
HAVING count(info) > 0)
SELECT info
FROM {{ source('imdb','info_type') }} AS it, available_info
WHERE it.id = available_info.info_type_id
