--by Matthijs
ALTER TABLE has_genre
ADD CONSTRAINT fk_genre_ID
FOREIGN KEY (genre_ID) REFERENCES genre(genre_ID);

ALTER TABLE has_genre
ADD CONSTRAINT fk_sales
FOREIGN KEY (short_url) REFERENCES sales(short_url)