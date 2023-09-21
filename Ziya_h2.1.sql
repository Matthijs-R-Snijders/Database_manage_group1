--H2.1 average 1 to 3 days run per theatre compared to general
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
AdjacentMovies1_3 AS (
    SELECT
        ms.release_date,
        ms.short_url,  
        ms.production_budget,
        ms.Avg_run_per_theatre
	    
    FROM
        MovieSales ms
    INNER JOIN
        meta m ON ms.release_date > m.release_date
            AND ms.release_date - INTERVAL '3 days' <= m.release_date AND ms.release_date - INTERVAL '1 day' > m.release_date
            AND ms.short_url != m.short_url
    WHERE
        ms.production_budget > 18203900.847284578

)
SELECT
    AVG(am.Avg_run_per_theatre) AS avg_1_3days_avg_run_per_theatre,
	(SELECT AVG(Avg_run_per_theatre) FROM sales) AS general_avg_run_per_theatre

FROM
    AdjacentMovies1_3 am;