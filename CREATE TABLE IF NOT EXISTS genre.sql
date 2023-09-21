--by Matthijs
CREATE TABLE genre(
	genre varchar,
	genre_ID int primary key not null
);

COPY genre
FROM 'C:\Users\Public\tsv\genre_Data_Clean.tsv'
DELIMITER E'\t'
CSV HEADER;