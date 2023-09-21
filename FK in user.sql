--by Youssef
ALTER TABLE users
ADD CONSTRAINT fk_user_review_id
FOREIGN KEY (user_review_id) REFERENCES user_review(user_review_id);
