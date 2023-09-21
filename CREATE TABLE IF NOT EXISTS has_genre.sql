--Mathijs
CREATE TABLE has_genre(
	short_url varchar not null,
	genre_id int not null,
	has_genre_ID int primary key not null
);

COPY has_genre
FROM 'C:\Users\Public\tsv\has_genre_Data_clean.tsv'
DELIMITER E'\t'
CSV HEADER;