WITH domestic_movie AS
(SELECT movie_id, title, info, CAST(REGEXP_REPLACE(REGEXP_REPLACE(info,'\$([0-9,]*) (.*)','\1'),',','','g') AS float) AS dollar
FROM  {{ source('imdb','movie_info_sample')}} AS mis,
{{ source('imdb','movie_sample')}} AS ms
WHERE mis.movie_id = ms.id
AND info_type_id = 107
AND info LIKE '$%(USA)%')
SELECT movie_id, title, MAX(dollar) AS gross
FROM domestic_movie
GROUP BY movie_id,title
