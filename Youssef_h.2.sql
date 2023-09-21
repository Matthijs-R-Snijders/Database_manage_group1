-- H2. Calculate runtime average per genre_ID
     SELECT
    s.genre_id,
    AVG(m.runtime) AS avg_runtime
FROM
        meta AS m
    INNER JOIN
        sales AS s ON m.short_url = s.short_url
GROUP BY
	s.genre_id
ORDER BY
    avg_runtime DESC;
