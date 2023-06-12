-- 1. Вывести сколько фильмов сняла кинокомпания Universal Pictures.
select count(movies.title) from movies join companies on companies.id = movies.companies_id where companies.title = "Universal Pictures";
-- 2. Вывести сколько всего фильмов было снято режиссером Фрэнсисом Фордом Копполой.
select count(movies.title) from movies join directors on directors.id = movies.directors_id where directors.full_name = "Фрэнсис Форд Коппола";
-- 3. Вывести количество снятых фильмов за последние 20 лет.
select count(*) from movies where year between (year(curdate()) - 20) and year(curdate());
-- 4. Вывести все жанры фильмов в которых снимал Стивен Спилберг в течении всей своей карьеры. 
select distinct genres.title from genres join movies on genres.id = movies.genres_id join directors on directors.id = movies.directors_id where directors.full_name = "Стивен Спилберг";
-- 5. Вывести названия, жанры и режиссеров 5 самых дорогих фильмов.
select movies.title, genres.title, directors.full_name from movies join genres on genres.id = movies.genres_id join directors on directors.id = directors_id order by budget desc limit 5;
-- 6. Вывести имя режиссера с самым большим количеством фильмов.
select directors.full_name from directors join movies on directors.id = directors_id group by directors.full_name order by count(movies.title) desc limit 1;
-- 7.Вывести названия и жанры фильмов, снятые самой большой кинокомпанией (по сумме всех бюджетов фильмов)
select movies.title, genres.title from movies join genres on genres.id = movies.genres_id where companies_id = (select companies.id from companies join movies on movies.companies_id = companies.id group by companies.id order by sum(movies.budget) desc limit 1);
-- 8. Вывести средний бюджет фильмов, снятых кинокомпанией Warner Bros.
select avg(movies.budget) from movies join companies on companies.id = companies_id where companies.title = "Warner Bros.";
-- 9. Вывести количество фильмов каждого жанра и средний бюджет по жанру. 
select count(movies.title), genres.title, avg(movies.budget) from movies join genres on genres.id = genres_id group by genres.title;
-- 10. Найти и удалить комедию "Дикие истории" 2014-го года. 
delete movies from movies join genres on genres.id = movies.genres_id where genres.title = 'комедия' and movies.title = 'Дикие истории' and movies.year = 2014;