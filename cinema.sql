CREATE DATABASE cinema;

\c cinema;

CREATE TABLE movies (id SERIAL PRIMARY KEY, name VARCHAR(255), main_actor VARCHAR(255), image_url VARCHAR(255), total_made DECIMAL);

INSERT INTO movies (name, main_actor, image_url, total_made) VALUES ('Lion', 'Dev Patel', 'http://adoptionsupport.org/wp-content/uploads/2017/01/Lion-movie-image.png', 51694854.00);