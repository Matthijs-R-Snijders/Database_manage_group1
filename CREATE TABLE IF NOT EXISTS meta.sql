--by Ziya
CREATE TABLE IF NOT EXISTS meta(
short_url varchar not null,
title varchar not null,
director_id int not null,
url varchar primary key not null,
rating varchar,
runtime numeric(20,2) not null,
cast_members varchar not null,
release_date date
);

COPY meta
FROM 'C:\Users\Public\tsv\meta_Data_clean.tsv'
DELIMITER E'\t'
CSV HEADER;