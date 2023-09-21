-- Hypothesis 2: Impact of Increasing Domestic-to-Worldwide Ratio on International on Movies Released between 2000 and 2021 (Excluding Movies with < $20,000,000 Domestic Sales)
WITH DomesticAndWorldwide AS (
    SELECT
        title,
        domestic_box_office,
        international_box_office,
        (domestic_box_office / worldwide_box_office) * 100 AS dom_to_world_ratio,
	    release_year
    FROM
        sales
    WHERE
        domestic_box_office >= 20000000
        AND international_box_office > 0  -- Only include movies with both domestic and International sales
        AND cast(release_year as integer) BETWEEN 2000 AND 2021  -- Filter by release year
)

-- Query to analyze the impact and calculate the correlation
SELECT
    title,
    dom_to_world_ratio,
	release_year
FROM
    DomesticAndWorldwide
GROUP BY
    title,
	release_year,
	dom_to_world_ratio
ORDER BY
    release_year DESC;  -- Sort in descending order