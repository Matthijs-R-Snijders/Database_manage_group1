-- by Amin
CREATE TABLE IF NOT EXISTS expert(
reviewer varchar,
expert_review_ID int not null,
expert_reviewer_ID int primary key not null
);

COPY expert
FROM 'C:\Users\Public\tsv\Expert_Data_clean.tsv'
DELIMITER E'\t'
CSV HEADER;