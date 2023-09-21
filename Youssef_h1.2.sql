-- H1.2 Calculate average global box office revenue for action movies and other genres
SELECT
    AVG(CASE WHEN genre_id = '9' THEN worldwide_box_office ELSE 0 END) AS avg_adventure_revenue,
    AVG(CASE WHEN genre_id IN ('1', '2', '4', '5', '7', '8', '10', '13') THEN worldwide_box_office ELSE 0 END) AS avg_other_genre_revenue
FROM
    sales
WHERE
    CAST(release_year AS integer) BETWEEN 2010 AND 2020;  -- Adjust the date range as needed

-- Determine if the difference in average revenue is statistically significant
SELECT
    CASE
        WHEN avg_action_revenue > avg_other_genre_revenue THEN 'Action movies have higher average revenue.'
        WHEN avg_action_revenue < avg_other_genre_revenue THEN 'Other genres have higher average revenue.'
        ELSE 'There is no significant difference in average revenue.'
    END AS result
FROM
    (
        -- Subquery to calculate average revenue
        SELECT
            AVG(CASE WHEN genre_id = '9' THEN worldwide_box_office ELSE 0 END) AS avg_action_revenue,
            AVG(CASE WHEN genre_id IN ('1', '2', '4', '5', '7', '8', '10', '13') THEN worldwide_box_office ELSE 0 END) AS avg_other_genre_revenue
        FROM
            sales
        WHERE
            CAST(release_year AS integer) BETWEEN 2010 AND 2020  -- Adjust the date range as needed
    ) AS subquery;

