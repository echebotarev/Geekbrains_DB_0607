DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);

DROP TABLE IF EXISTS media;
CREATE TABLE media (
	id SERIAL PRIMARY KEY,
	user_id INT UNSIGNED,
	name VARCHAR(255),
	description VARCHAR(255),
	KEY index_of_user_id(user_id)
);

DROP TABLE IF EXISTS keywords;
CREATE TABLE keywords (
	id SERIAL PRIMARY KEY,
	keyword VARCHAR(255),
	UNIQUE unique_keyword(keyword(10))
);

DROP TABLE IF EXISTS media_keywords;
CREATE TABLE media_keywords (
  media_id INT UNSIGNED,
  keyword_id INT UNSIGNED,
  PRIMARY KEY (media_id, keyword_id),
  FOREIGN KEY media_id REFERENCES media (id),
  FOREIGN KEY keyword_id REFERENCES keywords (id)
);