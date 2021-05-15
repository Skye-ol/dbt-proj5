SELECT CAST(REGEXP_REPLACE(info,'[^0-9]','','g') AS float) AS budget, movie_id, title, production_year
FROM {{ source('imdb','movie_info_sample')}} AS mis,
{{ source('imdb','movie_sample')}} AS ms
WHERE info_type_id = '105'
AND mis.movie_id = ms.id
