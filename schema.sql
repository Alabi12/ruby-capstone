CREATE DATABASE catalog_of_things;

CREATE TABLE item(
	id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	genre_id INT,
	author_id INT,
	label_id INT,
	publish_date DATE,
	archived BOOLEAN,
	FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (author_id) REFERENCES author (id) ON DELETE RESTRICT ON UPDATE CASCADE,
	FOREIGN KEY (label_id) REFERENCES label (id) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE author(
  ID SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

CREATE TABLE label(
  ID SERIAL PRIMARY KEY,
  title VARCHAR(30)
  color VARCHAR(30)
);

CREATE TABLE genre (
  id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(255)
);

CREATE table games (
  id serial primary key,
  published_date date,
  multiplayer varchar(255),
  last_played_at date
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  label_ID INT,
  author_ID INT,
  genre_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);
  
CREATE TABLE book(
  ID SERIAL PRIMARY KEY,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(30) NOT NULL,
  cover_state VARCHAR(10) NOT NULL,
  label_ID INT,
  author_ID INT,
  genre_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
);

CREATE TABLE music_album(
  id INT NOT NULL,
  on_spotify BOOLEAN,
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  label_ID INT,
  author_ID INT,
  genre_ID INT,
  FOREIGN KEY (label_ID) REFERENCES label(ID),
  FOREIGN KEY (author_ID) REFERENCES author(ID),
  FOREIGN KEY(genre_ID) REFERENCES genre(ID)
  FOREIGN KEY (id) REFERENCES item (id) ON DELETE RESTRICT ON UPDATE CASCADE
);
