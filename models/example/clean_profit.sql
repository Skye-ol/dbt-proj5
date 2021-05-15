SELECT g.movie_id, g.title, (g.gross-b.budget) AS profit, b.production_year
FROM {{ ref('clean_gross')}} AS g, {{ ref('clean_budget')}} AS b
WHERE g.movie_id = b.movie_id
