-- Hypothesis 1: Impact of Domestic Sales >= $20,000,000 on International and Worldwide Sales
WITH HighDomesticSales AS (
    SELECT
        title,
        domestic_box_office,
        international_box_office,
        worldwide_box_office,
        (international_box_office / domestic_box_office) AS intl_to_dom_ratio,
        (worldwide_box_office / domestic_box_office) AS world_to_dom_ratio
    FROM
        sales
    WHERE
        domestic_box_office >= 20000000
        AND international_box_office > 0  -- Only include rows with positive international sales
)

-- Query to analyze the impact and calculate average ratios
SELECT
    AVG(intl_to_dom_ratio) AS avg_intl_to_dom_ratio,
    AVG(world_to_dom_ratio) AS avg_world_to_dom_ratio
FROM
    HighDomesticSales;