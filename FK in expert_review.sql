--by Amin
ALTER TABLE expert_review
ADD CONSTRAINT fk_url
FOREIGN KEY (url) REFERENCES meta(url);