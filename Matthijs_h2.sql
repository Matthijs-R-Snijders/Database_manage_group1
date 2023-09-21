-- H2 Calculate box office metrics for PG-rated movies by genre
WITH PG_Genre_BoxOffice AS (
    SELECT distinct
        m.rating,
        m.runtime,
        g.genre_id,
        g.genre AS genre_name,
        s.domestic_box_office,
        s.international_box_office,
        s.worldwide_box_office,
        s.avg_run_per_theatre
    FROM
        meta AS m
    INNER JOIN
        sales AS s ON m.short_url = s.short_url
    INNER JOIN
        genre AS g ON s.genre_id = g.genre_ID
    WHERE
        LEFT(REPLACE(m.rating, '| ', ''), 2) = 'PG'
),

-- Calculate box office metrics for non-PG-rated movies by genre
Non_PG_Genre_BoxOffice AS (
    SELECT
        m.rating,
        m.runtime,
        g.genre_id,
        g.genre AS genre_name,
        s.domestic_box_office,
        s.international_box_office,
        s.worldwide_box_office,
        s.avg_run_per_theatre
    FROM
	meta AS m
    INNER JOIN
        sales AS s ON m.short_url = s.short_url
    INNER JOIN
        genre AS g ON s.genre_id = g.genre_ID
    WHERE
        m.rating <> 'PG'
)

-- Combine the results for comparison
SELECT
    'PG' AS movie_rating,
    genre_name AS genre,
    AVG(domestic_box_office) AS avg_domestic_box_office,
    AVG(international_box_office) AS avg_international_box_office,
    AVG(worldwide_box_office) AS avg_worldwide_box_office,
    AVG(avg_run_per_theatre) AS avg_runtime_per_theatre
FROM
    PG_Genre_BoxOffice
GROUP BY
    genre_name

UNION ALL

SELECT
    'Non-PG' AS movie_rating,
    genre_name AS genre,
    AVG(domestic_box_office) AS avg_domestic_box_office,
    AVG(international_box_office) AS avg_international_box_office,
    AVG(worldwide_box_office) AS avg_worldwide_box_office,
    AVG(avg_run_per_theatre) AS avg_runtime_per_theatre
FROM
    Non_PG_Genre_BoxOffice
GROUP BY
    genre_name;