--by Ziya
CREATE TABLE IF NOT EXISTS director(
director_name varchar not null,
director_ID int primary key not null
	
);

COPY director
FROM 'C:\Users\Public\tsv\director_Data_clean.tsv'
DELIMITER E'\t'
CSV HEADER;