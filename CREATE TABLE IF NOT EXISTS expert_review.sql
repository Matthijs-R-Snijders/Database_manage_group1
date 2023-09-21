--by Amin
CREATE TABLE IF NOT EXISTS expert_review(
url varchar,
idvscore numeric(20,2),
reviewer varchar,
short_url varchar,
expert_review_ID int primary key not null
);

COPY expert_review
FROM 'C:\Users\Public\tsv\ExpertReviewers_Data_Clean.tsv'
DELIMITER E'\t'
CSV HEADER;