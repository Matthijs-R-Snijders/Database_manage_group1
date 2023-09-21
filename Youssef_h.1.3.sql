-- H1.3 Calculate the average box office revenue per genre for multiple release years
SELECT
    genre_id,
    release_year,
    AVG(worldwide_box_office) AS average_box_office
FROM
    sales
WHERE
    CAST(release_year AS integer) BETWEEN 2010 AND 2020  -- Specify the desired release years
GROUP BY
    genre_id, release_year
ORDER BY
    genre_id, release_year;
