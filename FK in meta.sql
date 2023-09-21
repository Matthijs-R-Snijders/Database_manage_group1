--by Ziya
ALTER TABLE meta
ADD CONSTRAINT fk_short_url
FOREIGN KEY (short_url) REFERENCES sales(short_url);

ALTER TABLE meta
ADD CONSTRAINT fk_director_id
FOREIGN KEY (director_id) REFERENCES director(director_id);