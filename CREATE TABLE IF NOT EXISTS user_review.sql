--by Youssef
CREATE TABLE IF NOT EXISTS user_review(
url varchar not null,
idvscore numeric not null,
reviewer varchar not null,
Review_date varchar not null,
thumbsUp numeric not null,
thumbsTot numeric not null,
Short_url varchar,
user_review_ID int primary key not null
);

COPY user_review
FROM 'C:\Users\Public\tsv\UserReviewers_Data_Clean.tsv'
DELIMITER E'\t'
CSV HEADER;