--by Matthijs
CREATE TABLE sales (
	genre_ID int not null,
	short_url varchar primary key not null,
	release_year varchar not null,
    title varchar not null,
    international_box_office numeric(20,2),
    domestic_box_office numeric(20,2),
    worldwide_box_office numeric(20,2),
    production_budget numeric(20,2),
    theatre_count numeric(20,2),
    Avg_run_per_theatre numeric(20,2),
    url varchar not null
);

COPY sales
FROM 'C:\Users\Public\tsv\Sales_Data_clean.tsv'
DELIMITER E'\t'
CSV HEADER;