--by Matthijs
ALTER TABLE sales
ADD CONSTRAINT fk_genre_id
FOREIGN KEY (genre_id) REFERENCES genre(genre_id);