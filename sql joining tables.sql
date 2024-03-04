/* Создайте запрос, который вернет все возможные комбинации строк из таблицы movies и actors.
Для каждого фильма в таблице movies должны быть произведены все возможные комбинации с каждым актером из таблицы actors.
Результат должен быть отсортирован по полю title из таблицы movies в порядке убывания.*/

SELECT movies.title,actors.name 
  FROM movies
 CROSS JOIN actors
ORDER BY movies.title DESC;
   

/* Создайте запрос, для того чтобы получить список фильмов из таблицы movies жанра Action 
и отзывы для этих фильмов из таблицы reviews.
Важно! Вывести только те фильмы у которых есть отзывы в таблице reviews */

SELECT movies.title  AS title,
       reviews.comment as comment
  FROM movies
 INNER JOIN reviews
  ON reviews.movie_id=movies.id
 WHERE movies.genre LIKE 'Action';
   
   
/* Создайте запрос, для того чтобы получить список фильмов из таблицы movies жанра Action 
и отзывы для этих фильмов из таблицы reviews .
Важно! Вывести все фильмы, даже если у них нет отзывов в таблице reviews */

SELECT title AS movie, COALESCE(reviews.comment, 'Нет отзыва') AS review
  FROM movies
  LEFT JOIN reviews
 ON movies.id = reviews.movie_id
 WHERE movies.genre LIKE 'Action';
 

/*Создайте запрос, который вернет список всех фильмов из таблицы movies и связанных с ними 
жанров и режиссеров из таблиц genres и directors. 
А также ваш запрос должен выбрать и подсчитать количество отзывов для каждого фильма 
и записать результат в новое поле reviews_count, 
если отзывов у фильма нет, тогда в новом поле reviews_count должно быть записано значение 0.
Результат должен быть отсортирован по полю title из таблицы movies в порядке убывания */

SELECT movies.title AS title,
       directors.name as director, 
       genres.name as genre, 
       IF(COUNT(reviews.movie_id)>0, COUNT(reviews.movie_id), 0) AS reviews_count 
FROM movies
LEFT JOIN directors
ON director_id=directors.id
INNER JOIN genres
ON genre_id=genres.id
LEFT JOIN reviews
ON reviews.movie_id=movies.id
GROUP BY movies.id
ORDER BY title DESC;

/* Создайте запрос, который вернет список фильмов из таблицы movies 
и связанных с ними жанров и режиссеров из таблиц genres и directors. 
А также ваш запрос должен выбрать и подсчитать количество отзывов для каждого фильма 
и записать результат в новое поле reviews, в формате Отзывов: N - где N - это количество отзывов.
Запрос должен вернуть только те фильмы, у которых отзывов больше 1.
Результат должен быть отсортирован по полю title из таблицы movies в порядке убывания. */

SELECT movies.title AS title,
       directors.name as director, 
       genres.name as genre, 
       IF(COUNT(reviews.movie_id)>0, CONCAT('Отзывов: ', COUNT(reviews.movie_id)), 'Отзывов: 0') AS reviews     
FROM movies
LEFT JOIN directors
ON director_id=directors.id
INNER JOIN genres
ON genre_id=genres.id
LEFT JOIN reviews
ON reviews.movie_id=movies.id
GROUP BY movies.id
HAVING (COUNT(reviews.movie_id)) >1
ORDER BY title DESC;

/* Создайте запрос, который вернет список фильмов из таблицы movies 
и связанных с ними жанров и режиссеров из таблиц genres и directors. 
А также ваш запрос должен выбрать и подсчитать количество отзывов для каждого фильма и записать результат в новое поле reviews.
Также ваш запрос должен вернуть средний рейтинг каждого фильма основанный на отзывах в таблице reviews, 
если у фильма нет отзывов (с рейтингом) тогда рейтинг для такого фильма должно быть равно 0. 
Результат должен быть отсортирован по полю title из таблицы movies в порядке убывания. */

SELECT movies.title AS title,
       directors.name as director, 
       genres.name as genre, 
       IF ((ROUND(AVG(reviews.rating),0)) IS NULL, 0,(ROUND(AVG(reviews.rating),0))) AS rating,
       COUNT(reviews.movie_id) AS reviews
     FROM movies
LEFT JOIN directors
ON director_id=directors.id
INNER JOIN genres
ON genre_id=genres.id
LEFT JOIN reviews
ON movies.id = reviews.movie_id
GROUP BY movies.id
ORDER BY title DESC;

/* Создайте запрос, который вернет каждый второй фильм из таблицы movies 
и связанных с ними жанров и режиссеров из таблиц genres и directors. 
А также ваш запрос должен выбрать и подсчитать количество отзывов для каждого фильма и записать результат в новое поле reviews.
Также ваш запрос должен вернуть средний рейтинг каждого фильма основанный на отзывах в таблице reviews, 
если у фильма нет отзывов (с рейтингом) тогда рейтинг для такого фильма должно быть равно 0. 
Результат должен быть отсортирован по полю id из таблицы movies в порядке убывания. */

SELECT movies.id AS id,
       movies.title AS title,
       directors.name as director, 
       genres.name as genre, 
       IF ((ROUND(AVG(reviews.rating),0)) IS NULL, 0,(ROUND(AVG(reviews.rating),0))) AS rating,
       COUNT(reviews.movie_id) AS reviews 
  FROM movies
LEFT JOIN directors
ON director_id=directors.id
INNER JOIN genres
ON genre_id=genres.id
LEFT JOIN reviews
ON movies.id = reviews.movie_id
WHERE movies.id % 2 = 0
GROUP BY movies.id
ORDER BY id DESC;