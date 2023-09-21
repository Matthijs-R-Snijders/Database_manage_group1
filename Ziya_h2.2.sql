--H2.2 Average of 4 to 7 days of the run per theatre compared to general
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
        ms.Avg_run_per_theatre
	    
    FROM
        MovieSales ms
    INNER JOIN
        meta m ON ms.release_date > m.release_date
            AND ms.release_date - INTERVAL '7 days' <= m.release_date AND ms.release_date - INTERVAL '4 day' > m.release_date
            AND ms.short_url != m.short_url
    WHERE
        ms.production_budget > 18203900.847284578

)
SELECT
    AVG(am.Avg_run_per_theatre) AS avg_4_7days_Avg_run_per_theatre,
	(SELECT AVG(Avg_run_per_theatre) FROM sales) AS general_Avg_run_per_theatre

FROM
    AdjacentMovies4_7 am;