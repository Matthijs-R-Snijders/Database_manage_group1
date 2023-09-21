--H1.2 averages 4 to 7 days compared to general
WITH MovieSales AS (
    SELECT
        s.release_year,
        s.worldwide_box_office,
        s.production_budget,
        s.Avg_run_per_theatre,
        m.release_date,
        m.short_url 
    FROM
        sales s
    INNER JOIN
        meta m ON s.short_url = m.short_url
),
AdjacentMovies4_7 AS (
    SELECT
        ms.release_date,
        ms.short_url,  
        ms.production_budget,
        ms.worldwide_box_office
	    
    FROM
        MovieSales ms
    INNER JOIN
        meta m ON ms.release_date > m.release_date
            AND ms.release_date - INTERVAL '7 days' <= m.release_date AND ms.release_date - INTERVAL '4 day' > m.release_date
            AND ms.short_url != m.short_url
    WHERE
        ms.production_budget > 5352385.72
)
SELECT
    AVG(am.worldwide_box_office) AS avg_4_7days_worldwide_box_office,
    (SELECT AVG(worldwide_box_office) FROM sales) AS general_avg_worldwide_box_office
FROM
    AdjacentMovies4_7 am;