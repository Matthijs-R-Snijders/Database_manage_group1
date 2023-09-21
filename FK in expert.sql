--by Amin
ALTER TABLE expert
ADD CONSTRAINT fk_expert_review_id
FOREIGN KEY (expert_review_id) REFERENCES expert_review(expert_review_id);