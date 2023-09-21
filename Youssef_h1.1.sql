-- H1.1 Find the genre_id with the highest average worldwide_box_office between 2000 and 2021
SELECT
    genre_id,
    AVG(worldwide_box_office) AS avg_box_office
FROM
    sales
WHERE
    CAST(release_year AS integer) BETWEEN 2000 AND 2021
GROUP BY
    genre_id
ORDER BY
    avg_box_office DESC
LIMIT 1;