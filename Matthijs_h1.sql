-- H1: Calculate box office metrics for "R" rated movies
WITH R_BoxOffice AS (
    SELECT
        m.rating,
        s.domestic_box_office,
        s.international_box_office,
        s.worldwide_box_office,
        s.avg_run_per_theatre
    FROM
        meta AS m
    LEFT JOIN
        sales AS s ON m.short_url = s.short_url
    WHERE
        m.rating = '| R'
),


-- Calculate box office metrics for "PG-13" movies
PG_13_BoxOffice AS (
    SELECT
        m.rating,
        s.domestic_box_office,
        s.international_box_office,
        s.worldwide_box_office,
        s.avg_run_per_theatre
    FROM
        meta AS m
    LEFT JOIN
        sales AS s ON m.short_url = s.short_url
    WHERE
	  m.rating = '| PG-13'
),

-- Calculate box office metrics for "PG" rated movies
PG_BoxOffice AS (
    SELECT
        m.rating,
        s.domestic_box_office,
        s.international_box_office,
        s.worldwide_box_office,
        s.avg_run_per_theatre
    FROM
        meta AS m
    LEFT JOIN
        sales AS s ON m.short_url = s.short_url
    WHERE
        m.rating = '| PG'
)

-- Combine the results for comparison
SELECT
    'R' AS movie_rating,
    AVG(domestic_box_office) AS avg_domestic_box_office,
    AVG(international_box_office) AS avg_international_box_office,
    AVG(worldwide_box_office) AS avg_worldwide_box_office,
    AVG(avg_run_per_theatre) AS avg_runtime_per_theatre
FROM
    R_BoxOffice
UNION ALL
SELECT
    'PG-13' AS movie_rating,
    AVG(domestic_box_office) AS avg_domestic_box_office,
    AVG(international_box_office) AS avg_international_box_office,
    AVG(worldwide_box_office) AS avg_worldwide_box_office,
    AVG(avg_run_per_theatre) AS avg_runtime_per_theatre
FROM
    PG_13_BoxOffice
UNION ALL
SELECT
    'PG' AS movie_rating,
    AVG(domestic_box_office) AS avg_domestic_box_office,
    AVG(international_box_office) AS avg_international_box_office,
    AVG(worldwide_box_office) AS avg_worldwide_box_office,
    AVG(avg_run_per_theatre) AS avg_runtime_per_theatre
FROM
    PG_BoxOffice;