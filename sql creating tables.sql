/* Создайте таблицу movies с полями:
id типа INT с ключом PRIMARY KEY AUTO_INCREMENT
title типа VARCHAR(255) NOT NULL
release_year типа INT
genre типа VARCHAR(255)
rating типа INT
budget типа INT  */


CREATE TABLE movies (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    genre VARCHAR(255),
    rating INT,
    budget INT    
);

/* Создайте запрос который добавит три новые строки в таблицу movies  */

INSERT INTO movies (title, release_year, genre, rating, budget)
VALUES ('Inception', 2010, 'Thriller', 8, 160000000),
       ('Pulp Fiction', 1994, 'Crime', 8, 31500000),
       ('Fight Club', 1999, 'Drama', 8, 63000000);

/*Создайте запрос, который обновит значение в столбце rating для записи с заголовком "The Lion King" на 9 
и значение в столбце budget на 50000000  */

UPDATE movies
  SET rating = 9,
       budget = 50000000
 WHERE title = 'The Lion King';

/*Создайте запрос, который удалит строки из таблицы movies, где значение колонки id равно 2, 4, 8*/

DELETE FROM movies
 WHERE id IN ( 2, 4, 8 );

/*Создайте запрос, который удалит строки из таблицы movies, где значение колонки genre равно Drama или Crime*/

DELETE FROM movies
 WHERE genre IN ( 'Drama','Crime');
