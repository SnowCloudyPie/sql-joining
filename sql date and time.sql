/* Создайте запрос, который вернет список всех фильмов из таблицы movies выпущеных после 1990-го года.
Выберите поля title , rating и  release_year
Значения поля title преобразовать в верхний регистр.
В новом поле publish_time должно храниться новое время: 9:49:00 для всех фильмов */


SELECT UPPER (title) AS title,
       rating,
       release_year,
       MAKETIME (09,49,00) AS publish_time
      
  FROM movies
 WHERE release_year > 1990;

/* Создайте запрос, который вернет список всех фильмов из таблицы movies. 
Выберите поля title , rating и release_year
Значения поля title преобразовать в нижний регистр.
В новом поле month для каждого фильма необходимо отобразить месяц выхода основываясь на значение поля release_date 
и преобразовать значение поля month в нижний регистр.
Результат должен быть отсортирован по полю release_year в порядке убывания. */

SELECT LOWER (title) AS title,
       rating,
       release_year,
       LOWER(MONTHNAME (release_date)) AS month      
  FROM movies
 ORDER BY release_year DESC;

/*Создайте запрос, который вернет список всех фильмов из таблицы movies.
Выберите поля title , rating и release_year
Значения поля title преобразовать в верхний регистр.
В новом поле day для каждого фильма необходимо отобразить день выхода основываясь на значение поля release_date 
и преобразовать значение поля day в верхний регистр.
Результат должен быть отсортирован по полю release_year в порядке убывания.*/

SELECT UPPER (title) AS title,
       rating,
       release_year,
       UPPER(DAYNAME (release_date)) AS day     
  FROM movies
 ORDER BY release_year DESC;

/*Создайте запрос, который вернет список всех фильмов из таблицы movies выпущеных после 1990-го года.
Выберите поля title , и  rating
Значения поля title преобразовать в верхний регистр.
В новом поле world_publish_date  должна хранится новая дата для всех фильмов. 
К году из поля release_date прибавьте 30 дней и выведите результат.*/

SELECT UPPER (title) AS title,
       rating,
       MAKEDATE(YEAR(release_date), 30) AS world_publish_date        
  FROM movies
 WHERE YEAR(release_date) >1990;

