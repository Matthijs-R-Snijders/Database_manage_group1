--by Youssef
CREATE TABLE IF NOT EXISTS users(
reviewer varchar not null,
user_review_ID int not null,
reviewer_ID int primary key not null
);

COPY users
FROM 'C:\Users\Public\tsv\User_Data_clean.tsv'
DELIMITER E'\t'
CSV HEADER;